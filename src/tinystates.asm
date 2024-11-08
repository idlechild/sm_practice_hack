; SD2SNES Savestate code
; by acmlm, total, Myria
;

macro wram_to_sram(wram_addr, size, sram_addr)
    dw $0000|$4312, <sram_addr>&$FFFF                            ; VRAM address >> 1.
    dw $0000|$4314, ((<sram_addr>>>16)&$FF)|((<size>&$FF)<<8)    ; A addr = $70xxxx, size = $xx00
    dw $0000|$4316, (<size>>>8)&$FF                              ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, <wram_addr>&$FFFF                            ; WRAM addr = $xx0000
    dw $1000|$2183, ((<wram_addr>>>16)&$FF)-$7E                  ; WRAM addr = $7Exxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                                          ; Trigger DMA on channel 1
endmacro

macro vram_to_sram(vram_addr, size, sram_addr)
    dw $0000|$2116, <vram_addr>>>1                               ; VRAM address >> 1.
    dw $9000|$213A, $0000                                        ; VRAM dummy read.
    dw $0000|$4312, <sram_addr>&$FFFF                            ; A addr = $xx0000
    dw $0000|$4314, ((<sram_addr>>>16)&$FF)|((<size>&$FF)<<8)    ; A addr = $70xxxx, size = $xx00
    dw $0000|$4316, (<size>>>8)&$FF                              ; size = $80xx ($0000), unused bank reg = $00.
    dw $1000|$420B, $02                                          ; Trigger DMA on channel 1
endmacro

macro sram_to_wram(wram_addr, size, sram_addr)
    dw $0000|$4312, <sram_addr>&$FFFF                            ; A addr = $xx0000
    dw $0000|$4314, ((<sram_addr>>>16)&$FF)|((<size>&$FF)<<8)    ; A addr = $70xxxx, size = $xx00
    dw $0000|$4316, (<size>>>8)&$FF                              ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, <wram_addr>&$FFFF                            ; WRAM addr = $xx0000
    dw $1000|$2183, ((<wram_addr>>>16)&$FF)-$7E                  ; WRAM addr = $7Exxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                                          ; Trigger DMA on channel 1
endmacro

macro sram_to_vram(vram_addr, size, sram_addr)
    dw $0000|$2116, <vram_addr>>>1                               ; VRAM address >> 1.
    dw $0000|$4312, <sram_addr>&$FFFF                            ; A addr = $xx0000
    dw $0000|$4314, ((<sram_addr>>>16)&$FF)|((<size>&$FF)<<8)    ; A addr = $70xxxx, size = $xx00
    dw $0000|$4316, (<size>>>8)&$FF                              ; size = $80xx ($0000), unused bank reg = $00.
    dw $1000|$420B, $02                                          ; Trigger DMA on channel 1
endmacro


org !ORG_SAVE
print pc, " tinysave start"

; These can be modified to do game-specific things before and after saving and loading
; Both A and X/Y are 16-bit here
pre_load_state:
{
    LDA !MUSIC_DATA : STA !SRAM_MUSIC_DATA
    LDA !MUSIC_TRACK : STA !SRAM_MUSIC_TRACK
    LDA !SOUND_TIMER : STA !SRAM_SOUND_TIMER

    ; Rerandomize
    LDA !sram_save_has_set_rng : BNE .done
    LDA !sram_rerandomize : AND #$00FF : BEQ .done
    LDA !CACHED_RANDOM_NUMBER : STA !SRAM_SAVED_RNG
    LDA !FRAME_COUNTER : STA !SRAM_SAVED_FRAME_COUNTER
    LDA !ram_seed_X : STA !sram_seed_X
    LDA !ram_seed_Y : STA !sram_seed_Y

  .done
    ; Force blank and disable NMI
    %a8()
    LDA #$80 : STA $2100
    LDA #$00 : STA $4200
    %ai16()

    ; Save the old room ID
    LDA !ROOM_ID : PHA

    ; Restore parts of LoRAM so we can load in the proper graphics etc
    ; This doesn't overwrite the stack.
    LDA #$8000 : STA $4310 ; A->B, vram addr
    LDA #$4000 : STA $4312 ; src addr
    LDA #$0070 : STA $4314 ; src bank
    LDA #$001F : STA $4316 ; size
    STZ $2181 : STZ $2183  ; clear HDMA
    LDA #$0002 : STA $420B ; initiate DMA

    ; Load graphics tiles and tile tables back into RAM/WRAM
    ; before restoring the rest of the state from SRAM
    JSL $82E76B
    JSL $82E97C  ; Load library background

    ; If we're in the same room, we don't need to reload the level
    PLA : CMP !ROOM_ID : BEQ .skip_load_level

    ; Load from compressed graphics to avoid BG3 issues
    JSL $82E7D3  ; Load level data, CRE, tile table, scroll data, create PLMs and execute door ASM and room setup ASM

  .skip_load_level
    JSL tinystates_preload_bg_data
    RTS
}

