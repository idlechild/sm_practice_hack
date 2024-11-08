
; Set SRAM size
org $80FFD8
hook_sram_size:
if !FEATURE_TINYSTATES
    db $07 ; 128kb
else
if !FEATURE_SD2SNES
    db $08 ; 256kb
else
    db $05 ; 32kb
endif
endif


; Enable version display
org $8B8697
    NOP

org $8B871D
if !FEATURE_SD2SNES
if !FEATURE_TINYSTATES
    LDA #$39E3 ; T
else
    LDA #$39E2 ; S
endif
else
    LDA #$04F0 ; blank
endif

org $8B8731
    LDA #$04F0 ; blank

org $8BF754
hook_version_data:
cleartable ; ASCII
if !VERSION_MAJOR > 9
    db ' ', $30+(!VERSION_MAJOR/10), $30+(!VERSION_MAJOR%10)
else
    db ' ', $30+!VERSION_MAJOR
endif
if !VERSION_MINOR > 9
    db '.', $30+(!VERSION_MINOR/10), $30+(!VERSION_MINOR%10)
else
    db '.', $30+!VERSION_MINOR
endif
if !VERSION_BUILD > 9
    db '.', $30+(!VERSION_BUILD/10), $30+(!VERSION_BUILD%10)
else
    db '.', $30+!VERSION_BUILD
endif
if !VERSION_REV > 9
    db '.', $30+(!VERSION_REV/10), $30+(!VERSION_REV%10)
else
if !VERSION_REV
    db '.', $30+!VERSION_REV
endif
endif
    db $00
table ../resources/normal.tbl
warnpc $8BF760


; Skips the waiting time after teleporting
org $90E877
    LDA $07F5
    JSL $808FC1 ; queue room music track
    BRA $18


; $82:8BB3 22 69 91 A0 JSL $A09169[$A0:9169]  ; Handles Samus getting hurt?
org $828BB3
    JSL gamemode_end


; Replace unnecessary logic checking controller input to toggle debug CPU brightness
; with logic to collect the v-counter data
org $828AB1
misc_debug_brightness:
    %a8() : LDA $4201 : ORA #$80 : STA $4201 : %ai16()
    LDA $2137 : LDA $213D : STA !ram_vcounter_data

    ; For efficiency, re-implement the debug brightness logic here
    LDA $0DF4 : BEQ .skipDebugBrightness
    %a8() : LDA $51 : AND #$F0 : ORA #$05 : STA $2100 : %a16()
    BRA .skipDebugBrightness

warnpc $828ADD
org $828ADD       ; Resume original logic
    .skipDebugBrightness


org $CF8BBF       ; Set map scroll beep to high priority
hook_spc_engine_map_scroll_beep_priority:
    dw $2A97


org $869D59
    JSR move_kraid_rocks_horizontally

org !ORG_MISC_BANK86
print pc, " misc bank86 start"

; Copied from $8688B6 but optimized for Kraid rocks using a hard-coded radius
; This is intended to offset extra practice rom lag in Kraid's room
move_kraid_rocks_horizontally:
{
    PHX
    STZ $12 : STZ $14
    LDA !ENEMY_PROJ_X_VELOCITY,X : BPL .storeVelocity
    DEC $14
  .storeVelocity
    STA $13
    LDA #$0004 : STA $1C
    LDA !ENEMY_PROJ_Y,X : SEC : SBC #$0004
    AND #$FFF0 : STA $1A
    LDA !ENEMY_PROJ_Y,X : CLC : ADC #$0003
    SEC : SBC $1A
    LSR : LSR : LSR : LSR
    STA $1A : STA $20
    LDA !ENEMY_PROJ_Y,X : SEC : SBC #$0004
    LSR : LSR : LSR : LSR
    %a8() : STA $4202
    LDA !ROOM_WIDTH_BLOCKS : STA $4203
    %a16() : LDA !ENEMY_PROJ_X_SUBPX,X
    CLC : ADC $12 : STA $16
    LDA !ENEMY_PROJ_X,X : ADC $14 : STA $18
    BIT $14 : BMI .subtract
    CLC : ADC #$0003
    BRA .store
  .subtract
    SEC : SBC #$0004
  .store
    STA $22
    LSR : LSR : LSR : LSR
    CLC : ADC $4216
    ASL : TAX
    JMP $8930
}

