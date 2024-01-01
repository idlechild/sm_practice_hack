
org $82FC00
print pc, " presets bank82 start"

preset_load:
{
    PHP
    LDA !MUSIC_DATA : STA !SRAM_MUSIC_DATA
    LDA !MUSIC_TRACK : STA !SRAM_MUSIC_TRACK

    JSL $809E93  ; Clear timer RAM
    JSR $819B    ; Initialize IO registers
    JSR $82E2    ; Load standard BG3 tiles and sprite tiles, clear tilemaps
    JSR $82C5    ; Load initial palette
    JSL $91E00D  ; Initialize Samus

    JSL custom_preset_load

    JSL preset_start_gameplay  ; Start gameplay

    ; Fix Phantoon and Draygon rooms
    LDA !ROOM_ID : CMP #$CD13 : BEQ .fixBG2
    CMP #$DA60 : BNE .doneBG2
  .fixBG2
    JSL preset_clear_BG2_tilemap

  .doneBG2
    JSL $809A79  ; HUD routine when game is loading
    JSL preset_hud_fixes
    JSL $90AD22  ; Reset projectile data

    TDC : TAX
    LDY #$0020
  .paletteLoop
    ; Target Samus' palette = [Samus' palette]
    LDA $7EC180,X : STA $7EC380,X
    INX : INX
    DEY : DEY : BNE .paletteLoop

    TDC
    STA $7EC400  ; Used as door fade timer
    STA $0727    ; Pause menu index
    INC
    STA $0723    ; Screen fade delay = 1
    STA $0725    ; Screen fade counter = 1

    JSL $80834B  ; Enable NMI with $84 options
    LDA #$8000
    TSB $198D    ; Enable enemy projectiles
    TSB $1C23    ; Enable PLMs
    TSB $1E79    ; Enable palette FX objects
    TSB $18B0    ; Enable HDMA objects
    TSB $1EF1    ; Enable animated tile objects
    JSL $908E0F  ; Set liquid physics type

    LDA #$0006 : STA $0DA0
  .loopSomething
    JSL $A08CD7  ; Transfer enemy tiles to VRAM and initialize enemies
    JSL $808338  ; Wait for NMI
    DEC $0DA0    ; Decrement $0DA0
    BPL .loopSomething

    ; set gamemode and brightness
    LDA #$0008 : STA !GAMEMODE
    %a8() : LDA #$0F : STA $51 : %a16()

    TDC : TAX
    LDY #$0200
  .secondPaletteLoop
    ; Palettes = [target palettes]
    LDA $7EC200,X : STA $7EC000,X
    INX : INX
    DEY : DEY : BNE .secondPaletteLoop

    ; Fix Samus' palette
    JSL $91DEBA

    ; Re-upload OOB viewer tiles if needed
    LDA !ram_sprite_feature_flags : BIT !SPRITE_OOB_WATCH : BEQ .done_upload_sprite_oob_tiles
    JSL upload_sprite_oob_tiles

  .done_upload_sprite_oob_tiles
    STZ $0795 : STZ $0797 ; clear door transition flags

    ; Clear enemies if not in BT or MB rooms
    LDA !ROOM_ID : CMP #$9804 : BEQ .done_clearing_enemies
    CMP #$DD58 : BEQ .done_clearing_enemies
    LDA !sram_preset_preserve_enemies : BNE .done_clearing_enemies
    JSR clear_all_enemies

  .done_clearing_enemies
    PLP
    RTL
}

clear_all_enemies:
{
    ; Clear enemies (8000 = solid to Samus, 0400 = Ignore Samus projectiles, 0100 = Invisible)
    TDC
  .loop
    TAX : LDA $0F86,X : BIT #$8500 : BNE .done_clearing
    ORA #$0200 : STA $0F86,X
  .done_clearing
    TXA : CLC : ADC #$0040 : CMP #$0400 : BNE .loop
    STZ $0E52 ; unlock grey doors that require killing enemies
    RTS
}

