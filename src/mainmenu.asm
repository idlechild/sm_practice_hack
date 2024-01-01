
; ------------
; Menu Helpers
; ------------

action_mainmenu:
{
    ; Set bank of new menu
    LDA !ram_cm_cursor_stack : TAX
    LDA.l MainMenuBanks,X : STA !ram_cm_menu_bank
    STA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2

    ; continue into action_submenu
}

action_submenu:
{
    ; Increment stack pointer by 2, then store current menu
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    TYA : STA !ram_cm_menu_stack,X

    BRA action_submenu_jump
}

action_submenu_jump:
{
    ; Set cursor to top for new menus
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    %sfxmove()
    JSL cm_calculate_max
    JSL cm_colors
    JSL cm_draw
    RTL
}


; -----------
; Main menu
; -----------

; MainMenu must exist in the same bank as the menu code.
; From here, submenus can branch out into different banks
; as long as all of its menu items and submenus are included.

MainMenu:
    dw #mm_goto_equipment
if !FEATURE_PRESETS
    dw #mm_goto_presets_menu
endif
    dw #mm_goto_events
    dw #mm_goto_misc
    dw #mm_goto_sprites
    dw #mm_goto_layout
    dw #mm_goto_gamemenu
if !FEATURE_SD2SNES
    dw #mm_goto_savestate
endif
    dw #mm_goto_ctrlsmenu
    dw #mm_goto_customize
    dw #mm_goto_arcade
    dw #$0000
    %cm_version_header("SM ARCADE HACK")

MainMenuBanks:
    dw #EquipmentMenu>>16
if !FEATURE_PRESETS
    dw #PresetsMenu>>16
endif
    dw #EventsMenu>>16
    dw #MiscMenu>>16
    dw #SpritesMenu>>16
    dw #LayoutMenu>>16
    dw #GameMenu>>16
if !FEATURE_SD2SNES
    dw #SavestateMenu>>16
endif
    dw #CtrlMenu>>16
    dw #CustomizeMenu>>16
    dw #ArcadeMenu>>16

