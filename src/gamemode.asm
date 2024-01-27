; $82:8963 AD 98 09    LDA $0998  [$7E:0998]
; $82:8966 29 FF 00    AND #$00FF
org $828963
    ; gamemode_shortcuts will either CLC or SEC
    ; to control if normal gameplay will happen on this frame
    JSL gamemode_start : BCS end_of_normal_gameplay

org $82896E
end_of_normal_gameplay:

if !FEATURE_SD2SNES
org $828B18
hook_door_transition_load_sprites:
    JML gamemode_door_transtion_load_sprites

org $82E4A2
    LDA #hook_door_transition_load_sprites

org $82E526
    JSL gamemode_door_transition : NOP
endif


org $85F800
print pc, " gamemode start"

gamemode_start:
{
    LDA !IH_CONTROLLER_PRI_NEW : BNE .check_shortcuts
    ; Overwritten logic
    LDA !GAMEMODE : AND #$00FF
    ; CLC so we won't skip normal gameplay
    CLC : RTL

  .check_shortcuts
    PHB
    PHK : PLB

    JSR gamemode_shortcuts
  .return
    %ai16()
    PHP

if !FEATURE_PRESETS
    ; don't load presets if we're in credits
    LDA !GAMEMODE : CMP #$0027 : BEQ .skip_load
    LDA !ram_custom_preset : BEQ .skip_load
    JSL preset_load
endif

  .skip_load
    ; Overwritten logic
    LDA !GAMEMODE : AND #$00FF
    PLP
    PLB
    RTL
}

; If the current game mode is $C (fading out to pause), set it to $8 (normal), so that
;  shortcuts involving the start button don't trigger accidental pauses.
; Called after handling most controller shortcuts, except save/load state (because the 
;  user might want to practice gravity jumps or something) and load preset (because
;  presets reset the game mode anyway).
skip_pause:
{
    PHP ; preserve carry
    LDA !GAMEMODE
    CMP #$000C
    BNE .done
    LDA #$0008
    STA !GAMEMODE
    LDA #$0001
    STZ $0723   ; Screen fade delay = 0
    STZ $0725   ; Screen fade counter = 0
    LDA $0051
    ORA #$000F
    STA $0051   ; Brightness = $F (max)
  .done:
    PLP
    RTS
}

if !FEATURE_SD2SNES
gamemode_door_transtion_load_sprites:
{
    ; Check for auto-save mid-transition
    LDA !ram_auto_save_state : BEQ .done : BMI .auto_save
    TDC : STA !ram_auto_save_state
  .auto_save
    PHP : PHB
    PHK : PLB
    JSL save_state
    PLB : PLP
  .done
    JML $82E4A9
}
endif

gamemode_shortcuts:
{
if !FEATURE_SD2SNES
    LDA !IH_CONTROLLER_PRI : CMP !sram_ctrl_save_state : BNE .skip_save_state
    AND !IH_CONTROLLER_PRI_NEW : BEQ .skip_save_state
    JMP .save_state
  .skip_save_state

    LDA !IH_CONTROLLER_PRI : CMP !sram_ctrl_load_state : BNE .skip_load_state
    AND !IH_CONTROLLER_PRI_NEW : BEQ .skip_load_state
    JMP .load_state
  .skip_load_state

    LDA !IH_CONTROLLER_PRI : CMP !sram_ctrl_auto_save_state : BNE .skip_auto_save_state
    AND !IH_CONTROLLER_PRI_NEW : BEQ .skip_auto_save_state
    JMP .auto_save_state
  .skip_auto_save_state
endif

if !FEATURE_PRESETS
    LDA !IH_CONTROLLER_PRI : CMP !sram_ctrl_save_custom_preset : BNE .skip_save_custom_preset
    AND !IH_CONTROLLER_PRI_NEW : BEQ .skip_save_custom_preset
    JMP .save_custom_preset
  .skip_save_custom_preset

    LDA !IH_CONTROLLER_PRI : CMP !sram_ctrl_load_custom_preset : BNE .skip_load_custom_preset
    AND !IH_CONTROLLER_PRI_NEW : BEQ .skip_load_custom_preset
    JMP .load_custom_preset
  .skip_load_custom_preset
endif

  .check_menu
    LDA !IH_CONTROLLER_PRI : AND !sram_ctrl_menu : CMP !sram_ctrl_menu : BNE .skip_check_menu
    AND !IH_CONTROLLER_PRI_NEW : BEQ .skip_check_menu
    JMP .menu
  .skip_check_menu

    ; No shortcuts matched, CLC so we won't skip normal gameplay
    CLC : RTS

if !FEATURE_SD2SNES
  .save_state
    JSL save_state
    %ai16()
    LDA !ram_auto_save_state : BMI .clc
    ; SEC to skip normal gameplay for one frame after saving state
    SEC : RTS
  .clc
    ; CLC to continue normal gameplay after auto-saving in a door transition
    CLC : RTS

  .load_state
    ; check if a saved state exists
    LDA !SRAM_SAVED_STATE : CMP #$5AFE : BNE .fail
    JSL load_state
    ; SEC to skip normal gameplay for one frame after loading state
    SEC : RTS

  .fail
    ; CLC to continue normal gameplay
    CLC : JMP skip_pause

  .auto_save_state
    LDA #$0001 : STA !ram_auto_save_state
    ; CLC to continue normal gameplay after setting savestate flag
    CLC : RTS
endif

if !FEATURE_PRESETS
  .save_custom_preset
    ; check gamestate first
    LDA $0998 : CMP #$0008 : BEQ .save_safe
    CMP #$000C : BMI .not_safe
    CMP #$0013 : BPL .not_safe

  .save_safe
    JSL custom_preset_save
    ; CLC to continue normal gameplay after saving preset
    %sfxconfirm()
    CLC : JMP skip_pause

  .load_custom_preset
    ; check if slot is populated first
    LDA !sram_custom_preset_slot
    %presetslotsize()
    LDA !PRESET_SLOTS_START,X : CMP #$5AFE : BEQ .load_safe

  .not_safe
    %sfxfail()
    ; CLC to continue normal gameplay after failing to save or load preset
    CLC : JMP skip_pause

  .load_safe
    STA !ram_custom_preset
    JSL preset_load
    ; SEC to skip normal gameplay for one frame after loading preset
    SEC : RTS
endif

  .menu
    ; Set IRQ vector
    LDA $AB : PHA
    LDA #$0004 : STA $AB

    JSR skip_pause

    ; Enter MainMenu
    JSL cm_start

    ; Restore IRQ vector
    PLA : STA $AB

    ; SEC to skip normal gameplay for one frame after handling the menu
    SEC : RTS
}

if !FEATURE_SD2SNES
gamemode_door_transition:
{
  .checkloadstate
    LDA !IH_CONTROLLER_PRI : BEQ .checktransition
    CMP !sram_ctrl_load_state : BNE .checktransition
    LDA !SRAM_SAVED_STATE : CMP #$5AFE : BNE .checktransition
    PHB : PHK : PLB
    JML load_state

  .checktransition
    LDA $0931 : BPL .checkloadstate
    RTL
}
endif

print pc, " gamemode end"
warnpc $85FD00 ; menu.asm