preset_load_destination_state_and_tiles:
{
    ; Original logic from $82E76B
    PHP : PHB
    %ai16()
    PEA $8F00
    PLB : PLB

    ; Load destination room CRE bitset from $82DDF1
    PHB : PHX
    PEA $8F00 : PLB : PLB
    LDX $078D : LDA $830000,X : TAX
    LDA $07B3 : STA $07B1
    LDA $0008,X : AND #$00FF : STA $07B3
    PLX : PLB

    JSR $DE12  ; Load door header
    JSR $DE6F  ; Load room header
    JSR $DEF2  ; Load state header
    JMP $E78C
}

print pc, " presets bank82 end"
warnpc $82FD40


org $80FB00
print pc, " presets bank80 start"

; This method is very similar to $80A07B (start gameplay)
preset_start_gameplay:
{
    PHP
    PHB
    PHK : PLB    ; DB = $80
    %ai16()
    SEI          ; Disable IRQ
    STZ $420B    ; Disable all (H)DMA
    STZ $07E9    ; Scrolling finished hook = 0
    STZ $0943    ; Timer status = inactive

    JSL $828A9A  ; Reset sound queues
    LDA #$FFFF : STA !DISABLE_SOUNDS

    JSL $80835D  ; Disable NMI
    JSL $80985F  ; Disable horizontal and vertical timer interrupts
    JSL preset_load_destination_state_and_tiles
    JSL $878016  ; Clear animated tile objects
    JSL $88829E  ; Wait until the end of a v-blank and clear (H)DMA enable flags

    ; Set Samus last pose same as current pose if not shinesparking
    LDA !SAMUS_POSE_DIRECTION : STA !SAMUS_PREVIOUS_POSE_DIRECTION
    STA !SAMUS_LAST_DIFFERENT_POSE_DIRECTION
    LDA !SAMUS_POSE : CMP #$00C9 : BMI .storePreviousPose
    CMP #$00CF : BPL .storePreviousPose
    ; Set timer type to shinespark
    LDA #$0006 : STA !SAMUS_SHINE_TIMER_TYPE
    ; Set timer very high in case player holds inputs before spark moves
    LDA #$7FFF : STA !SAMUS_SHINE_TIMER
    ; Clear previous pose
    TDC
  .storePreviousPose
    STA !SAMUS_PREVIOUS_POSE : STA !SAMUS_LAST_DIFFERENT_POSE

    ; Clear potential pose flags
    STA !SAMUS_POTENTIAL_POSE_FLAGS
    STA !SAMUS_POTENTIAL_POSE_FLAGS+2
    STA !SAMUS_POTENTIAL_POSE_FLAGS+4

    ; Set potential pose values to FFFF
    LDA #$FFFF : STA !SAMUS_POTENTIAL_POSE_VALUES
    STA !SAMUS_POTENTIAL_POSE_VALUES+2 : STA !SAMUS_POTENTIAL_POSE_VALUES+4

    ; Set Samus last position same as current position
    LDA !SAMUS_X : STA !SAMUS_PREVIOUS_X
    LDA !SAMUS_X_SUBPX : STA !SAMUS_PREVIOUS_X_SUBPX
    LDA !SAMUS_Y : STA !SAMUS_PREVIOUS_Y
    LDA !SAMUS_Y_SUBPX : STA !SAMUS_PREVIOUS_Y_SUBPX

    ; Preserve layer 2 values we may have loaded from presets
    LDA !LAYER2_Y : PHA
    LDA !LAYER2_X : PHA

    JSL $8882C1  ; Initialize special effects for new room
    JSL $8483C3  ; Clear PLMs
    JSL $868016  ; Clear enemy projectiles
    JSL $8DC4D8  ; Clear palette FX objects
    JSL $90AC8D  ; Update beam graphics
    JSL $82E139  ; Load target colours for common sprites, beams and slashing enemies / pickups
    JSL $A08A1E  ; Load enemies
    JSL $80A23F  ; Clear BG2 tilemap
    JSL preset_load_level
    JSL preset_scroll_fixes

    LDA !sram_preset_close_doors : BNE .doneOpeningDoors
    LDA !SAMUS_POSE : BEQ .doneOpeningDoors ; facing forward
    CMP #$009B : BEQ .doneOpeningDoors ; facing forward with suit
    JSR preset_open_all_blue_doors
  .doneOpeningDoors

    JSL $89AB82  ; Load FX
    JSL $82E97C  ; Load library background

    ; Pull layer 2 values
    PLA : STA !LAYER2_X
    PLA : STA !LAYER2_Y
    JSR $A37B    ; Calculate BG positions

    ; Fix BG2 Y offsets for rooms with scrolling sky
    ; Also fix rooms that need to be handled before door scroll
    LDA !ROOM_ID : CMP #$91F8 : BEQ .bgOffsetsScrollingSky
    CMP #$93FE : BEQ .bgOffsetsScrollingSky
    CMP #$94FD : BEQ .bgOffsetsScrollingSky
    BRA .bgOffsetsCalculated

  .bgOffsetsScrollingSky
    LDA !LAYER1_Y : STA !LAYER2_Y : STA $B7
    STZ !BG2_Y_SCROLL

  .bgOffsetsCalculated
    JSL $80A176  ; Display the viewable part of the room

    ; Enable sounds
    STZ !DISABLE_SOUNDS
    JSL stop_all_sounds

    ; Clear music queue
    STZ $0629 : STZ $062B : STZ $062D : STZ $062F
    STZ $0631 : STZ $0633 : STZ $0635 : STZ $0637
    STZ $0639 : STZ $063B : STZ $063D : STZ $063F

    ; If music fast off or preset off, treat music as already loaded
    LDA !sram_music_toggle : CMP #$0002 : BPL .doneMusic

    ; Compare to currently loaded music data
    LDA !SRAM_MUSIC_DATA : CMP !MUSIC_DATA : BEQ .doneLoadMusicData

    ; Clear track if necessary
    LDA !SRAM_MUSIC_TRACK : BEQ .loadMusicData
    TDC : JSL !MUSIC_ROUTINE

  .loadMusicData
    LDA !MUSIC_DATA : TAX
    LDA !SRAM_MUSIC_DATA : STA !MUSIC_DATA
    TXA : CLC : ADC #$FF00 : JSL !MUSIC_ROUTINE
    BRA .loadMusicTrack

  .doneLoadMusicData
    ; Compare to currently playing music
    LDA !SRAM_MUSIC_TRACK : CMP !MUSIC_TRACK : BEQ .doneMusic

  .loadMusicTrack
    LDA !MUSIC_TRACK : TAX
    LDA !SRAM_MUSIC_TRACK : STA !MUSIC_TRACK
    TXA : JSL !MUSIC_ROUTINE

  .doneMusic
    JSL $80834B  ; Enable NMI

    LDA #$0004 : STA $A7  ; Set optional next interrupt to Main gameplay

    JSL $80982A  ; Enable horizontal and vertical timer interrupts

    LDA #$E695 : STA !SAMUS_LOCKED_HANDLER   ; Unlock Samus
    LDA #$E725 : STA !SAMUS_MOVEMENT_HANDLER ; Unlock Samus
    LDA #$9F55 : STA $0A6C ; Set X speed table pointer

    STZ !ELEVATOR_PROPERTIES
    STZ !ELEVATOR_STATUS
    STZ !HEALTH_BOMB_FLAG
    STZ !MESSAGE_BOX_INDEX
    STZ $1E75 ; Save Station Lockout flag
    STZ $0795 : STZ $0797  ; Clear door transition flags
    JSL init_controller_bindings

    LDA #$E737 : STA $099C ; Pointer to next frame's room transition code = $82:E737
    PLB : PLP : RTL
}