mm_goto_equipment:
    %cm_mainmenu("Equipment", #EquipmentMenu)

if !FEATURE_PRESETS
mm_goto_presets_menu:
    %cm_mainmenu("Preset Options", #PresetsMenu)
endif

mm_goto_events:
    %cm_mainmenu("Events", #EventsMenu)

mm_goto_misc:
    %cm_mainmenu("Misc", #MiscMenu)

mm_goto_sprites:
    %cm_mainmenu("Sprite Features", #SpritesMenu)

mm_goto_layout:
    %cm_mainmenu("Room Layout", #LayoutMenu)

mm_goto_gamemenu:
    %cm_mainmenu("Game Options", #GameMenu)

if !FEATURE_SD2SNES
mm_goto_savestate:
    %cm_mainmenu("Savestate Settings", #SavestateMenu)
endif

mm_goto_ctrlsmenu:
    %cm_mainmenu("Controller Shortcuts", #CtrlMenu)

mm_goto_customize:
    %cm_mainmenu("Menu Customization", #CustomizeMenu)

mm_goto_arcade:
    %cm_mainmenu("Arcade", #ArcadeMenu)


if !FEATURE_PRESETS
; -------------------
; Preset Options menu
; -------------------

PresetsMenu:
    dw #presets_custom_preset_slot
    dw #presets_save_custom_preset
    dw #presets_load_custom_preset
    dw #$FFFF
    dw #presets_open_blue_doors
    dw #presets_load_with_enemies
    dw #$0000
    %cm_header("PRESET OPTIONS MENU")

presets_custom_preset_slot:
    %cm_numfield("Custom Preset Slot", !sram_custom_preset_slot, 0, !TOTAL_PRESET_SLOTS, 1, 2, #.routine)
  .routine
    ; ignore if not A, X, or Y
    LDA !IH_CONTROLLER_PRI_NEW : BIT #$40C0 : BNE .submenu
  .exit
    RTL
  .submenu
    ; undo increment from execute_numfield
    LDA !sram_custom_preset_slot : BEQ .zero
    DEC : BRA .skipzero
  .zero
    LDA !TOTAL_PRESET_SLOTS
  .skipzero
    STA !sram_custom_preset_slot
    ; determine which page to load
    CMP #$0010 : BPL .page2
    LDY.w #CustomPresetsMenu : BRA .done
  .page2
    CMP #$0020 : BPL .page3
    LDY.w #CustomPresetsMenu2 : BRA .done
  .page3
    LDY.w #CustomPresetsMenu3
  .done
    %setmenubank()
    JML action_submenu

presets_save_custom_preset:
    %cm_jsl("Save Custom Preset", .routine, #$0000)
  .routine
    ; check gamestate first
    LDA !GAMEMODE : CMP #$0008 : BEQ .safe
    CMP #$000C : BMI .not_safe
    CMP #$0013 : BPL .not_safe

  .safe
    JSL custom_preset_save
    LDA #$0001 : STA !ram_cm_leave
    %sfxconfirm()
    RTL

  .not_safe
    %sfxfail()
    RTL

presets_load_custom_preset:
    %cm_jsl("Load Custom Preset", .routine, #$0000)
  .routine
    ; check if slot is populated first
    LDA !sram_custom_preset_slot
    %presetslotsize()
    LDA !PRESET_SLOTS_START,X : CMP #$5AFE : BEQ .safe
    %sfxfail()
    RTL

  .safe
    STA !ram_custom_preset
    LDA #$0001 : STA !ram_cm_leave
    RTL

presets_open_blue_doors:
    %cm_toggle_inverted("Open Blue Doors", !sram_preset_close_doors, #$0001, #0)

presets_load_with_enemies:
    %cm_toggle("Load with Enemies", !sram_preset_preserve_enemies, #$0001, #0)


; -------------------
; Custom Preset Slots
; -------------------

CustomPresetsMenu:
    dw #custompreset_00
    dw #custompreset_01
    dw #custompreset_02
    dw #custompreset_03
    dw #custompreset_04
    dw #custompreset_05
    dw #custompreset_06
    dw #custompreset_07
    dw #custompreset_08
    dw #custompreset_09
    dw #custompreset_10
    dw #custompreset_11
    dw #custompreset_12
    dw #custompreset_13
    dw #custompreset_14
    dw #custompreset_15
    dw #$FFFF
    dw #custompreset_manage
    dw #custompreset_goto_page2
    dw #custompreset_goto_page3
    dw #$0000
    %cm_header("PRESS X TO NAME PRESETS")
    %cm_footer("PRESS Y TO TOGGLE DISPLAY")

CustomPresetsMenu2:
    dw #custompreset_16
    dw #custompreset_17
    dw #custompreset_18
    dw #custompreset_19
    dw #custompreset_20
    dw #custompreset_21
    dw #custompreset_22
    dw #custompreset_23
    dw #custompreset_24
    dw #custompreset_25
    dw #custompreset_26
    dw #custompreset_27
    dw #custompreset_28
    dw #custompreset_29
    dw #custompreset_30
    dw #custompreset_31
    dw #$FFFF
    dw #custompreset_manage
    dw #custompreset_goto_page1
    dw #custompreset_goto_page3
    dw #$0000
    %cm_header("PRESS X TO NAME PRESETS")
    %cm_footer("PRESS Y TO TOGGLE DISPLAY")

CustomPresetsMenu3:
    dw #custompreset_32
    dw #custompreset_33
    dw #custompreset_34
    dw #custompreset_35
    dw #custompreset_36
    dw #custompreset_37
    dw #custompreset_38
    dw #custompreset_39
    dw #custompreset_40
    dw #custompreset_41
    dw #custompreset_42
    dw #custompreset_43
    dw #custompreset_44
    dw #custompreset_45
    dw #custompreset_46
    dw #custompreset_47
    dw #$FFFF
    dw #custompreset_manage
    dw #custompreset_goto_page1
    dw #custompreset_goto_page2
    dw #$0000
    %cm_header("PRESS X TO NAME PRESETS")
    %cm_footer("PRESS Y TO TOGGLE DISPLAY")

    %cm_custompreset(00)
    %cm_custompreset(01)
    %cm_custompreset(02)
    %cm_custompreset(03)
    %cm_custompreset(04)
    %cm_custompreset(05)
    %cm_custompreset(06)
    %cm_custompreset(07)
    %cm_custompreset(08)
    %cm_custompreset(09)
    %cm_custompreset(10)
    %cm_custompreset(11)
    %cm_custompreset(12)
    %cm_custompreset(13)
    %cm_custompreset(14)
    %cm_custompreset(15)
    %cm_custompreset(16)
    %cm_custompreset(17)
    %cm_custompreset(18)
    %cm_custompreset(19)
    %cm_custompreset(20)
    %cm_custompreset(21)
    %cm_custompreset(22)
    %cm_custompreset(23)
    %cm_custompreset(24)
    %cm_custompreset(25)
    %cm_custompreset(26)
    %cm_custompreset(27)
    %cm_custompreset(28)
    %cm_custompreset(29)
    %cm_custompreset(30)
    %cm_custompreset(31)
    %cm_custompreset(32)
    %cm_custompreset(33)
    %cm_custompreset(34)
    %cm_custompreset(35)
    %cm_custompreset(36)
    %cm_custompreset(37)
    %cm_custompreset(38)
    %cm_custompreset(39)
    %cm_custompreset(40)
    %cm_custompreset(41)
    %cm_custompreset(42)
    %cm_custompreset(43)
    %cm_custompreset(44)
    %cm_custompreset(45)
    %cm_custompreset(46)
    %cm_custompreset(47)

custompreset_manage:
    %cm_jsl("Manage Preset Slots", .routine, #$0000)
  .routine
    LDA #$0000 : STA !ram_cm_manage_slots
    ; determine which page is currently loaded
    LDA !ram_cm_stack_index : DEC #2 : TAX
    ; exit if not in a color menu
    LDA !ram_cm_menu_stack,X : CMP.w #CustomPresetsMenu : BPL .page2
    LDY.w #ManagePresetsMenu : BRA .done
  .page2
    CMP.w #CustomPresetsMenu2 : BPL .page3
    LDY.w #ManagePresetsMenu2 : BRA .done
  .page3
    LDY.w #ManagePresetsMenu3
  .done
    JSL cm_previous_menu
    %setmenubank()
    JML action_submenu

ManagePresetsMenu:
    dw #managepreset_00
    dw #managepreset_01
    dw #managepreset_02
    dw #managepreset_03
    dw #managepreset_04
    dw #managepreset_05
    dw #managepreset_06
    dw #managepreset_07
    dw #managepreset_08
    dw #managepreset_09
    dw #managepreset_10
    dw #managepreset_11
    dw #managepreset_12
    dw #managepreset_13
    dw #managepreset_14
    dw #managepreset_15
    dw #$FFFF
    dw #$FFFF
    dw #managepreset_goto_page2
    dw #managepreset_goto_page3
    dw #$0000
    %cm_header("PRESS A TO SWAP PRESETS")
    %cm_footer("PRESS X TO DELETE PRESET")

ManagePresetsMenu2:
    dw #managepreset_16
    dw #managepreset_17
    dw #managepreset_18
    dw #managepreset_19
    dw #managepreset_20
    dw #managepreset_21
    dw #managepreset_22
    dw #managepreset_23
    dw #managepreset_24
    dw #managepreset_25
    dw #managepreset_26
    dw #managepreset_27
    dw #managepreset_28
    dw #managepreset_29
    dw #managepreset_30
    dw #managepreset_31
    dw #$FFFF
    dw #$FFFF
    dw #managepreset_goto_page1
    dw #managepreset_goto_page3
    dw #$0000
    %cm_header("PRESS A TO SWAP PRESETS")
    %cm_footer("PRESS X TO DELETE PRESET")

ManagePresetsMenu3:
    dw #managepreset_32
    dw #managepreset_33
    dw #managepreset_34
    dw #managepreset_35
    dw #managepreset_36
    dw #managepreset_37
    dw #managepreset_38
    dw #managepreset_39
    dw #managepreset_40
    dw #managepreset_41
    dw #managepreset_42
    dw #managepreset_43
    dw #managepreset_44
    dw #managepreset_45
    dw #managepreset_46
    dw #managepreset_47
    dw #$FFFF
    dw #$FFFF
    dw #managepreset_goto_page1
    dw #managepreset_goto_page2
    dw #$0000
    %cm_header("PRESS A TO SWAP PRESETS")
    %cm_footer("PRESS X TO DELETE PRESET")

    %cm_managepreset(00)
    %cm_managepreset(01)
    %cm_managepreset(02)
    %cm_managepreset(03)
    %cm_managepreset(04)
    %cm_managepreset(05)
    %cm_managepreset(06)
    %cm_managepreset(07)
    %cm_managepreset(08)
    %cm_managepreset(09)
    %cm_managepreset(10)
    %cm_managepreset(11)
    %cm_managepreset(12)
    %cm_managepreset(13)
    %cm_managepreset(14)
    %cm_managepreset(15)
    %cm_managepreset(16)
    %cm_managepreset(17)
    %cm_managepreset(18)
    %cm_managepreset(19)
    %cm_managepreset(20)
    %cm_managepreset(21)
    %cm_managepreset(22)
    %cm_managepreset(23)
    %cm_managepreset(24)
    %cm_managepreset(25)
    %cm_managepreset(26)
    %cm_managepreset(27)
    %cm_managepreset(28)
    %cm_managepreset(29)
    %cm_managepreset(30)
    %cm_managepreset(31)
    %cm_managepreset(32)
    %cm_managepreset(33)
    %cm_managepreset(34)
    %cm_managepreset(35)
    %cm_managepreset(36)
    %cm_managepreset(37)
    %cm_managepreset(38)
    %cm_managepreset(39)
    %cm_managepreset(40)
    %cm_managepreset(41)
    %cm_managepreset(42)
    %cm_managepreset(43)
    %cm_managepreset(44)
    %cm_managepreset(45)
    %cm_managepreset(46)
    %cm_managepreset(47)

custompreset_goto_page1:
    %cm_adjacent_submenu("GOTO PAGE ONE", #CustomPresetsMenu)

custompreset_goto_page2:
    %cm_adjacent_submenu("GOTO PAGE TWO", #CustomPresetsMenu2)

custompreset_goto_page3:
    %cm_adjacent_submenu("GOTO PAGE THREE", #CustomPresetsMenu3)

managepreset_goto_page1:
    %cm_jsl("GOTO PAGE ONE", .routine, #ManagePresetsMenu)
  .routine
    JSL cm_previous_menu
    %setmenubank()
    JML action_submenu

managepreset_goto_page2:
    %cm_jsl("GOTO PAGE TWO", managepreset_goto_page1_routine, #ManagePresetsMenu2)

managepreset_goto_page3:
    %cm_jsl("GOTO PAGE THREE", managepreset_goto_page1_routine, #ManagePresetsMenu3)

ManagePresetsConfirm:
    dw #managepreset_abort
    dw #$FFFF
    dw #managepreset_confirm
    dw #$0000
    %cm_header("DELETE SELECTED PRESET?")

managepreset_abort:
    %cm_jsl("ABORT", .routine, #$0000)
  .routine
    JML cm_previous_menu

managepreset_confirm:
    %cm_jsl("Confirm Delete Preset", .routine, #$0000)
  .routine
    LDA !ram_cm_selected_slot
    %presetslotsize()
    LDA #$DEAD : STA !PRESET_SLOTS_START,X
    LDA !ram_cm_selected_slot : ASL : TAX
    LDA #$DEAD : STA !sram_custom_preset_safewords,X
    JML cm_previous_menu
endif


; ----------------
; Equipment menu
; ----------------

EquipmentMenu:
    dw #eq_refill
    dw #eq_toggle_category
    dw #eq_goto_toggleitems
    dw #eq_goto_togglebeams
    dw #$FFFF
    dw #eq_currentenergy
    dw #eq_setetanks
    dw #$FFFF
    dw #eq_currentreserves
    dw #eq_setreserves
    dw #eq_reservemode
    dw #$FFFF
    dw #eq_currentmissiles
    dw #eq_setmissiles
    dw #$FFFF
    dw #eq_currentsupers
    dw #eq_setsupers
    dw #$FFFF
    dw #eq_currentpbs
    dw #eq_setpbs
    dw #$0000
    %cm_header("EQUIPMENT")

eq_refill:
    %cm_jsl("Refill", .refill, #$0000)
  .refill
    LDA !SAMUS_HP_MAX : STA !SAMUS_HP
    LDA !SAMUS_MISSILES_MAX : STA !SAMUS_MISSILES
    LDA !SAMUS_SUPERS_MAX : STA !SAMUS_SUPERS
    LDA !SAMUS_PBS_MAX : STA !SAMUS_PBS
    LDA !SAMUS_RESERVE_MAX : STA !SAMUS_RESERVE_ENERGY
    LDA #$0002 : JSL !SFX_LIB2 ; big energy pickup
    RTL

eq_toggle_category:
    %cm_submenu("Category Loadouts", #ToggleCategoryMenu)

eq_goto_toggleitems:
    %cm_jsl("Toggle Items", #eq_prepare_items_menu, #ToggleItemsMenu)

eq_goto_togglebeams:
    %cm_jsl("Toggle Beams", #eq_prepare_beams_menu, #ToggleBeamsMenu)

eq_currentenergy:
    %cm_numfield_word("Current Energy", !SAMUS_HP, 0, 1499, 1, 20, #0)

eq_setetanks:
    %cm_numfield("Energy Tanks", !ram_cm_etanks, 0, 28, 1, 1, .routine)
  .routine
    TAX : BEQ .zero
    LDA #$0063
  .loop
    DEX : BMI .endloop
    CLC : ADC #$0032
    BRA .loop
  .zero
    LDA #$0063
  .endloop
    STA !SAMUS_HP_MAX : STA !SAMUS_HP
    RTL

eq_currentreserves:
    %cm_numfield_word("Current Reserves", !SAMUS_RESERVE_ENERGY, 0, 200, 1, 20, #0)

eq_setreserves:
    %cm_numfield("Reserve Tanks", !ram_cm_reserve, 0, 4, 1, 1, .routine)
  .routine
    TAX : BEQ .zero
    LDA #$0000
  .loop
    DEX : BMI .endloop
    CLC : ADC #$0032
    BRA .loop
  .zero
    STA !SAMUS_RESERVE_MODE
  .endloop
    STA !SAMUS_RESERVE_ENERGY : STA !SAMUS_RESERVE_MAX
    RTL

eq_reservemode:
    dw !ACTION_CHOICE
    dl #!SAMUS_RESERVE_MODE
    dw #.routine
    db #$28, "Reserve Mode", #$FF
    db #$28, " UNOBTAINED", #$FF
    db #$28, "       AUTO", #$FF
    db #$28, "     MANUAL", #$FF
    db #$FF
  .routine
    LDA !SAMUS_RESERVE_MAX : BNE .end
    STA !SAMUS_RESERVE_MODE
    %sfxfail()
  .end
    RTL

eq_currentmissiles:
    %cm_numfield_word("Current Missiles", !SAMUS_MISSILES, 0, 230, 1, 20, #0)

eq_setmissiles:
    %cm_numfield_word("Missiles", !SAMUS_MISSILES_MAX, 0, 230, 2, 20, .routine)
  .routine
    LDA !SAMUS_MISSILES_MAX : STA !SAMUS_MISSILES
  .check
    CMP #$0000 : BNE .done
    LDA #$2C0F
    STA $7EC61C : STA $7EC61E : STA $7EC620
    STA $7EC65C : STA $7EC65E : STA $7EC660
    STA $7EC69C : STA $7EC69E : STA $7EC6A0
  .done
    RTL

eq_currentsupers:
    %cm_numfield("Current Super Missiles", !SAMUS_SUPERS, 0, 50, 1, 5, #0)

eq_setsupers:
    %cm_numfield("Super Missiles", !SAMUS_SUPERS_MAX, 0, 50, 1, 5, .routine)
  .routine
    LDA !SAMUS_SUPERS_MAX : STA !SAMUS_SUPERS
  .check
    CMP #$0000 : BNE .done
    LDA #$2C0F
    STA $7EC624 : STA $7EC626
    STA $7EC664 : STA $7EC666
    STA $7EC6A4 : STA $7EC6A6
  .done
    RTL

eq_currentpbs:
    %cm_numfield("Current Power Bombs", !SAMUS_PBS, 0, 50, 1, 5, #0)

eq_setpbs:
    %cm_numfield("Power Bombs", !SAMUS_PBS_MAX, 0, 50, 2, 10, .routine)
  .routine
    LDA !SAMUS_PBS_MAX : STA !SAMUS_PBS
  .check
    CMP #$0000 : BNE .done
    LDA #$2C0F
    STA $7EC62A : STA $7EC62C
    STA $7EC66A : STA $7EC66C
    STA $7EC6AA : STA $7EC6AC
  .done
    RTL

; ---------------------
; Toggle Category menu
; ---------------------

ToggleCategoryMenu:
    dw #cat_100
    dw #cat_any_new
    dw #cat_any_old
    dw #cat_14ice
    dw #cat_14speed
    dw #cat_rbo
    dw #cat_inf_cf
    dw #cat_nothing
    dw #$0000
    %cm_header("TOGGLE CATEGORY")

cat_100:
    %cm_jsl("100%", action_category, #$0000)

cat_any_new:
    %cm_jsl("Any% PRKD", action_category, #$0001)

cat_any_old:
    %cm_jsl("Any% KPDR", action_category, #$0002)

cat_14ice:
    %cm_jsl("14% Ice", action_category, #$0003)

cat_14speed:
    %cm_jsl("14% Speed", action_category, #$0004)

cat_rbo:
    %cm_jsl("RBO", action_category, #$0005)

cat_inf_cf:
    %cm_jsl("Infinite Crystal Flashes", action_category, #$0006)

cat_nothing:
    %cm_jsl("Nothing", action_category, #$0007)


action_category:
{
    TYA : ASL #4 : TAX

    LDA.l .table,X : STA !SAMUS_ITEMS_COLLECTED : STA !SAMUS_ITEMS_EQUIPPED : INX #2

    LDA.l .table,X : STA !SAMUS_BEAMS_COLLECTED : TAY
    AND #$000C : CMP #$000C : BEQ .murderBeam
    TYA : STA !SAMUS_BEAMS_EQUIPPED : INX #2 : BRA .doneMurderBeam

  .murderBeam
    TYA : AND #$100B : STA !SAMUS_BEAMS_EQUIPPED : INX #2

  .doneMurderBeam
    LDA.l .table,X : STA !SAMUS_HP : STA !SAMUS_HP_MAX : INX #2
    LDA.l .table,X : STA !SAMUS_MISSILES : STA !SAMUS_MISSILES_MAX : INX #2
    JSL eq_setmissiles_check
    LDA.l .table,X : STA !SAMUS_SUPERS : STA !SAMUS_SUPERS_MAX : INX #2
    JSL eq_setsupers_check
    LDA.l .table,X : STA !SAMUS_PBS : STA !SAMUS_PBS_MAX : INX #2
    JSL eq_setpbs_check
    LDA.l .table,X : STA !SAMUS_RESERVE_MAX : STA !SAMUS_RESERVE_ENERGY : INX #2

    JSL cm_set_etanks_and_reserve
    LDA !SAMUS_ITEMS_EQUIPPED
    JSL ti_grapple_check
    %sfxconfirm()
    JML $90AC8D ; update beam gfx

  .table
    ;  Items,  Beams,  Health, Miss,   Supers, PBs,    Reserv, Dummy
    dw #$732F, #$100F, #$05DB, #$00E6, #$0032, #$0032, #$00C8, #$0000        ; 100%
    dw #$3125, #$1007, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000        ; any% new
    dw #$3325, #$100B, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000        ; any% old
    dw #$1025, #$1002, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% ice
    dw #$3025, #$1000, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% speed
    dw #$710C, #$1001, #$031F, #$001E, #$0019, #$0014, #$0064, #$0000        ; rbo
    dw #$732F, #$100F, #$0031, #$01A4, #$005A, #$0063, #$0000, #$0000        ; crystal flash
    dw #$0000, #$0000, #$0063, #$0000, #$0000, #$0000, #$0000, #$0000        ; nothing
}


; ------------------
; Toggle Items menu
; ------------------

eq_prepare_items_menu:
{
    LDA !SAMUS_ITEMS_COLLECTED : BIT #$0001 : BEQ .noVaria
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0001 : BNE .equipVaria
    ; unequip
    LDA #$0002 : STA !ram_cm_varia : BRA .doneVaria
  .equipVaria
    LDA #$0001 : STA !ram_cm_varia : BRA .doneVaria
  .noVaria
    LDA #$0000 : STA !ram_cm_varia
  .doneVaria

    LDA !SAMUS_ITEMS_COLLECTED : BIT #$0020 : BEQ .noGravity
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0020 : BNE .equipGravity
    ; unequip
    LDA #$0002 : STA !ram_cm_gravity : BRA .doneGravity
  .equipGravity
    LDA #$0001 : STA !ram_cm_gravity : BRA .doneGravity
  .noGravity
    LDA #$0000 : STA !ram_cm_gravity
  .doneGravity

    LDA !SAMUS_ITEMS_COLLECTED : BIT #$0004 : BEQ .noMorph
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0004 : BNE .equipMorph
    ; unequip
    LDA #$0002 : STA !ram_cm_morph : BRA .doneMorph
  .equipMorph
    LDA #$0001 : STA !ram_cm_morph : BRA .doneMorph
  .noMorph
    LDA #$0000 : STA !ram_cm_morph
  .doneMorph

    LDA !SAMUS_ITEMS_COLLECTED : BIT #$1000 : BEQ .noBombs
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$1000 : BNE .equipBombs
    ; unequip
    LDA #$0002 : STA !ram_cm_bombs : BRA .doneBombs
  .equipBombs
    LDA #$0001 : STA !ram_cm_bombs : BRA .doneBombs
  .noBombs
    LDA #$0000 : STA !ram_cm_bombs
  .doneBombs

    LDA !SAMUS_ITEMS_COLLECTED : BIT #$0002 : BEQ .noSpring
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0002 : BNE .equipSpring
    ; unequip
    LDA #$0002 : STA !ram_cm_spring : BRA .doneSpring
  .equipSpring
    LDA #$0001 : STA !ram_cm_spring : BRA .doneSpring
  .noSpring
    LDA #$0000 : STA !ram_cm_spring
  .doneSpring

    LDA !SAMUS_ITEMS_COLLECTED : BIT #$0008 : BEQ .noScrew
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0008 : BNE .equipScrew
    ; unequip
    LDA #$0002 : STA !ram_cm_screw : BRA .doneScrew
  .equipScrew
    LDA #$0001 : STA !ram_cm_screw : BRA .doneScrew
  .noScrew
    LDA #$0000 : STA !ram_cm_screw
  .doneScrew

    LDA !SAMUS_ITEMS_COLLECTED : BIT #$0100 : BEQ .noHiJump
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0100 : BNE .equipHiJump
    ; unequip
    LDA #$0002 : STA !ram_cm_hijump : BRA .doneHiJump
  .equipHiJump
    LDA #$0001 : STA !ram_cm_hijump : BRA .doneHiJump
  .noHiJump
    LDA #$0000 : STA !ram_cm_hijump
  .doneHiJump

    LDA !SAMUS_ITEMS_COLLECTED : BIT #$0200 : BEQ .noSpace
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0200 : BNE .equipSpace
    ; unequip
    LDA #$0002 : STA !ram_cm_space : BRA .doneSpace
  .equipSpace
    LDA #$0001 : STA !ram_cm_space : BRA .doneSpace
  .noSpace
    LDA #$0000 : STA !ram_cm_space
  .doneSpace

    LDA !SAMUS_ITEMS_COLLECTED : BIT #$2000 : BEQ .noSpeed
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$2000 : BNE .equipSpeed
    ; unequip
    LDA #$0002 : STA !ram_cm_speed : BRA .doneSpeed
  .equipSpeed
    LDA #$0001 : STA !ram_cm_speed : BRA .doneSpeed
  .noSpeed
    LDA #$0000 : STA !ram_cm_speed
  .doneSpeed

    %setmenubank()
    JML action_submenu
}

ToggleItemsMenu:
    dw #ti_variasuit
    dw #ti_gravitysuit
    dw #arcade_gravitytimer
    dw #$FFFF
    dw #ti_morphball
    dw #ti_bomb
    dw #ti_springball
    dw #ti_screwattack
    dw #arcade_screwattacktimer
    dw #$FFFF
    dw #ti_hijumpboots
    dw #ti_spacejump
    dw #arcade_spacejumptimer
    dw #ti_speedbooster
    dw #$FFFF
    dw #ti_grapple
    dw #$0000
    %cm_header("TOGGLE ITEMS")

ti_variasuit:
    %cm_equipment_item("Varia Suit", !ram_cm_varia, #$0001, #$FFFE)

ti_gravitysuit:
    %cm_equipment_item("Gravity Suit", !ram_cm_gravity, #$0020, #$FFDF)

ti_morphball:
    %cm_equipment_item("Morph Ball", !ram_cm_morph, #$0004, #$FFFB)

ti_bomb:
    %cm_equipment_item("Bombs", !ram_cm_bombs, #$1000, #$EFFF)

ti_springball:
    %cm_equipment_item("Spring Ball", !ram_cm_spring, #$0002, #$FFFD)

ti_screwattack:
    %cm_equipment_item("Screw Attack", !ram_cm_screw, #$0008, #$FFF7)

ti_hijumpboots:
    %cm_equipment_item("Hi Jump Boots", !ram_cm_hijump, #$0100, #$FEFF)

ti_spacejump:
    %cm_equipment_item("Space Jump", !ram_cm_space, #$0200, #$FDFF)

ti_speedbooster:
    %cm_equipment_item("Speed Booster", !ram_cm_speed, #$2000, #$DFFF)

ti_grapple:
    %cm_toggle_bit("Grapple", !SAMUS_ITEMS_COLLECTED, #$4000, .routine)
  .routine
    LDA !SAMUS_ITEMS_EQUIPPED : EOR #$4000 : STA !SAMUS_ITEMS_EQUIPPED
  .check
    AND #$4000 : CMP #$4000 : BNE .off
    JML $809A2E
  .off
    LDA #$2C0F
    STA $7EC630 : STA $7EC632
    STA $7EC670 : STA $7EC672
    RTL

equipment_toggle_items:
{
; DP values are passed in from the cm_equipment_item macro that calls this routine
; Address is a 24-bit pointer to !ram_cm_<item>, Increment is the inverse, ToggleValue is the bitmask
    LDA [!DP_Address] : BEQ .unobtained
    DEC : BEQ .equipped
    ; unquipped
    LDA !SAMUS_ITEMS_EQUIPPED : AND !DP_Increment : STA !SAMUS_ITEMS_EQUIPPED
    LDA !SAMUS_ITEMS_COLLECTED : ORA !DP_ToggleValue : STA !SAMUS_ITEMS_COLLECTED
    RTL

  .equipped
    LDA !SAMUS_ITEMS_EQUIPPED : ORA !DP_ToggleValue : STA !SAMUS_ITEMS_EQUIPPED
    LDA !SAMUS_ITEMS_COLLECTED : ORA !DP_ToggleValue : STA !SAMUS_ITEMS_COLLECTED
    RTL

  .unobtained
    LDA !SAMUS_ITEMS_EQUIPPED : AND !DP_Increment : STA !SAMUS_ITEMS_EQUIPPED
    LDA !SAMUS_ITEMS_COLLECTED : AND !DP_Increment : STA !SAMUS_ITEMS_COLLECTED
    RTL
}


; -----------------
; Toggle Beams menu
; -----------------

eq_prepare_beams_menu:
{
    JSL setup_beams_ram
    %setmenubank()
    JML action_submenu
}

setup_beams_ram:
{
    LDA !SAMUS_BEAMS_COLLECTED : BIT #$1000 : BEQ .noCharge
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$1000 : BNE .equipCharge
    ; unequip Charge
    LDA #$0002 : STA !ram_cm_charge : BRA .doneCharge
  .equipCharge
    LDA #$0001 : STA !ram_cm_charge : BRA .doneCharge
  .noCharge
    LDA #$0000 : STA !ram_cm_charge
  .doneCharge

    LDA !SAMUS_BEAMS_COLLECTED : BIT #$0002 : BEQ .noIce
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0002 : BNE .equipIce
    ; unequip Ice
    LDA #$0002 : STA !ram_cm_ice : BRA .doneIce
  .equipIce
    LDA #$0001 : STA !ram_cm_ice : BRA .doneIce
  .noIce
    LDA #$0000 : STA !ram_cm_ice
  .doneIce

    LDA !SAMUS_BEAMS_COLLECTED : BIT #$0001 : BEQ .noWave
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0001 : BNE .equipWave
    ; unequip Wave
    LDA #$0002 : STA !ram_cm_wave : BRA .doneWave
  .equipWave
    LDA #$0001 : STA !ram_cm_wave : BRA .doneWave
  .noWave
    LDA #$0000 : STA !ram_cm_wave
  .doneWave

    LDA !SAMUS_BEAMS_COLLECTED : BIT #$0004 : BEQ .noSpazer
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0004 : BNE .equipSpazer
    ; unequip Spazer
    LDA #$0002 : STA !ram_cm_spazer : BRA .doneSpazer
  .equipSpazer
    LDA #$0001 : STA !ram_cm_spazer : BRA .doneSpazer
  .noSpazer
    LDA #$0000 : STA !ram_cm_spazer
  .doneSpazer

    LDA !SAMUS_BEAMS_COLLECTED : BIT #$0008 : BEQ .noPlasma
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0008 : BNE .equipPlasma
    ; unequip Plasma
    LDA #$0002 : STA !ram_cm_plasma : BRA .donePlasma
  .equipPlasma
    LDA #$0001 : STA !ram_cm_plasma : BRA .donePlasma
  .noPlasma
    LDA #$0000 : STA !ram_cm_plasma
  .donePlasma

    RTL
}

ToggleBeamsMenu:
    dw #tb_chargebeam
    dw #tb_icebeam
    dw #tb_wavebeam
    dw #tb_spazerbeam
    dw #tb_plasmabeam
    dw #arcade_plasmatimer
    dw #$FFFF
    dw #tb_glitchedbeams
    dw #$0000
    %cm_header("TOGGLE BEAMS")

tb_chargebeam:
    %cm_equipment_beam("Charge", !ram_cm_charge, #$1000, #$EFFF, #$100F)

tb_icebeam:
    %cm_equipment_beam("Ice", !ram_cm_ice, #$0002, #$FFFD, #$100F)

tb_wavebeam:
    %cm_equipment_beam("Wave", !ram_cm_wave, #$0001, #$FFFE, #$100F)

tb_spazerbeam:
    %cm_equipment_beam("Spazer", !ram_cm_spazer, #$0004, #$FFFB, #$1007)

tb_plasmabeam:
    %cm_equipment_beam("Plasma", !ram_cm_plasma, #$0008, #$FFF7, #$100B)

tb_glitchedbeams:
    %cm_submenu("Glitched Beams", #GlitchedBeamsMenu)

equipment_toggle_beams:
{
; DP values are passed in from the cm_equipment_beam macro that calls this routine
; Address is a 24-bit pointer to !ram_cm_<beam>, Increment is the inverse, ToggleValue is the bitmask, Temp is the AND for Spazer+Plasma safety
    LDA [!DP_Address] : BEQ .unobtained
    DEC : BEQ .equipped
    ; unquipped
    LDA !SAMUS_BEAMS_EQUIPPED : AND !DP_Increment : STA !SAMUS_BEAMS_EQUIPPED
    LDA !SAMUS_BEAMS_COLLECTED : ORA !DP_ToggleValue : STA !SAMUS_BEAMS_COLLECTED
    BRA .checkSpazer

  .equipped
    LDA !SAMUS_BEAMS_EQUIPPED : ORA !DP_ToggleValue : AND !DP_Temp : STA !SAMUS_BEAMS_EQUIPPED
    LDA !SAMUS_BEAMS_COLLECTED : ORA !DP_ToggleValue : STA !SAMUS_BEAMS_COLLECTED
    BRA .checkSpazer

  .unobtained
    LDA !SAMUS_BEAMS_EQUIPPED : AND !DP_Increment : STA !SAMUS_BEAMS_EQUIPPED
    LDA !SAMUS_BEAMS_COLLECTED : AND !DP_Increment : STA !SAMUS_BEAMS_COLLECTED

  .checkSpazer
    ; Reinitialize Spazer and Plasma since they affect each other
    LDA !SAMUS_BEAMS_COLLECTED : BIT #$0004 : BEQ .noSpazer
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0004 : BNE .equipSpazer
    ; unequip Spazer
    LDA #$0002 : STA !ram_cm_spazer : BRA .checkPlasma
  .equipSpazer
    LDA #$0001 : STA !ram_cm_spazer : BRA .checkPlasma
  .noSpazer
    LDA #$0000 : STA !ram_cm_spazer

  .checkPlasma
    LDA !SAMUS_BEAMS_COLLECTED : BIT #$0008 : BEQ .noPlasma
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0008 : BNE .equipPlasma
    ; unequip Plasma
    LDA #$0002 : STA !ram_cm_plasma : BRA .done
  .equipPlasma
    LDA #$0001 : STA !ram_cm_plasma : BRA .done
  .noPlasma
    LDA #$0000 : STA !ram_cm_plasma

  .done
    JML $90AC8D ; update beam gfx
}


; -------------------
; Glitched Beams menu
; -------------------

GlitchedBeamsMenu:
    dw #gb_murder
    dw #gb_spacetime
    dw #gb_chainsaw
    dw #gb_unnamed
    dw #$0000
    %cm_header("GLITCHED BEAMS")
    %cm_footer("BEWARE OF CRASHES")

gb_murder:
    %cm_jsl("Murder Beam", action_glitched_beam, #$100F)

gb_spacetime:
    %cm_jsl("Spacetime Beam", action_glitched_beam, #$100E)

gb_chainsaw:
    %cm_jsl("Chainsaw Beam", action_glitched_beam, #$100D)

gb_unnamed:
    %cm_jsl("Unnamed Glitched Beam", action_glitched_beam, #$100C)

action_glitched_beam:
{
    TYA : STA !SAMUS_BEAMS_EQUIPPED
    LDA !SAMUS_BEAMS_COLLECTED : ORA !SAMUS_BEAMS_EQUIPPED : STA !SAMUS_BEAMS_COLLECTED
    JSL setup_beams_ram
    LDA #$0042 : JSL !SFX_LIB1 ; unlabled, song dependent sound
    JSL $90AC8D ; update beam gfx
    RTL
}


; -----------
; Misc menu
; -----------

MiscMenu:
    dw #misc_bluesuit
    dw #misc_flashsuit
    dw #$FFFF
    dw #misc_gooslowdown
    dw #misc_healthbomb
    dw #$FFFF
    dw #misc_killenemies
    dw #misc_forcestand
    dw #$0000
    %cm_header("MISC")

misc_bluesuit:
    %cm_toggle("Blue Suit", !SAMUS_DASH_COUNTER, #$0004, #0)

misc_flashsuit:
    %cm_toggle("Flash Suit", !SAMUS_SHINE_TIMER, #$0001, #0)

misc_gooslowdown:
    %cm_numfield("Goo Slowdown", $7E0A66, 0, 4, 1, 1, #0)

misc_healthbomb:
    %cm_toggle("Health Bomb Flag", !SAMUS_HEALTH_WARNING, #$0001, #0)

misc_killenemies:
    %cm_jsl("Kill Enemies", .kill_loop, #0)
  .kill_loop
    ; 8000 = solid to Samus, 0400 = Ignore Samus projectiles, 0100 = Invisible
    TAX : LDA $0F86,X : BIT #$8500 : BNE .next_enemy
    ORA #$0200 : STA $0F86,X
  .next_enemy
    TXA : CLC : ADC #$0040 : CMP #$0400 : BNE .kill_loop
    LDA #$0009 : JSL !SFX_LIB2 ; enemy killed
    RTL

misc_forcestand:
    %cm_jsl("Force Samus to Stand Up", .routine, #0)
  .routine
    JSL $90E2D4
    %sfxconfirm()
    RTL


; ---------------
; Sprite Features
; ---------------

SpritesMenu:
    dw #sprites_samus_prio
    dw #sprites_show_samus_hitbox
    dw #sprites_show_enemy_hitbox
    dw #sprites_show_extended_spritemap_hitbox
    dw #sprites_show_custom_boss_hitbox
    dw #sprites_show_samusproj_hitbox
    dw #sprites_show_enemyproj_hitbox
    dw #sprites_show_proj_as_32x32
    dw #sprites_oob_viewer
    dw #$0000
    %cm_header("SPRITE FEATURES")

sprites_samus_prio:
    %cm_toggle_bit("Samus on Top", !sram_sprite_prio_flag, #$3000, #0)

sprites_show_samus_hitbox:
    %cm_toggle_bit("Show Samus Hitbox", !ram_sprite_feature_flags, !SPRITE_SAMUS_HITBOX, #0)

sprites_show_enemy_hitbox:
    %cm_toggle_bit("Normal Enemy Hitboxes", !ram_sprite_feature_flags, !SPRITE_ENEMY_HITBOX, #0)

sprites_show_extended_spritemap_hitbox:
    %cm_toggle_bit("Large Enemy Hitboxes", !ram_sprite_feature_flags, !SPRITE_EXTENDED_HITBOX, #0)

sprites_show_custom_boss_hitbox:
    %cm_toggle_bit("Special Boss Hitboxes", !ram_sprite_feature_flags, !SPRITE_BOSS_HITBOX, #0)

sprites_show_samusproj_hitbox:
    %cm_toggle_bit("Samus Projectile Hitbox", !ram_sprite_feature_flags, !SPRITE_SAMUS_PROJ, #0)

sprites_show_enemyproj_hitbox:
    %cm_toggle_bit("Enemy Projectile Hitbox", !ram_sprite_feature_flags, !SPRITE_ENEMY_PROJ, #0)

sprites_show_proj_as_32x32:
    %cm_toggle_bit("32x32 Projectile Boxes", !ram_sprite_feature_flags, !SPRITE_32x32_PROJ, #0)

sprites_oob_viewer:
    %cm_toggle_bit("OoB Tile Viewer", !ram_sprite_feature_flags, !SPRITE_OOB_WATCH, .routine)
  .routine
    LDA !ram_sprite_feature_flags : BIT !SPRITE_OOB_WATCH : BEQ .skip_oob
    JML upload_sprite_oob_tiles
  .skip_oob
    RTL


; -----------
; Events menu
; -----------
EventsMenu:
    dw #events_resetevents
    dw #events_resetdoors
    dw #events_resetitems
    dw #$FFFF
    dw #events_goto_bosses
    dw #$FFFF
    dw #events_zebesawake
    dw #events_maridiatubebroken
    dw #events_chozoacid
    dw #events_shaktool
    dw #events_tourian
    dw #events_metroid1
    dw #events_metroid2
    dw #events_metroid3
    dw #events_metroid4
    dw #events_mb1glass
    dw #events_zebesexploding
    dw #events_animals
    dw #$0000
    %cm_header("EVENTS")

events_resetevents:
    %cm_jsl("Reset All Events", .routine, #$0000)
  .routine
    LDA #$0000
    STA $7ED820 : STA $7ED822
    %sfxreset()
    RTL

events_resetdoors:
    %cm_jsl("Reset All Doors", .routine, #$0000)
  .routine
    PHP : %ai8()
    LDX #$B0
    LDA #$00
  .loop
    STA $7ED800,X
    INX : CPX #$D0 : BNE .loop
    PLP
    %sfxreset()
    RTL

events_resetitems:
    %cm_jsl("Reset All Items", .routine, #$0000)
  .routine
    PHP : %ai8()
    LDX #$70
    LDA #$00
  .loop
    STA $7ED800,X
    INX : CPX #$90 : BNE .loop
    PLP
    %sfxreset()
    RTL

events_goto_bosses:
    %cm_submenu("Bosses", #BossesMenu)

events_zebesawake:
    %cm_toggle_bit("Zebes Awake", $7ED820, #$0001, #0)

events_maridiatubebroken:
    %cm_toggle_bit("Maridia Tube Broken", $7ED820, #$0800, #0)

events_shaktool:
    %cm_toggle_bit("Shaktool Done Digging", $7ED820, #$2000, #0)

events_chozoacid:
    %cm_toggle_bit("Chozo Lowered Acid", $7ED821, #$0010, #0)

events_tourian:
    %cm_toggle_bit("Tourian Open", $7ED820, #$0400, #0)

events_metroid1:
    %cm_toggle_bit("1st Metroids Cleared", $7ED822, #$0001, #0)

events_metroid2:
    %cm_toggle_bit("2nd Metroids Cleared", $7ED822, #$0002, #0)

events_metroid3:
    %cm_toggle_bit("3rd Metroids Cleared", $7ED822, #$0004, #0)

events_metroid4:
    %cm_toggle_bit("4th Metroids Cleared", $7ED822, #$0008, #0)

events_mb1glass:
    %cm_toggle_bit("MB1 Glass Broken", $7ED820, #$0004, #0)

events_zebesexploding:
    %cm_toggle_bit("Zebes Set Ablaze", $7ED820, #$4000, #0)

events_animals:
    %cm_toggle_bit("Animals Saved", $7ED820, #$8000, #0)


; ------------
; Bosses menu
; ------------

BossesMenu:
    dw #boss_ceresridley
    dw #boss_bombtorizo
    dw #boss_spospo
    dw #boss_kraid
    dw #boss_phantoon
    dw #boss_botwoon
    dw #boss_draygon
    dw #boss_crocomire
    dw #boss_gt
    dw #boss_ridley
    dw #boss_mb
    dw #$FFFF
    dw #boss_kraid_statue
    dw #boss_phantoon_statue
    dw #boss_draygon_statue
    dw #boss_ridley_statue
    dw #$0000
    %cm_header("BOSSES")

boss_ceresridley:
    %cm_toggle_bit("Ceres Ridley", #$7ED82E, #$0001, #0)

boss_bombtorizo:
    %cm_toggle_bit("Bomb Torizo", #$7ED828, #$0004, #0)

boss_spospo:
    %cm_toggle_bit("Spore Spawn", #$7ED828, #$0200, #0)

boss_kraid:
    %cm_toggle_bit("Kraid", #$7ED828, #$0100, #0)

boss_phantoon:
    %cm_toggle_bit("Phantoon", #$7ED82A, #$0100, #0)

boss_botwoon:
    %cm_toggle_bit("Botwoon", #$7ED82C, #$0002, #0)

boss_draygon:
    %cm_toggle_bit("Draygon", #$7ED82C, #$0001, #0)

boss_crocomire:
    %cm_toggle_bit("Crocomire", #$7ED82A, #$0002, #0)

boss_gt:
    %cm_toggle_bit("Golden Torizo", #$7ED82A, #$0004, #0)

boss_ridley:
    %cm_toggle_bit("Ridley", #$7ED82A, #$0001, #0)

boss_mb:
    %cm_toggle_bit("Mother Brain", #$7ED82C, #$0200, #0)

boss_kraid_statue:
    %cm_toggle_bit("Kraid Statue", #$7ED820, #$0200, #0)

boss_phantoon_statue:
    %cm_toggle_bit("Phantoon Statue", #$7ED820, #$0040, #0)

boss_draygon_statue:
    %cm_toggle_bit("Draygon Statue", #$7ED820, #$0100, #0)

boss_ridley_statue:
    %cm_toggle_bit("Ridley Statue", #$7ED820, #$0080, #0)


; ----------
; Game menu
; ----------

GameMenu:
    dw #game_moonwalk
    dw #game_iconcancel
    dw #game_goto_controls
    dw #$FFFF
    dw #game_music_toggle
    dw #game_healthalarm
    dw #game_skip_splash
    dw #$FFFF
    dw #game_goto_debug
    dw #$0000
    %cm_header("GAME")

game_moonwalk:
    %cm_toggle("Moon Walk", $7E09E4, #$0001, #0)

game_iconcancel:
    %cm_toggle("Icon Cancel", $7E09EA, #$0001, #0)

game_goto_controls:
    %cm_submenu("Controller Setting Mode", #ControllerSettingMenu)

game_music_toggle:
    dw !ACTION_CHOICE
    dl #!sram_music_toggle
    dw .routine
    db #$28, "Music", #$FF
    db #$28, "         ON", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "   FAST OFF", #$FF
    db #$28, " PRESET OFF", #$FF
    db #$FF
  .routine
    ; Clear music queue
    STZ $0629 : STZ $062B : STZ $062D : STZ $062F
    STZ $0631 : STZ $0633 : STZ $0635 : STZ $0637
    STZ $0639 : STZ $063B : STZ $063D : STZ $063F
    CMP #$0000 : BEQ .resume_music
    STZ $2140
    RTL
  .resume_music
    LDA !MUSIC_DATA : CLC : ADC #$FF00 : PHA : STZ !MUSIC_DATA : PLA : JSL !MUSIC_ROUTINE
    LDA !MUSIC_TRACK : PHA : STZ !MUSIC_TRACK : PLA : JSL !MUSIC_ROUTINE
    RTL

game_healthalarm:
    dw !ACTION_CHOICE
    dl #!sram_healthalarm
    dw #$0000
    db #$28, "Low Health Alar", #$FF
    db #$28, "m   VANILLA", #$FF
    db #$28, "m    PB FIX", #$FF
    db #$28, "m  IMPROVED", #$FF
    db #$28, "m     NEVER", #$FF
    db #$FF

game_skip_splash:
    %cm_toggle("Fast Nintendo Splash", !sram_skip_splash, #$0001, #0)

game_goto_debug:
    %cm_submenu("Debug Settings", #DebugMenu)


; ----------
; Debug Menu
; ----------

DebugMenu:
    dw #game_debugmode
    dw #game_debugbrightness
    dw #game_invincibility
    dw #game_debugplms
    dw #game_debugprojectiles
    dw #$0000
    %cm_header("DEBUG SETTINGS")

game_debugmode:
    %cm_toggle("Debug Mode", $7E05D1, #$0001, #0)

game_debugbrightness:
    %cm_toggle("Debug CPU Brightness", $7E0DF4, #$0001, #0)

game_invincibility:
    %cm_toggle_bit("Invincibility", $7E0DE0, #$0007, #0)

game_debugplms:
    %cm_toggle_bit_inverted("Pseudo G-Mode", $7E1C23, #$8000, #0)

game_debugprojectiles:
    %cm_toggle_bit("Enable Projectiles", $7E198D, #$8000, #0)


; -------------------
; Controller Settings
; -------------------

ControllerSettingMenu:
    dw #controls_common_layouts
    dw #controls_save_to_file
    dw #$FFFF
    dw #controls_shot
    dw #controls_jump
    dw #controls_dash
    dw #controls_item_select
    dw #controls_item_cancel
    dw #controls_angle_up
    dw #controls_angle_down
    dw #$0000
    %cm_header("CONTROLLER SETTING MODE")

controls_common_layouts:
    %cm_submenu("Common Controller Layouts", #ControllerCommonMenu)

controls_shot:
    %cm_ctrl_input("        SHOT", !IH_INPUT_SHOT, action_submenu, #AssignControlsMenu)

controls_jump:
    %cm_ctrl_input("        JUMP", !IH_INPUT_JUMP, action_submenu, #AssignControlsMenu)

controls_dash:
    %cm_ctrl_input("        DASH", !IH_INPUT_RUN, action_submenu, #AssignControlsMenu)

controls_item_select:
    %cm_ctrl_input(" ITEM SELECT", !IH_INPUT_ITEM_SELECT, action_submenu, #AssignControlsMenu)

controls_item_cancel:
    %cm_ctrl_input(" ITEM CANCEL", !IH_INPUT_ITEM_CANCEL, action_submenu, #AssignControlsMenu)

controls_angle_up:
    %cm_ctrl_input("    ANGLE UP", !IH_INPUT_ANGLE_UP, action_submenu, #AssignAngleControlsMenu)

controls_angle_down:
    %cm_ctrl_input("  ANGLE DOWN", !IH_INPUT_ANGLE_DOWN, action_submenu, #AssignAngleControlsMenu)

controls_save_to_file:
    %cm_jsl("Save to File", .routine, #0)
  .routine
    LDA !GAMEMODE : CMP #$0002 : BEQ .fail
    LDA !CURRENT_SAVE_FILE : BEQ .fileA
    CMP #$0001 : BEQ .fileB
    CMP #$0002 : BEQ .fileC

  .fail
    %sfxfail()
    RTL

  .fileA
    LDX #$0020 : BRA .save

  .fileB
    LDX #$067C : BRA .save

  .fileC
    LDX #$0CD8

  .save
    LDA.w !IH_INPUT_SHOT : STA $700000,X : INX #2
    LDA.w !IH_INPUT_JUMP : STA $700000,X : INX #2
    LDA.w !IH_INPUT_RUN : STA $700000,X : INX #2
    LDA.w !IH_INPUT_ITEM_CANCEL : STA $700000,X : INX #2
    LDA.w !IH_INPUT_ITEM_SELECT : STA $700000,X : INX #2
    LDA.w !IH_INPUT_ANGLE_UP : STA $700000,X : INX #2
    LDA.w !IH_INPUT_ANGLE_DOWN : STA $700000,X
    %sfxconfirm()
    RTL

AssignControlsMenu:
    dw controls_assign_A
    dw controls_assign_B
    dw controls_assign_X
    dw controls_assign_Y
    dw controls_assign_Select
    dw controls_assign_L
    dw controls_assign_R
    dw #$0000
    %cm_header("ASSIGN AN INPUT")

controls_assign_A:
    %cm_jsl("A", action_assign_input, !CTRL_A)

controls_assign_B:
    %cm_jsl("B", action_assign_input, !CTRL_B)

controls_assign_X:
    %cm_jsl("X", action_assign_input, !CTRL_X)

controls_assign_Y:
    %cm_jsl("Y", action_assign_input, !CTRL_Y)

controls_assign_Select:
    %cm_jsl("Select", action_assign_input, !CTRL_SELECT)

controls_assign_L:
    %cm_jsl("L", action_assign_input, !CTRL_L)

controls_assign_R:
    %cm_jsl("R", action_assign_input, !CTRL_R)

AssignAngleControlsMenu:
    dw #controls_assign_L
    dw #controls_assign_R
    dw #$0000
    %cm_header("ASSIGN AN INPUT")
    %cm_footer("ONLY L OR R ALLOWED")

action_assign_input:
{
    LDA !ram_cm_ctrl_assign : STA $C2 : TAX  ; input address in $C2 and X
    LDA $7E0000,X : STA !ram_cm_ctrl_swap    ; save old input for later
    TYA : STA $7E0000,X                      ; store new input
    STY $C4                                  ; saved new input for later

    JSL check_duplicate_inputs

    ; determine which sfx to play
    CMP #$FFFF : BEQ .undetected
    %sfxconfirm()
    BRA .done
  .undetected
    %sfxgoback()
  .done
    JML cm_previous_menu
}

check_duplicate_inputs:
{
    ; ram_cm_ctrl_assign = word address of input being assigned
    ; ram_cm_ctrl_swap = previous input bitmask being moved
    ; X / $C2 = word address of new input
    ; Y / $C4 = new input bitmask

    LDA #$09B2 : CMP $C2 : BEQ .check_jump      ; check if we just assigned shot
    LDA $09B2 : BEQ .swap_shot                  ; check if shot is unassigned
    CMP $C4 : BNE .check_jump                   ; skip to check_jump if not a duplicate assignment
  .swap_shot
    JMP .shot                                   ; swap with shot

  .check_jump
    LDA #$09B4 : CMP $C2 : BEQ .check_dash
    LDA $09B4 : BEQ .swap_jump
    CMP $C4 : BNE .check_dash
  .swap_jump
    JMP .jump

  .check_dash
    LDA #$09B6 : CMP $C2 : BEQ .check_cancel
    LDA $09B6 : BEQ .swap_dash
    CMP $C4 : BNE .check_cancel
  .swap_dash
    JMP .dash

  .check_cancel
    LDA #$09B8 : CMP $C2 : BEQ .check_select
    LDA $09B8 : BEQ .swap_cancel
    CMP $C4 : BNE .check_select
  .swap_cancel
    JMP .cancel

  .check_select
    LDA #$09BA : CMP $C2 : BEQ .check_up
    LDA $09BA : BEQ .swap_select
    CMP $C4 : BNE .check_up
  .swap_select
    JMP .select

  .check_up
    LDA #$09BE : CMP $C2 : BEQ .check_down
    LDA $09BE : BEQ .swap_up
    CMP $C4 : BNE .check_down
  .swap_up
    JMP .up

  .check_down
    LDA #$09BC : CMP $C2 : BEQ .not_detected
    LDA $09BC : BEQ .swap_down
    CMP $C4 : BNE .not_detected
  .swap_down
    JMP .down

  .not_detected
    %sfxfail()
    LDA #$FFFF
    JML cm_previous_menu

  .shot
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .shot_safe  ; check if old input is L or R
    LDA #$0000 : STA $09B2                               ; unassign input
    RTL
  .shot_safe
    LDA !ram_cm_ctrl_swap : STA $09B2                    ; input is safe to be assigned
    RTL

  .jump
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .jump_safe
    LDA #$0000 : STA $09B4
    RTL
  .jump_safe
    LDA !ram_cm_ctrl_swap : STA $09B4
    RTL

  .dash
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .dash_safe
    LDA #$0000 : STA $09B6
    RTL
  .dash_safe
    LDA !ram_cm_ctrl_swap : STA $09B6
    RTL

  .cancel
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .cancel_safe
    LDA #$0000 : STA $09B8
    RTL
  .cancel_safe
    LDA !ram_cm_ctrl_swap : STA $09B8
    RTL

  .select
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .select_safe
    LDA #$0000 : STA $09BA
    RTL
  .select_safe
    LDA !ram_cm_ctrl_swap : STA $09BA
    RTL

  .up
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .unbind_up  ; check if input is L or R, unbind if not
    LDA !ram_cm_ctrl_swap : STA $09BE                    ; safe to assign input
    CMP $09BC : BEQ .swap_angle_down                     ; check if input matches angle down
    RTL

  .unbind_up
    STA $09BE               ; unassign up
    RTL

  .swap_angle_down
    CMP #$0020 : BNE .angle_down_l  ; check if angle up is assigned to L
    LDA #$0010 : STA $09BC  ; assign R to angle down
    RTL
  .angle_down_l
    LDA #$0020 : STA $09BC  ; assign L to angle down
    RTL

  .down
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .unbind_down
    LDA !ram_cm_ctrl_swap : STA $09BC
    CMP $09BE : BEQ .swap_angle_up
    RTL

  .unbind_down
    STA $09BC               ; unassign down
    RTL

  .swap_angle_up
    CMP #$0020 : BNE .angle_up_l
    LDA #$0010 : STA $09BE
    RTL
  .angle_up_l
    LDA #$0020 : STA $09BE
    RTL
}

ControllerCommonMenu:
    dw #controls_common_default
    dw #controls_common_d2
    dw #controls_common_d3
    dw #controls_common_d4
    dw #controls_common_d5
    dw #$0000
    %cm_header("COMMON CONTROLLER LAYOUTS")
    %cm_footer("WIKI.SUPERMETROID.RUN")

controls_common_default:
    %cm_jsl("Default (D1)", #action_set_common_controls, #$0000)

controls_common_d2:
    %cm_jsl("Select+Cancel Swap (D2)", #action_set_common_controls, #$000E)

controls_common_d3:
    %cm_jsl("D2 + Shot+Select Swap (D3)", #action_set_common_controls, #$001C)

controls_common_d4:
    %cm_jsl("MMX Style (D4)", #action_set_common_controls, #$002A)

controls_common_d5:
    %cm_jsl("SMW Style (D5)", #action_set_common_controls, #$0038)

action_set_common_controls:
{
    TYX
    LDA.l ControllerLayoutTable,X : STA.w !IH_INPUT_SHOT
    LDA.l ControllerLayoutTable+2,X : STA.w !IH_INPUT_JUMP
    LDA.l ControllerLayoutTable+4,X : STA.w !IH_INPUT_RUN
    LDA.l ControllerLayoutTable+6,X : STA.w !IH_INPUT_ITEM_CANCEL
    LDA.l ControllerLayoutTable+8,X : STA.w !IH_INPUT_ITEM_SELECT
    LDA.l ControllerLayoutTable+10,X : STA.w !IH_INPUT_ANGLE_DOWN
    LDA.l ControllerLayoutTable+12,X : STA.w !IH_INPUT_ANGLE_UP
    %sfxconfirm()
    JML cm_previous_menu

ControllerLayoutTable:
    ;  shot     jump     dash     cancel        select        down     up
    dw !CTRL_X, !CTRL_A, !CTRL_B, !CTRL_Y,      !CTRL_SELECT, !CTRL_L, !CTRL_R ; Default (D1)
    dw !CTRL_X, !CTRL_A, !CTRL_B, !CTRL_SELECT, !CTRL_Y,      !CTRL_L, !CTRL_R ; Select+Cancel Swap (D2)
    dw !CTRL_Y, !CTRL_A, !CTRL_B, !CTRL_SELECT, !CTRL_X,      !CTRL_L, !CTRL_R ; D2 + Shot+Select Swap (D3)
    dw !CTRL_Y, !CTRL_B, !CTRL_A, !CTRL_SELECT, !CTRL_X,      !CTRL_L, !CTRL_R ; MMX Style (D4)
    dw !CTRL_X, !CTRL_B, !CTRL_Y, !CTRL_SELECT, !CTRL_A,      !CTRL_L, !CTRL_R ; SMW Style (D5)
}



if !FEATURE_SD2SNES
; --------------
; Savestate Menu
; --------------

SavestateMenu:
    dw #save_rerandomize
    dw #save_middoorsave
    dw #save_alwayssave
    dw #save_delete
    dw #$0000
    %cm_header("SAVESTATE SETTINGS")

save_rerandomize:
    %cm_toggle("Rerandomize", !sram_rerandomize, #$0001, #0)

save_middoorsave:
    %cm_toggle("Auto-Save Mid-Door", !ram_auto_save_state, #$0001, #0)

save_alwayssave:
    %cm_toggle("Auto-Save Every Door", !ram_auto_save_state+1, #$80, #0)

save_delete:
    %cm_jsl("Delete Savestate", .routine, #$DEAD)
  .routine
    TYA : STA !SRAM_SAVED_STATE
    %sfxconfirm()
    RTL
endif


; ----------
; Ctrl Menu
; ----------

CtrlMenu:
    dw #ctrl_menu
if !FEATURE_SD2SNES
    dw #ctrl_save_state
    dw #ctrl_load_state
    dw #ctrl_auto_save_state
endif
if !FEATURE_PRESETS
    dw #ctrl_save_custom_preset
    dw #ctrl_load_custom_preset
endif
    dw #$FFFF
    dw #ctrl_clear_shortcuts
    dw #ctrl_reset_defaults
    dw #$0000
    %cm_header("CONTROLLER SHORTCUTS")
    %cm_footer("PRESS AND HOLD FOR 2 SEC")

ctrl_menu:
    %cm_ctrl_shortcut("Main menu", !sram_ctrl_menu)

if !FEATURE_SD2SNES
ctrl_save_state:
    %cm_ctrl_shortcut("Save State", !sram_ctrl_save_state)

ctrl_load_state:
    %cm_ctrl_shortcut("Load State", !sram_ctrl_load_state)

ctrl_auto_save_state:
    %cm_ctrl_shortcut("Auto Save State", !sram_ctrl_auto_save_state)
endif

if !FEATURE_PRESETS
ctrl_save_custom_preset:
    %cm_ctrl_shortcut("Save Cust Preset", !sram_ctrl_save_custom_preset)

ctrl_load_custom_preset:
    %cm_ctrl_shortcut("Load Cust Preset", !sram_ctrl_load_custom_preset)
endif

ctrl_clear_shortcuts:
    %cm_jsl("Clear All Shortcuts", .routine, #$0000)
  .routine
    TYA
    STA !sram_ctrl_save_state
    STA !sram_ctrl_load_state
    STA !sram_ctrl_auto_save_state
    STA !sram_ctrl_save_custom_preset
    STA !sram_ctrl_load_custom_preset
    ; menu to default, Start + Select
    LDA #$3000 : STA !sram_ctrl_menu
    %sfxconfirm()
    RTL

ctrl_reset_defaults:
    %cm_jsl("Reset to Defaults", .routine, #$0000)
  .routine
    %sfxreset()
   JML init_controller_shortcuts