post_load_state:
{
    JSR post_load_music

    ; Reload OOB tile viewer if enabled
    LDA !ram_sprite_feature_flags : BIT !SPRITE_OOB_WATCH : BEQ .tileviewerDone
    JSL upload_sprite_oob_tiles
  .tileviewerDone

    ; Reload BG3 GFX if minimap setting changed
    LDA !ram_minimap : CMP !SRAM_SAVED_MINIMAP : BEQ .minimapDone
    JSL cm_transfer_original_tileset
    LDA !ram_minimap : BEQ .disableMinimap
    ; Enabled minimap, clear stale tiles
    LDA !IH_BLANK
    STA !HUD_TILEMAP+$3A : STA !HUD_TILEMAP+$7A : STA !HUD_TILEMAP+$BA
    LDA #$2C1E ; minimap border
    STA !HUD_TILEMAP+$46 : STA !HUD_TILEMAP+$86 : STA !HUD_TILEMAP+$C6
    BRA .minimapDone
  .disableMinimap
    LDA !IH_BLANK : STA !HUD_TILEMAP+$7C : STA !HUD_TILEMAP+$7E
  .minimapDone

    ; Reload custom HUD number GFX
    JSL overwrite_HUD_numbers

    ; Rerandomize
    LDA !sram_save_has_set_rng : BNE .done
    LDA !sram_rerandomize : AND #$00FF : BEQ .done
    LDA !SRAM_SAVED_RNG : STA !CACHED_RANDOM_NUMBER
    LDA !SRAM_SAVED_FRAME_COUNTER : STA !FRAME_COUNTER
    LDA !sram_seed_X : STA !ram_seed_X
    LDA !sram_seed_Y : STA !ram_seed_Y
    JSL MenuRNG ; rerandomize hack RNG

  .done
    JSL init_wram_based_on_sram

  .return
    ; Re-enable NMI, turn on force-blank and wait NMI to execute.
    ; This prevents some annoying flashing when loading states where
    ; graphics changes otherwise happens mid-frame
    JSL $80834B
    JSL $80836F
    RTS
}

post_load_music:
{
    JSL stop_all_sounds

    LDY !MUSIC_TRACK
    LDA $0639 : CMP $063B : BEQ .music_queue_empty

    DEC : DEC : AND #$000E : TAX
    LDA $0619,X : BMI .queued_music_data
    TXA : TAY : CMP $063B : BEQ .no_music_data

  .music_queue_data_search
    DEC : DEC : AND #$000E : TAX
    LDA $0619,X : BMI .queued_music_data
    TXA : CMP $063B : BNE .music_queue_data_search

  .no_music_data
    ; No data found in queue, check if we need to insert it
    LDA !SRAM_MUSIC_DATA : CMP !MUSIC_DATA : BEQ .music_queue_increase_timer

    ; Insert queued music data
    DEX : DEX : TXA : AND #$000E : TAX
    LDA #$FF00 : CLC : ADC !MUSIC_DATA : STA $0619,X
    LDA #$0008 : STA $0629,X

  .queued_music_data
    BRA .queued_music_data_clear_track

  .music_queue_empty
    LDA !SRAM_MUSIC_DATA : CMP !MUSIC_DATA : BNE .clear_track_load_data
    BRL .check_track

  .clear_track_load_data
    LDA #$0000 : JSL !MUSIC_ROUTINE
    LDA #$FF00 : CLC : ADC !MUSIC_DATA : JSL !MUSIC_ROUTINE
    BRA .load_track

  .music_queue_increase_timer
    ; Data is correct, but we may need to increase our sound timer
    LDA !SRAM_SOUND_TIMER : CMP $063F : BMI .done
    STA $063F : STA $0686
    BRA .done

  .queued_music_data_clear_track
    ; Insert clear track before queued music data and start queue there
    DEX : DEX : TXA : AND #$000E : STA $063B : TAX
    STZ $0619,X : STZ $063D

    ; Clear all timers before this point
  .music_clear_timer_loop
    TXA : DEC : DEC : AND #$000E : TAX
    STZ $0629,X : CPX $0639 : BNE .music_clear_timer_loop

    ; Set timer on the clear track command
    LDX $063B

  .queued_music_prepare_set_timer
    LDA !SRAM_SOUND_TIMER : BNE .queued_music_set_timer
    INC

  .queued_music_set_timer
    STA $0629,X : STA $0686 : STA $063F
    BRA .done

  .check_track
    LDA !SRAM_MUSIC_TRACK : CMP !MUSIC_TRACK : BEQ .done

  .load_track
    LDA !MUSIC_TRACK : JSL !MUSIC_ROUTINE

  .done
    RTS
}

