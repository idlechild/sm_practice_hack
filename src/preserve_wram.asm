
org $90ACF6
    JSR original_load_beam_palette

org $90AD18
    JMP spacetime_routine


%startfree(90)

original_load_beam_palette:
{
    AND #$0FFF : ASL : TAY
    LDA #$0090 : XBA : STA $01
    LDA $C3C9,Y : STA $00
    LDY #$0000
    LDX #$0000

  .loop
    LDA [$00],Y : STA $7EC1C0,X
    INX #2
    INY #2 : CPY #$0020 : BMI .loop
    RTS
}

spacetime_routine:
{
    ; The normal routine shouldn't come here, but sanity check just in case
    ; Also skips out if spacetime but Y value is positive
    INY #2 : CPY #$0000 : BPL .normal_load_palette

    ; Sanity check that X is 0 (if not then do the original routine)
    CPX #$0000 : BNE .normal_load_palette

    ; Check if Y will cause us to reach infohud
    TYA : CLC : ADC #($7EC608-$7EC1E2) : CMP #$0000 : BPL .normal_load_palette

    ; We will reach infohud, so run our own loop
    INX #2
  .loop_before_infohud
    LDA [$00],Y : STA $7EC1C0,X
    INY #2
    INX #2 : CPX #($7EC608-$7EC1C0) : BMI .loop_before_infohud

    ; Check if we should skip over infohud
    LDA !ram_spacetime_infohud : BEQ .overwrite_infohud

    ; Skip over infohud
    ; Instead of load and store, load and load
  .loop_skip_infohud
    LDA $7EC1C0,X
    LDA [$00],Y
    INY #2
    INX #2 : CPX #($7EC6C8-$7EC1C0) : BMI .loop_skip_infohud

    ; Check if we finished spacetime while skipping over infohud
    CPY #$0020 : BMI .check_sprite_object_ram
    RTS

  .overwrite_infohud
    ; Check if Y will cause us to reach sprite object ram
    TYA : CLC : ADC #($7EEF78-$7EC628) : CMP #$0000 : BMI .loop_before_sprite_object_ram

  .normal_load_loop
    LDA [$00],Y : STA $7EC1C0,X
    INY #2
  .normal_load_palette
    INX #2 : CPY #$0020 : BMI .normal_load_loop
    RTS

  .check_sprite_object_ram
    ; Check if Y will cause us to reach sprite object ram
    TYA : CLC : ADC #($7EEF78-$7EC6E8) : CMP #$0000 : BPL .normal_load_loop

    ; We will reach sprite object ram, so run our own loop
  .loop_before_sprite_object_ram
    LDA [$00],Y : STA $7EC1C0,X
    INY #2
    INX #2 : CPX #($7EEF78-$7EC1C0) : BMI .loop_before_sprite_object_ram

    ; Check if we are copying from unmapped memory ($004500-$007FFF range)
    ; If not then overwrite sprite object ram
    TYA : ADC $00 : CMP #$4500 : BCC .overwrite_sprite_object_ram
    CMP #$7C01 : BCS .overwrite_sprite_object_ram

    ; Skip over sprite object ram
    ; Instead of load and store, load and load
  .loop_skip_sprite_object_ram
    LDA $7EC1C0,X
    LDA [$00],Y
    INY #2
    INX #2 : CPX #($7EF378-$7EC1C0) : BMI .loop_skip_sprite_object_ram

    ; Check if Y will cause us to reach DP_REGISTER_BACKUP_START
    TYA : CLC : ADC #(!DP_REGISTER_BACKUP_START-$7EF398) : CMP #$0000 : BPL .normal_load_loop

    ; It will, so run our own loop
  .loop_before_wram
    LDA [$00],Y : STA $7EC1C0,X
    INY #2
    INX #2 : CPX #(!DP_REGISTER_BACKUP_START-$7EC1C0) : BMI .loop_before_wram

    ; Skip over WRAM
    ; Instead of load and store, load and load
  .loop_skip_wram
    LDA $7EC1C0,X
    LDA [$00],Y
    INY #2
    INX #2 : CPX #(!WRAM_END-$7EC1C0) : BMI .loop_skip_wram

    ; Check if we finished spacetime while skipping over WRAM
    CPY #$0020 : BMI .normal_load_loop
    RTS

  .overwrite_sprite_object_ram
    ; Check if Y will cause us to reach WRAM
    TYA : CLC : ADC #(!DP_REGISTER_BACKUP_START-$7EEF98) : CMP #$0000 : BPL .normal_load_loop
    BRA .loop_before_wram
}

%endfree(90)


if !FEATURE_PAL
org $91BE10
else
org $91BEB8
endif
    dw xray_offscreen_aim_right

if !FEATURE_PAL
org $91BE18
else
org $91BEC0
endif
    dw xray_offscreen_horizontal

if !FEATURE_PAL
org $91C555
else
org $91C5FD
endif
    dw xray_onscreen_horizontal


%startfree(91)

