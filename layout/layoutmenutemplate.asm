
pushpc
org $E68000
print pc, " layoutmenu start"

; -------------------------
; Room Layout menu
; (generated from template)
; -------------------------

LayoutMenu:
    dw #layout_override_grey_door_close
    dw #layout_doorportal
    dw #$FFFF
    dw #layout_dynamic_selectleft
    dw #layout_dynamic_leftdoor
    dw #$FFFF
    dw #layout_dynamic_selectright
    dw #layout_dynamic_rightdoor
    dw #$FFFF
    dw #layout_dynamic_selectup
    dw #layout_dynamic_updoor
    dw #$FFFF
    dw #layout_dynamic_selectdown
    dw #layout_dynamic_downdoor
    dw #$0000
    %cm_header("ROOM LAYOUT")

layout_override_grey_door_close:
    %cm_toggle("Override Door Close", !ram_override_grey_door_close, #$0001, #0)

layout_doorportal:
    %cm_toggle("Custom Portals", !ram_door_portals_enabled, #$0001, #0)

layout_dynamic_selectleft:
    dw !ACTION_DYNAMIC
    dl #!ram_door_portals_enabled
    dw #$0000
    dw #layout_leftright_selectleft

layout_leftright_selectleft:
    %cm_jsl("Select Portal Left Door", #LayoutLeftDoorMenu, #LayoutRegionDoorMenu)

layout_dynamic_leftdoor:
    dw !ACTION_DYNAMIC
    dl #!ram_door_portals_enabled
    dw #$0000
    dw #layout_leftright_leftdoor

layout_dynamic_selectright:
    dw !ACTION_DYNAMIC
    dl #!ram_door_portals_enabled
    dw #$0000
    dw #layout_leftright_selectright

layout_leftright_selectright:
    %cm_jsl("Select Portal Right Door", #LayoutRightDoorMenu, #LayoutRegionDoorMenu)

layout_dynamic_rightdoor:
    dw !ACTION_DYNAMIC
    dl #!ram_door_portals_enabled
    dw #$0000
    dw #layout_leftright_rightdoor

layout_dynamic_selectup:
    dw !ACTION_DYNAMIC
    dl #!ram_door_portals_enabled
    dw #$0000
    dw #layout_updown_selectup

layout_updown_selectup:
    %cm_jsl("Select Portal Up Door", #LayoutUpDoorMenu, #LayoutRegionDoorMenu)

layout_dynamic_updoor:
    dw !ACTION_DYNAMIC
    dl #!ram_door_portals_enabled
    dw #$0000
    dw #layout_updown_updoor

layout_dynamic_selectdown:
    dw !ACTION_DYNAMIC
    dl #!ram_door_portals_enabled
    dw #$0000
    dw #layout_updown_selectdown

layout_updown_selectdown:
    %cm_jsl("Select Portal Down Door", #LayoutDownDoorMenu, #LayoutRegionDoorMenu)

layout_dynamic_downdoor:
    dw !ACTION_DYNAMIC
    dl #!ram_door_portals_enabled
    dw #$0000
    dw #layout_updown_downdoor

LayoutLeftDoorMenu:
    LDA #$0000 : STA !ram_cm_door_direction_index
    LDA #!ram_door_portal_left : STA !ram_cm_door_menu_value
    LDA #!ram_door_portal_left>>16 : STA !ram_cm_door_menu_bank
    JML action_submenu

LayoutRightDoorMenu:
    LDA #$0002 : STA !ram_cm_door_direction_index
    LDA #!ram_door_portal_right : STA !ram_cm_door_menu_value
    LDA #!ram_door_portal_right>>16 : STA !ram_cm_door_menu_bank
    JML action_submenu

LayoutUpDoorMenu:
    LDA #$0004 : STA !ram_cm_door_direction_index
    LDA #!ram_door_portal_up : STA !ram_cm_door_menu_value
    LDA #!ram_door_portal_up>>16 : STA !ram_cm_door_menu_bank
    JML action_submenu

LayoutDownDoorMenu:
    LDA #$0006 : STA !ram_cm_door_direction_index
    LDA #!ram_door_portal_down : STA !ram_cm_door_menu_value
    LDA #!ram_door_portal_down>>16 : STA !ram_cm_door_menu_bank
    JML action_submenu

doormenu_select:
{
    LDA !ram_cm_door_menu_value : STA $16
    LDA !ram_cm_door_menu_bank : STA $18
    TYA : STA [$16]
    JML cm_previous_menu
}


; -----------------
; Regions
; -----------------
LayoutRegionDoorMenu:
    dw #doormenu_region_bb
    dw #doormenu_region_cl
    dw #doormenu_region_cr
    dw #doormenu_region_gb
    dw #doormenu_region_gm
    dw #doormenu_region_kl
    dw #doormenu_region_ln
    dw #doormenu_region_pb
    dw #doormenu_region_pm
    dw #doormenu_region_rb
    dw #doormenu_region_tr
    dw #doormenu_region_un
    dw #doormenu_region_wm
    dw #doormenu_region_ws
    dw #doormenu_region_ym
    dw #$FFFF
    dw #doormenu_region_exitonly
    dw #$0000
    %cm_header("SELECT REGION")

doormenu_region_bb:
    %cm_jsl("BB Blue Brinstar", #doormenu_selectsubmenu, #LayoutBlueBrinstarDoorMenu)

doormenu_region_cl:
    %cm_jsl("CL Croc's Lair", #doormenu_selectsubmenu, #LayoutCrocLairDoorMenu)

doormenu_region_cr:
    %cm_jsl("CR Crateria", #doormenu_selectsubmenu, #LayoutCrateriaDoorMenu)

doormenu_region_gb:
    %cm_jsl("GB Green Brinstar", #doormenu_selectsubmenu, #LayoutGreenBrinstarDoorMenu)

doormenu_region_gm:
    %cm_jsl("GM Green Maridia", #doormenu_selectsubmenu, #LayoutGreenMaridiaDoorMenu)

doormenu_region_kl:
    %cm_jsl("KL Kraid's Lair", #doormenu_selectsubmenu, #LayoutKraidLairDoorMenu)

doormenu_region_ln:
    %cm_jsl("LN Lower Norfair", #doormenu_selectsubmenu, #LayoutLowerNorfairDoorMenu)

doormenu_region_pb:
    %cm_jsl("PB Pink Brinstar", #doormenu_selectsubmenu, #LayoutPinkBrinstarDoorMenu)

doormenu_region_pm:
    %cm_jsl("PM Pink Maridia", #doormenu_selectsubmenu, #LayoutPinkMaridiaDoorMenu)

doormenu_region_rb:
    %cm_jsl("RB Red Brinstar", #doormenu_selectsubmenu, #LayoutRedBrinstarDoorMenu)

doormenu_region_tr:
    %cm_jsl("TR Tourian", #doormenu_selectsubmenu, #LayoutTourianDoorMenu)

doormenu_region_un:
    %cm_jsl("UN Upper Norfair", #doormenu_selectsubmenu, #LayoutUpperNorfairDoorMenu)

doormenu_region_wm:
    %cm_jsl("WM West Maridia", #doormenu_selectsubmenu, #LayoutWestMaridiaDoorMenu)

doormenu_region_ws:
    %cm_jsl("WS Wrecked Ship", #doormenu_selectsubmenu, #LayoutWreckedShipDoorMenu)

doormenu_region_ym:
    %cm_jsl("YM Yellow Maridia", #doormenu_selectsubmenu, #LayoutYellowMaridiaDoorMenu)

doormenu_region_exitonly:
    %cm_jsl("Exit Only Doors", #doormenu_selectsubmenu, #LayoutExitOnlyDoorMenu)

doormenu_selectsubmenu:
{
    LDA #doormenu_selectsubmenu>>8 : STA $17
    LDA !ram_cm_door_direction_index : STA $16
    LDA [$16],Y : BEQ .noMenu : TAY
    JML action_submenu

  .noMenu
    %sfxfail()
    RTL
}

doorsubmenu_select:
{
    LDA !ram_cm_door_menu_value : STA $16
    LDA !ram_cm_door_menu_bank : STA $18
    TYA : STA [$16]
    JSL cm_previous_menu
    JML cm_previous_menu
}

LayoutBlueBrinstarDoorMenu:
    dw #LayoutBlueBrinstarLeftDoorMenu
    dw #LayoutBlueBrinstarRightDoorMenu
    dw #LayoutBlueBrinstarUpDoorMenu
    dw #LayoutBlueBrinstarDownDoorMenu

LayoutCrocLairDoorMenu:
    dw #LayoutCrocLairLeftDoorMenu
    dw #LayoutCrocLairRightDoorMenu
    dw #LayoutCrocLairUpDoorMenu
    dw #LayoutCrocLairDownDoorMenu

LayoutCrateriaDoorMenu:
    dw #LayoutCrateriaLeftDoorMenu
    dw #LayoutCrateriaRightDoorMenu
    dw #LayoutCrateriaUpDoorMenu
    dw #LayoutCrateriaDownDoorMenu

LayoutGreenBrinstarDoorMenu:
    dw #LayoutGreenBrinstarLeftDoorMenu
    dw #LayoutGreenBrinstarRightDoorMenu
    dw #LayoutGreenBrinstarUpDoorMenu
    dw #LayoutGreenBrinstarDownDoorMenu

LayoutGreenMaridiaDoorMenu:
    dw #LayoutGreenMaridiaLeftDoorMenu
    dw #LayoutGreenMaridiaRightDoorMenu
    dw #LayoutGreenMaridiaUpDoorMenu
    dw #LayoutGreenMaridiaDownDoorMenu

LayoutKraidLairDoorMenu:
    dw #LayoutKraidLairLeftDoorMenu
    dw #LayoutKraidLairRightDoorMenu
    dw #LayoutKraidLairUpDoorMenu
    dw #LayoutKraidLairDownDoorMenu

LayoutLowerNorfairDoorMenu:
    dw #LayoutLowerNorfairLeftDoorMenu
    dw #LayoutLowerNorfairRightDoorMenu
    dw #LayoutLowerNorfairUpDoorMenu
    dw #LayoutLowerNorfairDownDoorMenu

LayoutPinkBrinstarDoorMenu:
    dw #LayoutPinkBrinstarLeftDoorMenu
    dw #LayoutPinkBrinstarRightDoorMenu
    dw #LayoutPinkBrinstarUpDoorMenu
    dw #LayoutPinkBrinstarDownDoorMenu

LayoutPinkMaridiaDoorMenu:
    dw #LayoutPinkMaridiaLeftDoorMenu
    dw #LayoutPinkMaridiaRightDoorMenu
    dw #LayoutPinkMaridiaUpDoorMenu
    dw #LayoutPinkMaridiaDownDoorMenu

LayoutRedBrinstarDoorMenu:
    dw #LayoutRedBrinstarLeftDoorMenu
    dw #LayoutRedBrinstarRightDoorMenu
    dw #LayoutRedBrinstarUpDoorMenu
    dw #LayoutRedBrinstarDownDoorMenu

LayoutTourianDoorMenu:
    dw #LayoutTourianLeftDoorMenu
    dw #LayoutTourianRightDoorMenu
    dw #LayoutTourianUpDoorMenu
    dw #LayoutTourianDownDoorMenu

LayoutUpperNorfairDoorMenu:
    dw #LayoutUpperNorfairLeftDoorMenu
    dw #LayoutUpperNorfairRightDoorMenu
    dw #LayoutUpperNorfairUpDoorMenu
    dw #LayoutUpperNorfairDownDoorMenu

LayoutWestMaridiaDoorMenu:
    dw #LayoutWestMaridiaLeftDoorMenu
    dw #LayoutWestMaridiaRightDoorMenu
    dw #LayoutWestMaridiaUpDoorMenu
    dw #LayoutWestMaridiaDownDoorMenu

LayoutWreckedShipDoorMenu:
    dw #LayoutWreckedShipLeftDoorMenu
    dw #LayoutWreckedShipRightDoorMenu
    dw #LayoutWreckedShipUpDoorMenu
    dw #LayoutWreckedShipDownDoorMenu

LayoutYellowMaridiaDoorMenu:
    dw #LayoutYellowMaridiaLeftDoorMenu
    dw #LayoutYellowMaridiaRightDoorMenu
    dw #LayoutYellowMaridiaUpDoorMenu
    dw #LayoutYellowMaridiaDownDoorMenu

LayoutExitOnlyDoorMenu:
    dw #LayoutExitOnlyLeftDoorMenu
    dw #LayoutExitOnlyRightDoorMenu
    dw #LayoutExitOnlyUpDoorMenu
    dw #LayoutExitOnlyDownDoorMenu


; -----------------
; Left Doors
; -----------------
LayoutBlueBrinstarLeftDoorMenu:

LayoutCrocLairLeftDoorMenu:

LayoutCrateriaLeftDoorMenu:

LayoutGreenBrinstarLeftDoorMenu:

LayoutGreenMaridiaLeftDoorMenu:

LayoutKraidLairLeftDoorMenu:

LayoutLowerNorfairLeftDoorMenu:

LayoutPinkBrinstarLeftDoorMenu:

LayoutPinkMaridiaLeftDoorMenu:

LayoutRedBrinstarLeftDoorMenu:

LayoutTourianLeftDoorMenu:

LayoutUpperNorfairLeftDoorMenu:

LayoutWestMaridiaLeftDoorMenu:

LayoutWreckedShipLeftDoorMenu:

LayoutYellowMaridiaLeftDoorMenu:

LayoutExitOnlyLeftDoorMenu:

layout_leftright_leftdoor:
    dw !ACTION_CHOICE_JSL_TEXT
    dl #!ram_door_portal_left
    dw #$0000
portals_left_vanilla_table:


; -----------------
; Right Doors
; -----------------
LayoutBlueBrinstarRightDoorMenu:

LayoutCrocLairRightDoorMenu:

LayoutCrateriaRightDoorMenu:

LayoutGreenBrinstarRightDoorMenu:

LayoutGreenMaridiaRightDoorMenu:

LayoutKraidLairRightDoorMenu:

LayoutLowerNorfairRightDoorMenu:

LayoutPinkBrinstarRightDoorMenu:

LayoutPinkMaridiaRightDoorMenu:

LayoutRedBrinstarRightDoorMenu:

LayoutTourianRightDoorMenu:

LayoutUpperNorfairRightDoorMenu:

LayoutWestMaridiaRightDoorMenu:

LayoutWreckedShipRightDoorMenu:

LayoutYellowMaridiaRightDoorMenu:

LayoutExitOnlyRightDoorMenu:

layout_leftright_rightdoor:
    dw !ACTION_CHOICE_JSL_TEXT
    dl #!ram_door_portal_right
    dw #$0000
portals_right_vanilla_table:


; -----------------
; Up Doors
; -----------------
LayoutBlueBrinstarUpDoorMenu:

LayoutCrocLairUpDoorMenu:

LayoutCrateriaUpDoorMenu:

LayoutGreenBrinstarUpDoorMenu:

LayoutGreenMaridiaUpDoorMenu:

LayoutKraidLairUpDoorMenu:

LayoutLowerNorfairUpDoorMenu:

LayoutPinkBrinstarUpDoorMenu:

LayoutPinkMaridiaUpDoorMenu:

LayoutRedBrinstarUpDoorMenu:

LayoutTourianUpDoorMenu:

LayoutUpperNorfairUpDoorMenu:

LayoutWestMaridiaUpDoorMenu:

LayoutWreckedShipUpDoorMenu:

LayoutYellowMaridiaUpDoorMenu:

LayoutExitOnlyUpDoorMenu:

layout_updown_updoor:
    dw !ACTION_CHOICE_JSL_TEXT
    dl #!ram_door_portal_up
    dw #$0000
portals_up_vanilla_table:


; -----------------
; Down Doors
; -----------------
LayoutBlueBrinstarDownDoorMenu:

LayoutCrocLairDownDoorMenu:

LayoutCrateriaDownDoorMenu:

LayoutGreenBrinstarDownDoorMenu:

LayoutGreenMaridiaDownDoorMenu:

LayoutKraidLairDownDoorMenu:

LayoutLowerNorfairDownDoorMenu:

LayoutPinkBrinstarDownDoorMenu:

LayoutPinkMaridiaDownDoorMenu:

LayoutRedBrinstarDownDoorMenu:

LayoutTourianDownDoorMenu:

LayoutUpperNorfairDownDoorMenu:

LayoutWestMaridiaDownDoorMenu:

LayoutWreckedShipDownDoorMenu:

LayoutYellowMaridiaDownDoorMenu:

LayoutExitOnlyDownDoorMenu:

layout_updown_downdoor:
    dw !ACTION_CHOICE_JSL_TEXT
    dl #!ram_door_portal_down
    dw #$0000
portals_down_vanilla_table:


print pc, " layoutmenu end"
pullpc
