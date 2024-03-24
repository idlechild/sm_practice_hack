; Patch out copy protection
org $808000
hook_copy_protection:
    db $FF

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


org $8B92DE
    JSR cutscenes_nintendo_logo_hijack
    NOP

org !ORG_MISC_BANK8B
print pc, " misc bank8B start"
Intro_Skip_to_Zebes:
{
    %a8()
    LDA #$80 : STA $51
    %a16()
    LDX #$0290
  .loop
    STZ $198D,X
    DEX #2 : BPL .loop

    ; mark Ceres completed
    LDA #$0022 : STA $7ED914
    ; load game next frame
    LDA #$0006 : STA !GAMEMODE
    ; Screen fade delay/counter = 0
    STZ $0723 : STZ $0725
    LDA !SAMUS_HP_MAX : STA !SAMUS_HP
    RTS
}

cutscenes_nintendo_logo_hijack:
{
    JSL $80834B     ; hijacked code

    LDA !sram_cutscenes : AND !CUTSCENE_QUICKBOOT : BNE .quickboot
    STA !ram_quickboot_spc_state    ; A is 0
    RTS

.quickboot
    PLA ; pop return address
    PLB
    PLA ; saved processor status and 1 byte of next return address
    PLA ; remainder of next return address

    LDA #$0001 : STA !ram_quickboot_spc_state

    JML $808482  ; finish boot code; another hijack will launch the menu
}
print pc, " misc bank8B end"


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


; $80:8F24 9C F6 07    STZ $07F6  [$7E:07F6]  ;/
; $80:8F27 8D 40 21    STA $2140  [$7E:2140]  ; APU IO 0 = [music track]
org $808F24
    JSL hook_set_music_track
    NOP : NOP

; $80:8F65 8D F3 07    STA $07F3  [$7E:07F3]  ;} Music data = [music entry] & FFh
; $80:8F68 AA          TAX                    ; X = [music data]
org $808F65
    JML hook_set_music_data


; swap Enemy HP to MB HP when entering MB's room
;org $83AAD2
;    dw #MotherBrainHP


; Ceres Ridley modified state check to support presets
org $8FE0C0
    dw layout_asm_ceres_ridley_state_check

; Ceres Ridley room setup asm when timer is not running
org $8FE0DF
    dw layout_asm_ceres_ridley_no_timer


;org $8FEA00 ; free space for door asm
org !ORG_MISC_BANK8F
print pc, " misc bank8F start"

layout_asm_ceres_ridley_state_check:
{
    LDA $0943 : BEQ .no_timer
    LDA $0001,X : TAX
    JMP $E5E6
  .no_timer
    STZ $093F
    INX : INX : INX
    RTS
}

layout_asm_ceres_ridley_no_timer:
{
    ; Same as original setup asm, except force blue background
    PHP
    %a8()
    LDA #$66 : STA $5D
    PLP
    JSL $88DDD0
    LDA #$0009 : STA $07EB
    RTS
}

print pc, " misc bank8F end"


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

print pc, " misc bank86 end"


org !ORG_MISC_BANK87
print pc, " misc start"

hook_set_music_track:
{
    STZ $07F6
    PHA
    LDA !sram_music_toggle : CMP #$01 : BNE .no_music
    PLA : STA $2140
    RTL

  .no_music
    PLA
    RTL
}