xray_offscreen_aim_right:
{
    PHP : %ai16()
    LDA $18 : DEC : ASL : TAY
    CPY #$5CF8 : BCS .preserve
  .vanilla
if !FEATURE_PAL
    JMP $BE22
else
    JMP $BECA
endif

  .preserve
    CPY #$8008 : BCS .vanilla
    LDA $16 : STA $22 : STA $24

  .loop_left_offscreen
    LDA $22 : CLC : ADC $1E : STA $22
    BCS .left_found_screen
    DEY #2 : BPL .loop_left_offscreen
    STZ $12
    BRA .left_edge_end

  .left_found_screen
    CPY #$5CF8 : BCC .store_left_offscreen
    CPY #$6708 : BCC .prepare_left_onscreen
  .store_left_offscreen
    LDA $23 : ORA #$FF00 : STA [$00],Y
  .prepare_left_onscreen
    INY #2 : STY $12
    TYA : SEC : SBC #$0004 : TAY

  .loop_left_onscreen
    LDA $22 : CLC : ADC $1E : STA $22
    BCS .left_lost_screen
    CPY #$5CF8 : BCC .loop_left_store
    CPY #$6708 : BCC .loop_left_dey
  .loop_left_store
    LDA $23 : ORA #$FF00 : STA [$00],Y
  .loop_left_dey
    DEY #2 : BPL .loop_left_onscreen
    BRA .left_edge_end

  .left_lost_screen
    LDA #$00FF
  .left_first_lost_loop
    CPY #$6708 : BCC .left_skip_loop
    STA [$00],Y
    DEY #2 : BRA .left_first_lost_loop
  .left_skip_loop
    CPY #$5CF8 : BCC .left_second_lost_loop
    DEY #2 : BRA .left_skip_loop
  .left_second_lost_loop
    STA [$00],Y
    DEY #2 : BPL .left_second_lost_loop

  .left_edge_end
    LDA $18 : ASL : TAY

  .loop_right_offscreen
    LDA $24 : CLC : ADC $20 : STA $24
    BCS .right_found_screen
    INY #2 : CPY #$01CC : BMI .loop_right_offscreen
    STY $14
    BRA .right_edge_end

  .right_found_screen
    CPY #$5CF8 : BCC .store_right_offscreen
    CPY #$6708 : BCC .prepare_right_onscreen
  .store_right_offscreen
    LDA $25 : ORA #$FF00 : STA [$00],Y
  .prepare_right_onscreen
    DEY #2 : STY $14
    TYA : CLC : ADC #$0004 : TAY

  .loop_right_onscreen
    LDA $24 : CLC : ADC $20 : STA $24
    BCS .right_lost_screen
    CPY #$5CF8 : BCC .loop_right_store
    CPY #$6708 : BCC .loop_right_iny
  .loop_right_store
    LDA $25 : ORA #$FF00 : STA [$00],Y
  .loop_right_iny
    INY #2 : CPY #$01CC : BMI .loop_right_onscreen
    BRA .right_edge_end

  .right_lost_screen
    LDA #$00FF
    CPY #$5CF8 : BCC .right_lost_loop
    CPY #$6708 : BCC .right_lost_skip
  .right_lost_loop
    STA [$00],Y
  .right_lost_skip
    INY #2 : CPY #$01CC : BMI .right_lost_loop

  .right_edge_end
    LDY $12
    LDA #$00FF
  .final_loop
    CPY #$5CF8 : BCC .final_loop_store
    CPY #$6708 : BCC .final_loop_skip
  .final_loop_store
    STA [$00],Y
  .final_loop_skip
    INY #2 : CPY $14
    BMI .final_loop : BEQ .final_loop
    PLP
    RTS
}

xray_offscreen_horizontal:
{
    PHP : %ai16()
    LDA $18 : DEC : ASL : TAY
    CPY #$5CF8 : BCS .preserve
  .vanilla
if !FEATURE_PAL
    JMP $C473
else
    JMP $C51B
endif

  .preserve
    CPY #$8008 : BCS .vanilla
    CPY #$6708 : BCC .skip_top_loop
    LDA #$FF00 : STA [$00],Y
    PHY
    INY #2
  .bottom_loop
    LDA [$00],Y : CMP #$00FF : BEQ .bottom_loop_end
    LDA #$00FF : STA [$00],Y
    INY #2 : CPY #$01CC : BMI .bottom_loop
  .bottom_loop_end
    PLY
    DEY #2
  .first_top_loop
    CPY #$6708 : BCC .skip_top_loop
    LDA [$00],Y : CMP #$00FF : BEQ .end_top_loop
    LDA #$00FF : STA [$00],Y
    DEY #2 : BPL .first_top_loop
    BRA .end_top_loop
  .skip_top_loop
    CPY #$5CF8 : BCC .second_top_loop
    DEY #2 : BRA .skip_top_loop
  .second_top_loop
    LDA [$00],Y : CMP #$00FF : BEQ .end_top_loop
    LDA #$00FF : STA [$00],Y
    DEY #2 : BPL .second_top_loop
  .end_top_loop
    PLP
    RTS
}

xray_onscreen_horizontal:
{
    PHP : %ai16()
    LDA $18 : DEC : ASL : TAY
    CPY #$5CF8 : BCS .preserve
  .vanilla
if !FEATURE_PAL
    JMP $C8F8
else
    JMP $C9A0
endif

  .preserve
    CPY #$8008 : BCS .vanilla
    CPY #$6708 : BCC .skip_top_loop
    LDA $12 : CMP #$0040 : BNE .not40
    LDA $17 : ORA #$FF00
    BRA .store_first
  .not40
    LDA $16 : AND #$FF00
  .store_first
    STA [$00],Y
    PHY
    INY #2
    LDA #$00FF
  .bottom_loop
    STA [$00],Y
    INY #2 : CPY #$01CC : BMI .bottom_loop
    PLY
    DEY #2
  .first_top_loop
    CPY #$6708 : BCC .skip_top_loop
    STA [$00],Y
    DEY #2 : BPL .first_top_loop
    BRA .end_top_loop
  .skip_top_loop
    CPY #$5CF8 : BCC .second_top_loop
    DEY #2 : BRA .skip_top_loop
  .second_top_loop
    STA [$00],Y
    DEY #2 : BPL .second_top_loop
  .end_top_loop
    PLP
    RTS
}

%endfree(91)

