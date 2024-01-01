
; hijack when clearing bank 7E
org $808490
    PHA
    LDX #$3FFE
  .clear_bank_loop
    STZ $0000,X
    STZ $4000,X
    STZ $8000,X
    STZ $C000,X
    DEX : DEX
    BPL .clear_bank_loop
    JSL init_sram
    PLA
    BRA .end_clear_bank

warnpc $8084AF

org $8084AF
  .end_clear_bank


org $81FC00
print pc, " init start"

init_sram:
{
    ; Check if we should initialize SRAM
    LDA !sram_initialized : CMP #$5AFE : BEQ .sram_initialized
    TDC : LDX #$01FC
  .clear_sram_loop
    STA !sram_initialized+$2,X
    STA !sram_initialized+$102,X
    DEX : DEX
    BPL .clear_sram_loop
    STA !sram_initialized+$1FE
    LDA #$5AFE : STA !sram_initialized
    JSL init_controller_shortcuts
    JSL init_menu_customization

  .sram_initialized
    LDA #$0001 : STA !ram_cm_dummy_on
    RTL
}

init_controller_shortcuts:
{
    LDA #$3000 : STA !sram_ctrl_menu                  ; Start + Select
    LDA #$6010 : STA !sram_ctrl_save_state            ; Select + Y + R
    LDA #$6020 : STA !sram_ctrl_load_state            ; Select + Y + L
    LDA #$0000 : STA !sram_ctrl_auto_save_state
    LDA #$0000 : STA !sram_ctrl_save_custom_preset
    LDA #$0000 : STA !sram_ctrl_load_custom_preset
    RTL
}

init_menu_customization:
{
    LDA #$0002 : STA !sram_custompalette_profile
    LDA #$7277 : STA !sram_palette_border
    LDA #$48F3 : STA !sram_palette_headeroutline
    LDA #$7FFF : STA !sram_palette_text
    LDA #$0000 : STA !sram_palette_background
    LDA #$0000 : STA !sram_palette_numoutline
    LDA #$7FFF : STA !sram_palette_numfill
    LDA #$4376 : STA !sram_palette_toggleon
    LDA #$761F : STA !sram_palette_seltext
    LDA #$0000 : STA !sram_palette_seltextbg
    LDA #$0000 : STA !sram_palette_numseloutline
    LDA #$761F : STA !sram_palette_numsel

    LDA #$0001 : STA !sram_menu_background
    LDA #$0002 : STA !sram_cm_scroll_delay

  .soundFX
    ; branch called by sfx_reset in customizemenu.asm
    LDA #$0037 : STA !sram_customsfx_move
    LDA #$002A : STA !sram_customsfx_toggle
    LDA #$0038 : STA !sram_customsfx_number
    LDA #$0028 : STA !sram_customsfx_confirm
    LDA #$0007 : STA !sram_customsfx_goback
    RTL
}

init_controller_bindings:
{
    ; check if any non-dpad bindings are set
    LDX #$000A
    LDA.w !IH_INPUT_SHOT+$0C
  .loopBindings
    ORA.w !IH_INPUT_SHOT,X
    DEX #2 : BPL .loopBindings
    AND #$FFF0 : BNE .done

    ; load default dpad bindings
    LDA #$0800 : STA.w !INPUT_BIND_UP
    LSR : STA.w !INPUT_BIND_DOWN
    LSR : STA.w !INPUT_BIND_LEFT
    LSR : STA.w !INPUT_BIND_RIGHT

    ; load default non-dpad bindings
    LDX #$000C
  .loopTable
    LDA.l ControllerLayoutTable,X : STA.w !IH_INPUT_SHOT,X
    DEX #2 : BPL .loopTable

  .done
    RTL
}

print pc, " init end"
warnpc $81FF00 ; Special thanks