; These restored registers are game-specific and needs to be updated for different games
register_restore_return:
{
    %a8()
    LDA $84 : STA $4200
    LDA #$0F : STA $13 : STA $51 : STA $2100
    RTL
}

save_state:
{
    %a8()
    TDC : PHA : PLB

    ; Store DMA registers to SRAM
    LDY #$0000 : TYX

  .save_dma_regs
    LDA $4300,X : STA !SRAM_DMA_BANK,X
    INX
    INY : CPY #$000B : BNE .save_dma_regs
    CPX #$007B : BEQ .done
    INX #5 : LDY #$0000
    BRA .save_dma_regs

  .done
    %ai16()
    LDX #save_write_table
    ; fallthrough
}

run_vm:
{
    PHK : PLB
    JMP vm
}

save_write_table:
    ; Turn PPU off
    dw $1000|$2100, $80
    dw $1000|$4200, $00
    ; Single address, B bus -> A bus.  B address = reflector to WRAM ($2180).
    dw $0000|$4310, $8080  ; direction = B->A, byte reg, B addr = $2180

    ; Copy WRAM segments, uses $705000-$727FFF
    %wram_to_sram($7E0000, $3000, $705000)
    %wram_to_sram($7E7000, $3000, $710000)
    %wram_to_sram($7EC000, $34A0, $713000)
    %wram_to_sram($7EFD00, $0080, $716500)
    %wram_to_sram($7EFE00, $0100, $716600)
    %wram_to_sram($7E3300, $0200, $716700)
    %wram_to_sram($7F0000, $1700, $716900)
    %wram_to_sram($7F1700, $7F02, $720000)

    ; Address pair, B bus -> A bus.  B address = VRAM read ($2139).
    dw $0000|$4310, $3981  ; direction = B->A, word reg, B addr = $2139
    dw $1000|$2115, $0080  ; VRAM address increment mode.

    ; Copy VRAM segments, uses $730000-$736FFF, $737400-$7377FF
    %vram_to_sram($7C00, $400,  $737400)
    %vram_to_sram($9000, $3000, $730000)
    %vram_to_sram($C000, $4000, $733000)

    ; Copy CGRAM, uses SRAM $737200-$7373FF
    dw $1000|$2121, $00    ; CGRAM address
    dw $0000|$4310, $3B80  ; direction = B->A, byte reg, B addr = $213B
    dw $0000|$4312, $7200  ; A addr = $xx7200
    dw $0000|$4314, $0073  ; A addr = $73xxxx, size = $xx00
    dw $0000|$4316, $0002  ; size = $02xx ($0200), unused bank reg = $00.
    dw $1000|$420B, $02    ; Trigger DMA on channel 1

    ; Done
    dw $0000, save_return

save_return:
{
    PEA $0000 : PLB : PLB

    %ai16()
    LDA !ram_room_has_set_rng : STA !sram_save_has_set_rng
    LDA !ram_minimap : STA !SRAM_SAVED_MINIMAP
    LDA #$5AFE : STA !SRAM_SAVED_STATE

    TSC : STA !SRAM_SAVED_SP
    JMP register_restore_return
}

load_state:
{
    JSR pre_load_state

    %a8()
    TDC : PHA : PLB
    LDX #load_write_table
    JMP run_vm
}

