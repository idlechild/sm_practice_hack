
; Set SRAM size
org $80FFD8
hook_sram_size:
if !FEATURE_SD2SNES
    db $08 ; 256kb
else
if !FEATURE_PRESETS
    db $06 ; 64kb
else
    db $05 ; 32kb
endif
endif


org $8191A4
    JML $808462 ; Soft Reset


org $8B930C
    JSL cutscenes_nintendo_splash
    NOP : NOP


; Enable version display
org $8B8697
    NOP

org $8B871D
    LDA #$0590

org $8B8731
    LDA #$0590

org $8BF754
hook_version_data:
cleartable ; ASCII
    db ' ', $30+!VERSION_MAJOR, '.', $30+!VERSION_MINOR, $30+!VERSION_BUILD
if !VERSION_REV > 9
    db '.', $30+(!VERSION_REV/10), $30+(!VERSION_REV%10)
else
    db '.', $30+!VERSION_REV
endif
    db $00
table ../resources/normal.tbl
warnpc $8BF760


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


org $90F800
print pc, " misc bank90 start"

hook_set_music_track:
{
    STZ $07F6
    PHA
    LDA !sram_music_toggle : CMP #$00 : BNE .no_music
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

print pc, " misc bank90 end"
warnpc $90FE00 ; damage.asm


org $8BFA00
print pc, " misc bank8B start"

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

preset_load_level:
{
    ; Original logic from $82E7D3
    PHP : PHB
    REP #$30

    ; More efficient method to clear level data
    PEA $7F00 : PLB : PLB
    LDX #$063E : LDA #$8000
  .clear_level_data_loop
    STA $0002,X : STA $0642,X : STA $0C82,X : STA $12C2,X
    STA $1902,X : STA $1F42,X : STA $2582,X : STA $2BC2,X
    STA $3202,X : STA $3842,X : STA $3E82,X : STA $44C2,X
    STA $4B02,X : STA $5142,X : STA $5782,X : STA $5DC2,X
    DEX : DEX : BPL .clear_level_data_loop

    ; Decompress level data
    LDA $7E07BE : STA $48
    LDA #$7F00 : STA $4D
    %a8()
    LDA $7E07BD : STA $47
    STZ $4C
    JSL optimized_decompression

    ; Mirror background data
    %a16()
    ; Length * 5 + 1 (SEC) reaches the end of the source
    LDA $0000 : LSR : SEC : ADC $0000 : ADC $0000 : TAX
    ; Length + $9601 reaches the end of the destination
    LDA $0000 : ADC #$9601 : TAY
    ; Subtract one from length for MVP and MVN commands
    SBC #$9601 : MVP $7F7F

    ; Mirror BTS data, source is already set
    LDA $0000 : LSR : CLC : ADC #$6401 : TAY
    SBC #$6401 : MVP $7F7F

  .level_data_done
    PEA $8F00 : PLB : PLB

    ; Decompress CRE tile table to $7EA000
    LDA #$B9A0 : STA $48
    LDA #$7EA0 : STA $4D
    %a8()
    LDA #$9D : STA $47
    STZ $4C
    JSL optimized_decompression

    ; Decompress tileset tile table to $7EA800
    %a16()
    LDA $07C1 : STA $48
    LDA #$7EA8 : STA $4D
    %a8()
    LDA $07C0 : STA $47
    STZ $4C
    JSL optimized_decompression

    ; Jump back to vanilla method
    %a16()
    JML $82E870

cutscenes_nintendo_splash:
{
    LDX #$0078
    LDA !sram_skip_splash : CMP #$0001 : BNE .done
    LDX #$0001
  .done
    STX $0DE2
    RTL
}

print pc, " misc bank8B end"