hook_set_music_data:
{
    STA $07F3 : TAX
    LDA !sram_music_toggle : CMP #$0002 : BEQ .fast_no_music
    JML $808F69

  .fast_no_music
    JML $808F89
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
print pc, " misc end"


if !FEATURE_MORPHLOCK
; ----------
; Morph Lock
; ----------

print pc, " misc morphlock start"
; rewrite morph lock code to allow controller shortcuts and menu navigation
org !ORG_MORPHLOCK
    ; check for menu
    LDA !ram_cm_menu_active : BEQ .branch
    LDA $4218
    RTS

  .branch
    ; gamemode.asm will use these
    LDA $4218 : STA $CB
    EOR $C7 : AND $CB : STA $CF

    ; resume normal morph lock code
    LDA $09A1 : BMI .gameMode
    LDA $4218
    RTS

  .gameMode
    ; checks for gamemodes where morph lock is allowed
    LDA $0998 : CMP #$0008 : BEQ .morphLock
    CMP #$000C : BEQ .morphLock
    CMP #$0012 : BEQ .morphLock
    CMP #$001A : BNE .noMorphLock
    LDA $09A1 : AND #$7FFF : STA $09A1 ; reset flag if dead

  .noMorphLock
    LDA $4218
    RTS

  .morphLock
    LDA $09A2 : AND #$0002 : BNE .springball
    ; no springball, also filter jump
    LDA #$FFFF : EOR $09B4 : AND $4218 ; removes jump input
    BRA .noSpringball

  .springball
    ; springball equipped, allow jump
    LDA $4218

  .noSpringball
    AND #$F7FF ; removes up input
    RTS
print pc, " misc morphlock end"
endif

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


if !RAW_TILE_GRAPHICS
org !ORG_MISC_TILE_GRAPHICS
print pc, " misc decompression start"
; Decompression optimization adapted from Kejardon, with fixes by PJBoy and Maddo
; Compression format: One byte (XXX YYYYY) or two byte (111 XXX YY-YYYYYYYY) headers
; XXX = instruction, YYYYYYYYYY = counter
optimized_decompression_end:
{
    PLB : PLP
    RTL
}

optimized_decompression:
{
    PHP : %a8() : %i16()
    ; Set bank
    PHB : LDA $49 : PHA : PLB

    STZ $50 : LDY #$0000

  .nextByte
    LDA ($47)
    INC $47 : BNE .readCommand
    INC $48 : BNE .readCommand
    JSR decompression_increment_bank
  .readCommand
    STA $4A
    CMP #$FF : BEQ optimized_decompression_end
    CMP #$E0 : BCC .oneByteCommand

    ; Two byte command
    ASL : ASL : ASL
    AND #$E0 : PHA
    LDA $4A : AND #$03 : XBA

    LDA ($47)
    INC $47 : BNE .readData
    INC $48 : BNE .readData
    JSR decompression_increment_bank
    BRA .readData

  .oneByteCommand
    AND #$E0 : PHA
    TDC : LDA $4A : AND #$1F

  .readData
    TAX : INX : PLA
    BMI .option4567 : BEQ .option0
    CMP #$20 : BEQ .option1
    CMP #$40 : BEQ .option2
    BRL .option3

  .option0:
    ; Option X = 0: Directly copy Y bytes
    LDA ($47)
    INC $47 : BNE .option0_copy
    INC $48 : BNE .option0_copy
    JSR decompression_increment_bank
  .option0_copy
    STA [$4C],Y
    INY : DEX : BNE .option0
    BRL .nextByte

  .option1:
    ; Option X = 1: Copy the next byte Y times
    LDA ($47)
    INC $47 : BNE .option1_copy
    INC $48 : BNE .option1_copy
    JSR decompression_increment_bank
  .option1_copy
    STA [$4C],Y
    INY : DEX : BNE .option1_copy
    BRL .nextByte

  .option2:
    ; Option X = 2: Copy the next two bytes, one at a time, for the next Y bytes
    ; Apply PJ's fix to divide X by 2 and set carry if X was odd
    REP #$20 : TXA : LSR : TAX : SEP #$20
    LDA ($47)
    INC $47 : BNE .option2_readMSB
    INC $48 : BNE .option2_readMSB
    JSR decompression_increment_bank
  .option2_readMSB
    XBA : LDA ($47)
    INC $47 : BNE .option2_prepCopy
    INC $48 : BNE .option2_prepCopy
    JSR decompression_increment_bank
  .option2_prepCopy
    XBA
    ; Apply Maddo's fix accounting for single copy (X = 1 before divide by 2)
    INX : DEX : BEQ .option2_singleCopy
    REP #$20
  .option2_loop
    STA [$4C],Y
    INY : INY : DEX : BNE .option2_loop
    ; PJ's fix to account for case where X was odd
    SEP #$20
  .option2_singleCopy
    BCC .option2_end
    STA [$4C],Y : INY
  .option2_end
    BRL .nextByte

  .option4567:
    CMP #$C0 : AND #$20 : STA $4F : BCS .option67

    ; Option X = 4: Copy Y bytes starting from a given address in the decompressed data
    ; Option X = 5: Copy and invert (EOR #$FF) Y bytes starting from a given address in the decompressed data
    LDA ($47)
    INC $47 : BNE .option45_readMSB
    INC $48 : BNE .option45_readMSB
    JSR decompression_increment_bank
  .option45_readMSB
    XBA : LDA ($47)
    INC $47 : BNE .option45_prepDictionary
    INC $48 : BNE .option45_prepDictionary
    JSR decompression_increment_bank
  .option45_prepDictionary
    XBA : REP #$21
    ADC $4C : STY $44 : SEC

  .option_dictionary
    SBC $44 : STA $44
    SEP #$20
    LDA $4E : BCS .skip_carrySubtraction
    DEC
  .skip_carrySubtraction
    STA $46
    LDA $4F : BNE .option57_loop

  .option46_loop
    LDA [$44],Y
    STA [$4C],Y
    INY : DEX : BNE .option46_loop
    BRL .nextByte

  .option57_loop
    LDA [$44],Y
    EOR #$FF
    STA [$4C],Y
    INY : DEX : BNE .option57_loop
    BRL .nextByte

  .option67
    ; Option X = 6: Copy Y bytes starting from a given number of bytes ago in the decompressed data
    ; Option X = 7: Copy and invert (EOR #$FF) Y bytes starting from a given number of bytes ago in the decompressed data
    TDC : LDA ($47)
    INC $47 : BNE .option67_prepDictionary
    INC $48 : BNE .option67_prepDictionary
    JSR decompression_increment_bank
  .option67_prepDictionary
    REP #$20
    STA $44 : LDA $4C
    BRA .option_dictionary

  .option3
    ; Option X = 3: Incrementing fill Y bytes starting with next byte
    LDA ($47)
    INC $47 : BNE .option3_loop
    INC $48 : BNE .option3_loop
    JSR decompression_increment_bank
  .option3_loop
    STA [$4C],Y
    INC : INY : DEX : BNE .option3_loop
    BRL .nextByte
}

decompression_increment_bank:
{
    PHA
    PHB : PLA
    INC
    PHA : PLB
    LDA #$80 : STA $48
    PLA
    RTS
}
print pc, " misc decompression end"
endif