load_write_table:
    ; Disable HDMA
    dw $1000|$420C, $00
    ; Turn PPU off
    dw $1000|$2100, $80
    dw $1000|$4200, $00
    ; Single address, A bus -> B bus.  B address = reflector to WRAM ($2180).
    dw $0000|$4310, $8000  ; direction = A->B, B addr = $2180

    ; Copy WRAM segments, uses $705000-$727FFF
    %sram_to_wram($7E0000, $3000, $705000)
    %sram_to_wram($7E7000, $3000, $710000)
    %sram_to_wram($7EC000, $34A0, $713000)
    %sram_to_wram($7EFD00, $0080, $716500)
    %sram_to_wram($7EFE00, $0100, $716600)
    %sram_to_wram($7E3300, $0200, $716700)
    %sram_to_wram($7F0000, $1700, $716900)
    %sram_to_wram($7F1700, $7F02, $720000)

    ; Address pair, A bus -> B bus.  B address = VRAM write ($2118).
    dw $0000|$4310, $1801  ; direction = A->B, B addr = $2118
    dw $1000|$2115, $0080  ; VRAM address increment mode.

    ; Copy VRAM segments, uses $730000-$736FFF, $737400-$7377FF
    %sram_to_vram($7C00, $400,  $737400)
    %sram_to_vram($9000, $3000, $730000)
    %sram_to_vram($C000, $4000, $733000)

    ; Copy CGRAM, uses SRAM $737200-$7373FF
    dw $1000|$2121, $00    ; CGRAM address
    dw $0000|$4310, $2200  ; direction = A->B, byte reg, B addr = $2122
    dw $0000|$4312, $7200  ; A addr = $xx7200
    dw $0000|$4314, $0073  ; A addr = $73xxxx, size = $xx00
    dw $0000|$4316, $0002  ; size = $02xx ($0200), unused bank reg = $00.
    dw $1000|$420B, $02    ; Trigger DMA on channel 1

    ; Done
    dw $0000, load_return

load_return:
{
    %ai16()
    LDA !SRAM_SAVED_SP : TCS

    PEA $0000 : PLB : PLB

    ; rewrite inputs so that holding load won't keep loading, as well as rewriting saving input to loading input
    LDA !IH_CONTROLLER_PRI : EOR !sram_ctrl_save_state : ORA !sram_ctrl_load_state
    STA !IH_CONTROLLER_PRI : STA !IH_CONTROLLER_PRI_NEW : STA !IH_CONTROLLER_PRI_PREV

    ; clear frame held counters
    LDA #$0000
    STA !WRAM_MENU_START+$B8 : STA !WRAM_MENU_START+$BA
    STA !WRAM_MENU_START+$BC : STA !WRAM_MENU_START+$BE
    STA !WRAM_MENU_START+$C0 : STA !WRAM_MENU_START+$C2
    STA !WRAM_MENU_START+$C4 : STA !WRAM_MENU_START+$C6
    STA !WRAM_MENU_START+$C8 : STA !WRAM_MENU_START+$CA
    STA !WRAM_MENU_START+$CC : STA !WRAM_MENU_START+$CE

    JSL tinystates_load_kraid

    ; pause menu graphics
    LDA !GAMEMODE : CMP #$0010 : BPL .not_paused
    CMP #$000C : BMI .not_paused
    JSL tinystates_load_paused

  .not_paused
    %a8()
    LDX #$0000 : TXY

  .load_dma_regs
    LDA !SRAM_DMA_BANK,X : STA $4300,X
    INX : INY
    CPY #$000B : BNE .load_dma_regs
    CPX #$007B : BEQ .load_dma_regs_done
    INX #5 : LDY #$0000
    BRA .load_dma_regs

  .load_dma_regs_done
    ; Restore registers and return.
    %ai16()
    JSR post_load_state
    JMP register_restore_return
}

vm:
{
    ; Data format: xx xx yy yy
    ; xxxx = little-endian address to write to .vm's bank
    ; yyyy = little-endian value to write
    ; If xxxx has high bit set, read and discard instead of write.
    ; If xxxx has bit 12 set ($1000), byte instead of word.
    ; If yyyy has $DD in the low half, it means that this operation is a byte
    ; write instead of a word write.  If xxxx is $0000, end the VM.
    %ai16()
    ; Read address to write to
    LDA.w $0000,X : BEQ .vm_done
    TAY
    INX : INX
    ; Check for byte mode
    BIT.w #$1000 : BEQ .vm_word_mode
    AND.w #$EFFF : TAY
    %a8()
  .vm_word_mode
    ; Read value
    LDA.w $0000,X
    INX : INX
  .vm_write
    ; Check for read mode (high bit of address)
    CPY.w #$8000 : BCS .vm_read
    STA $0000,Y
    BRA vm
  .vm_read
    ; "Subtract" $8000 from Y by taking advantage of bank wrapping.
    LDA $8000,Y
    BRA vm
  .vm_done
    ; A, X and Y are 16-bit at exit.
    ; Return to caller.  The word in the table after the terminator is the
    ; code address to return to.
    JMP ($0002,X)
}