preset_clear_BG2_tilemap:
{
    PHP : %ai16()

    ; Clear BG2 Tilemap
    LDA #$0338 : LDX #$07FE
  .loop
    STA $7E4000,X : STA $7E4800,X
    DEX #2 : BPL .loop

    ; Upload BG2 Tilemap
    %a8()
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$04 : STA $210C ; BG2 starts at $4000 (8000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4800 : STX $2116 ; VRAM address (8000 in vram)
    LDX #$4000 : STX $4302 ; Source offset
    LDA #$7E : STA $4304 ; Source bank
    LDX #$1000 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; disable forced blanking
    PLP
    RTL
}

preset_open_all_blue_doors:
{
    PHP : PHB : PHX : PHY
    LDA #$8484 : STA $C3 : PHA : PLB : PLB

    ; First resolve all door PLMs where the door has previously been opened
    LDX #$004E
  .plmSearchLoop
    LDA $1C37,X : BEQ .plmSearchDone
    LDY $1D27,X : LDA $0000,Y : CMP #$8A72 : BEQ .plmDoorFound
  .plmSearchResume
    DEX : DEX : BRA .plmSearchLoop

  .plmDoorFound
    LDA $1DC7,X : BMI .plmSearchResume
    PHX : JSL $80818E : LDA $7ED8B0,X : PLX
    AND $05E7 : BEQ .plmSearchResume

    ; Door has been previously opened
    ; Execute the next PLM instruction to set the BTS as a blue door
    LDA $0002,Y : TAY
    LDA $0000,Y : CMP #$86BC : BEQ .plmDelete
    INY : INY
    JSL preset_execute_plm_instruction

  .plmDelete
    STZ $1C37,X
    BRA .plmSearchResume

  .plmSearchDone
    ; Now search all of the room BTS for doors
    LDA !ROOM_WIDTH_SCROLLS : STA $C7
    LDA !ROOM_WIDTH_BLOCKS : STA $C1 : ASL : STA $C3
    LDA $7F0000 : LSR : TAY
    STZ $C5 : TDC : %a8() : LDA #$7F : PHA : PLB

  .btsSearchLoop
    LDA $6401,Y : AND #$FC : CMP #$40 : BEQ .btsFound
  .btsContinue
    DEY : BNE .btsSearchLoop

    ; All blue doors opened
    PLY : PLX : PLB : PLP : RTS

  .btsFound
    ; Convert BTS index to tile index
    ; Also verify this is a door and not a slope or half-tile
    %a16() : TYA : ASL : TAX : %a8()
    LDA $0001,X : BIT #$30 : BNE .btsContinue

    ; If this door has a red scroll, then leave it closed
    ; Most of the work is to determine the scroll index
    %a16() : TYA : DEC : LSR : LSR : LSR : LSR : STA $004204
    %a8() : LDA $C7 : STA $004206
    %a16() : PHA : PLA : PHA : PLA
    LDA $004216 : STA $C8
    LDA $004214 : LSR : LSR : LSR : LSR
    %a8() : STA $004202
    LDA $C7 : STA $004203
    PHA : PLA : TDC
    LDA $004216 : CLC : ADC $C8
    PHX : TAX : LDA $7ECD20,X : PLX
    CMP #$00 : BEQ .btsContinue

    ; Check what type of door we need to open
    LDA $6401,Y : BIT #$02 : BNE .btsCheckUpDown
    BIT #$01 : BEQ .btsFacingLeftRight
    LDA #$04 : STA $C6

  .btsFacingLeftRight
    %a16() : LDA #$0082 : ORA $C5 : STA $0000,X
    TXA : CLC : ADC $C3 : TAX : LDA #$00A2 : ORA $C5 : STA $0000,X
    TXA : CLC : ADC $C3 : TAX : LDA #$08A2 : ORA $C5 : STA $0000,X
    TXA : CLC : ADC $C3 : TAX : LDA #$0882 : ORA $C5 : STA $0000,X
    TDC : %a8() : STA $C6 : STA $6401,Y
    %a16() : TYA : CLC : ADC $C1 : TAX : TDC : %a8() : STA $6401,X
    %a16() : TXA : CLC : ADC $C1 : TAX : TDC : %a8() : STA $6401,X
    %a16() : TXA : CLC : ADC $C1 : TAX : TDC : %a8() : STA $6401,X
    BRL .btsContinue

  .btsCheckUpDown
    BIT #$01 : BEQ .btsFacingUpDown
    LDA #$08 : STA $C6

  .btsFacingUpDown
    %a16() : LDA #$0084 : ORA $C5 : STA $0006,X
    DEC : STA $0004,X : ORA #$0400 : STA $0002,X : INC : STA $0000,X
    TDC : %a8() : STA $C6 : STA $6401,Y
    STA $6402,Y : STA $6403,Y : STA $6404,Y
    BRL .btsContinue
}

preset_execute_plm_instruction:
{
    ; A = Bank 84 PLM instruction to execute
    ; $C3 already set to $84
    STA $C1
    ; PLM instruction ends with an RTS, but we need an RTL
    ; Have the RTS return to $848031 which is an RTL
    PEA $8030
    JML [$00C1]
}

print pc, " presets bank80 end"
warnpc $80FFC0