gamemode_end:
{
    ; overwritten logic
    JSL $A09169

    ; If minimap is disabled or shown, we ignore artificial lag
    LDA $05F7 : BNE .endlag
    LDA !ram_minimap : BNE .endlag

    ; Ignore artifical lag if sprite features are active
    LDA !ram_sprite_feature_flags : BNE .endlag

    ; Artificial lag, multiplied by 16 to get loop count
    ; Each loop takes 5 clock cycles (assuming branch taken)
    ; For reference, 41 loops ~= 1 scanline
    LDA !sram_artificial_lag : BEQ .endlag

    ; To account for various changes, we may need to tack on more clock cycles
    ; These can be removed as code is added to maintain CPU parity during normal gameplay
    LDA !sram_top_display_mode : CMP !TOP_DISPLAY_VANILLA : BEQ .vanilla_display_lag_loop
    LDA !ram_frames_held : BNE .vanilla_display_lag_loop
    LDA !sram_artificial_lag
    ASL
    ASL
    ASL
    ASL
    NOP  ; Add 2 more clock cycles
    NOP  ; Add 2 more clock cycles
    NOP  ; Add 2 more clock cycles
    NOP  ; Add 2 more clock cycles
    CLC : ADC #$000B ; Add 60 cycles including CLC+ADC
    TAX
  .lagloop
    DEX : BNE .lagloop
  .endlag
    RTL

  .vanilla_display_lag_loop
    ; Vanilla display logic uses more CPU so reduce artificial lag
    LDA !sram_artificial_lag
    DEC : BEQ .endlag   ; Remove 76 clock cycles
    DEC : BEQ .endlag   ; Remove 76 clock cycles
    ASL
    ASL
    INC  ; Add 4 loops (22 clock cycles including the INC)
    ASL
    ASL
    INC  ; Add 1 loop (7 clock cycles including the INC)
    NOP  ; Add 2 more clock cycles
    NOP  ; Add 2 more clock cycles
    CLC : ADC #$000B ; Add 60 cycles including CLC+ADC
    TAX
  .vanilla_lagloop
    DEX : BNE .vanilla_lagloop
    RTL
}

stop_all_sounds:
{
    ; If sounds are not enabled, the game won't clear the sounds
    LDA !DISABLE_SOUNDS : PHA
    STZ !DISABLE_SOUNDS
    JSL $82BE17
    PLA : STA !DISABLE_SOUNDS

    ; Makes the game check Samus' health again, to see if we need annoying sound
    STZ !SAMUS_HEALTH_WARNING
    RTL
}

print pc, " misc bank86 end"


; general damage hijack
org $A0A862
    JSR EnemyDamage

; shinespark damage
org $A0A54C
    JSR EnemyDamageShinespark

; power bomb damage
org $A0A62B
    JSR EnemyDamagePowerBomb

org !ORG_MISC_BANKA0
print pc, " misc bankA0 start"
EnemyDamage:
{
    LDA !ram_pacifist : BNE .no_damage
    LDA $0F8C,X ; original code
    RTS

  .no_damage
    PLA ; pull return address and jump past storing enemy hp
    JMP $A8BA
}

EnemyDamageShinespark:
{
    LDA !ram_pacifist : BNE .no_damage
    LDA $0F8C,X ; original code
    RTS

  .no_damage
    PLA ; pull return address and jump past storing enemy hp
    JMP $A55A
}

EnemyDamagePowerBomb:
{
    LDA !ram_pacifist : BNE .no_damage
    LDA $0F8C,X ; original code
    RTS

  .no_damage
    PLA ; pull return address and jump past storing enemy hp
    JMP $A63C

print pc, " misc bankA0 end"
warnpc $A0FE00


org !ORG_MISC_BANK90
print pc, " misc bank90 start"

preserve_escape_timer:
{
    ; check if timer is active
    LDA $0943 : AND #$0006 : BEQ .done
    JSL $809F6C ; Draw timer

  .done
    JMP $EA7F ; overwritten code
}

clear_escape_timer:
{
    ; clear timer status
    STZ $0943

    ; overwritten code
    LDA #$AC1B : STA $0FB2,X
    STZ $0DEC
    RTL
}

print pc, " misc bank90 end"
warnpc $908EA9 ; overwrites unused vanilla routine