tinystates_load_paused:
{
    ; restore gameplay palettes before running pause routines
    LDX #$0000 : LDY #$0100
  .restore_loop
    LDA $7E3300,X : STA $7EC000,X
    INX : INX
    DEY : BNE .restore_loop

    JSL $828E75 ; Load pause menu tiles and clear BG2 tilemap
    JSL $828EDA ; Load pause screen base tilemaps
    JSL $8293C3 ; Load pause menu map tilemap and area label

    ; backup gameplay palettes
    LDX #$0000 : LDY #$0100
  .backup_loop
    LDA $7EC000,X : STA $7E3300,X
    INX : INX
    DEY : BNE .backup_loop

    ; load pause screen palettes
    LDX #$0000 : LDY #$0100
  .load_loop
    LDA $B6F000,X : STA $7EC000,X
    INX : INX
    DEY : BNE .load_loop

    JSL $82B62B ; Draw pause menu during fade in
    RTL
}

print pc, " tinysave end"
warnpc $80FC00 ; infohud.asm


org !ORG_PRESETS_TINYSTATES_BANK82
print pc, " tinysave bank82 start"

tinystates_preload_bg_data:
    JSR $82E2 ; Re-load BG3 tiles
    RTL

tinystates_load_kraid:
{
    ; Are we fighting Kraid? Check to see if either of his unpause hooks are active
    LDA $0604
    CMP #$C24E
    BEQ .yes
    CMP #$C2A0
    BNE .done

  .yes
    ; We need to restore Kraid's graphics.
    ; Load a mask that the decompressor expects
    LDA #$DFFF : STA $12
    JSL .decompress_kraid   ; Decompress Kraid into WRAM

    PHB
    PEA $7E7E : PLB : PLB

    ; Has Kraid risen through the ceiling yet? If so, we need to set the priority bit in
    ; each of Kraid's tiles so he's visible in front of the background.
    LDA $7808 : CMP #$00A4 : BNE .update_priority_done
    LDX #$FFE
  .priority_loop
    LDA $2000,X : ORA #$2000 : STA $2000,X
    DEX : DEX : BPL .priority_loop
  .update_priority_done
    PLB

    ; Copy Kraid to VRAM
    LDA #$0080 : STA $2115              ; set write mode
    LDA $58 : AND #$FC00 : STA $2116    ; VRAM address = BG2
    PHA
    LDA #$1801 : STA $4310              ; write a word at a time to VMDATA
    LDA #$7E20 : STZ $4312 : STA $4313  ; source address = $7E2000
    LDA #$0800 : STA $4315              ; $0800 bytes
    LDY #$0002 : STY $420B              ; start transfer

    ; Clear the right half of BG2
    LDA #$0338 : LDX #$0400
    ; we can't DMA a repeated word, so just transfer it manually
  .bg2_clear_loop
    STA $2118 : DEX : BNE .bg2_clear_loop

    ; Most of Kraid is static, but his mouth can update dynamically based on these instruction lists:
    ;   https://patrickjohnston.org/bank/A7#f96D2
    ; Look backwards from the instruction list pointer to find the last state we executed,
    ;   grab its mouth tilemap, and upload it to VRAM.

    ; NOTE: we assume the previous instruction is a valid 8-byte instruction.
    ; It turns out this is always the case, because all Kraid's 2-byte instructions immediately
    ;   process the next instruction without delay, so we'll never see the pointer pointing at the
    ;   instruction after an 8-byte instruction. Additionally, the first instruction in each list
    ;   is never executed, so we don't have to worry about reading out-of-bounds.
    PLA                                 ; restore VRAM address from stack
    LDX $0FAA : BEQ .done
    STA $2116                           ; VRAM address = BG2
    ; tilemap = *((instruction_list - 8) + 2) = *(instruction_list - 6)
    LDA $A6FFFA,X : STA $4312           ; source address = tilemap
    LDA #$A7A7 : STA $4314              ; source bank = $A7
    LDA #$02C0 : STA $4315              ; $0800 bytes
    STY $420B                           ; start transfer (Y is still 2)

  .done
    RTL

  .decompress_kraid
    ; $AAC6 ends with a RTS, but we need an RTL.
    ; Have the RTS return to $A78AA3 which is an RTL
    PEA $8AA2 : JML $A7AAC6

  .call_pause_hook
    ; We jump into the middle of the hook (to skip waiting for an NMI), so we have to be careful
    ;   with the stack & processor status
    PHP : %a8()
    JML $A7C255
}

print pc, " tinysave bank82 end"
warnpc $82FFE0 ; InfoHUD
