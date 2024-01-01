
pushpc
org $E68000
print pc, " layoutmenu start"

; -------------------------
; Room Layout menu
; (generated from template)
; -------------------------

!layout_left_door_count = #$00DC
!layout_right_door_count = #$00D8
!layout_up_door_count = #$001A
!layout_down_door_count = #$001A

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
    dw #doormenu_left_8FA6
    dw #doormenu_left_8FFA
    dw #doormenu_left_8FE2
    dw #doormenu_left_8ECE
    dw #doormenu_left_8EAA
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_8FA6:
    %cm_jsl("BB Alpha Missiles", #doorsubmenu_select, #$0000)

doormenu_left_8FFA:
    %cm_jsl("BB Billy Mays", #doorsubmenu_select, #$0001)

doormenu_left_8FE2:
    %cm_jsl("BB Boulder", #doorsubmenu_select, #$0002)

doormenu_left_8ECE:
    %cm_jsl("BB Construction Zone", #doorsubmenu_select, #$0003)

doormenu_left_8EAA:
    %cm_jsl("BB Morph Ball", #doorsubmenu_select, #$0004)

LayoutCrocLairLeftDoorMenu:
    dw #doormenu_left_9516
    dw #doormenu_left_9522
    dw #doormenu_left_94F2
    dw #doormenu_left_94C2
    dw #doormenu_left_9456
    dw #doormenu_left_9432
    dw #doormenu_left_946E
    dw #doormenu_left_9492
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_9516:
    %cm_jsl("CL Grapple Beam (Lower)", #doorsubmenu_select, #$0005)

doormenu_left_9522:
    %cm_jsl("CL Grapple Beam (Upper)", #doorsubmenu_select, #$0006)

doormenu_left_94F2:
    %cm_jsl("CL Grapple Tutorial 2", #doorsubmenu_select, #$0007)

doormenu_left_94C2:
    %cm_jsl("CL Grapple Tutorial 3", #doorsubmenu_select, #$0008)

doormenu_left_9456:
    %cm_jsl("CL Post Croc Farm (Lower)", #doorsubmenu_select, #$0009)

doormenu_left_9432:
    %cm_jsl("CL Post Croc Farm (Upper)", #doorsubmenu_select, #$000A)

doormenu_left_946E:
    %cm_jsl("CL Post Croc Power Bombs", #doorsubmenu_select, #$000B)

doormenu_left_9492:
    %cm_jsl("CL Post Croc Shaft", #doorsubmenu_select, #$000C)

LayoutCrateriaLeftDoorMenu:
    dw #doormenu_left_8C8E
    dw #doormenu_left_8C9A
    dw #doormenu_left_8A1E
    dw #doormenu_left_ADE8
    dw #doormenu_left_ADDC
    dw #doormenu_left_ADD0
    dw #doormenu_left_8A36
    dw #doormenu_left_8AD2
    dw #doormenu_left_8A72
    dw #doormenu_left_8BC2
    dw #doormenu_left_8AA2
    dw #doormenu_left_8B0E
    dw #doormenu_left_8946
    dw #doormenu_left_8BFE
    dw #doormenu_left_8C52
    dw #doormenu_left_8C3A
    dw #doormenu_left_8C5E
    dw #doormenu_crateria_left_goto_page2
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

LayoutCrateriaLeftDoorMenu2:
    dw #doormenu_left_8922
    dw #doormenu_left_8C16
    dw #doormenu_left_8AEA
    dw #doormenu_left_AD94
    dw #doormenu_left_AD88
    dw #doormenu_left_AD7C
    dw #doormenu_left_8B86
    dw #doormenu_left_8BDA
    dw #doormenu_left_8BF2
    dw #doormenu_left_89E2
    dw #doormenu_left_89D6
    dw #doormenu_left_8A06
    dw #doormenu_left_89FA
    dw #doormenu_left_89EE
    dw #doormenu_crateria_left_goto_page1
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_crateria_left_goto_page1:
    %cm_adjacent_submenu("GOTO PAGE ONE", #LayoutCrateriaLeftDoorMenu)

doormenu_crateria_left_goto_page2:
    %cm_adjacent_submenu("GOTO PAGE TWO", #LayoutCrateriaLeftDoorMenu2)

doormenu_left_8C8E:
    %cm_jsl("CR 230 Bombway", #doorsubmenu_select, #$000D)

doormenu_left_8C9A:
    %cm_jsl("CR 230 Missiles", #doorsubmenu_select, #$000E)

doormenu_left_8A1E:
    %cm_jsl("CR Bowling Alley Path", #doorsubmenu_select, #$000F)

doormenu_left_ADE8:
    %cm_jsl("CR Climb (Lower)", #doorsubmenu_select, #$0010)

doormenu_left_ADDC:
    %cm_jsl("CR Climb (Middle)", #doorsubmenu_select, #$0011)

doormenu_left_ADD0:
    %cm_jsl("CR Climb (Upper)", #doorsubmenu_select, #$0012)

doormenu_left_8A36:
    %cm_jsl("CR Crateria Kihunters", #doorsubmenu_select, #$0013)

doormenu_left_8AD2:
    %cm_jsl("CR Crateria Tube", #doorsubmenu_select, #$0014)

doormenu_left_8A72:
    %cm_jsl("CR East Ocean", #doorsubmenu_select, #$0015)

doormenu_left_8BC2:
    %cm_jsl("CR Flyway", #doorsubmenu_select, #$0016)

doormenu_left_8AA2:
    %cm_jsl("CR Forgotten Highway Elbow", #doorsubmenu_select, #$0017)

doormenu_left_8B0E:
    %cm_jsl("CR Gauntlet Energy Tank", #doorsubmenu_select, #$0018)

doormenu_left_8946:
    %cm_jsl("CR Gauntlet Entrance", #doorsubmenu_select, #$0019)

doormenu_left_8BFE:
    %cm_jsl("CR Green Brin Elevator", #doorsubmenu_select, #$001A)

doormenu_left_8C52:
    %cm_jsl("CR Green Pirates (Lower)", #doorsubmenu_select, #$001B)

doormenu_left_8C3A:
    %cm_jsl("CR Green Pirates (Middle)", #doorsubmenu_select, #$001C)

doormenu_left_8C5E:
    %cm_jsl("CR Green Pirates (Upper)", #doorsubmenu_select, #$001D)

doormenu_left_8922:
    %cm_jsl("CR Landing Site (Lower)", #doorsubmenu_select, #$001E)

doormenu_left_8C16:
    %cm_jsl("CR Lower Mushrooms", #doorsubmenu_select, #$001F)

doormenu_left_8AEA:
    %cm_jsl("CR Moat", #doorsubmenu_select, #$0020)

doormenu_left_AD94:
    %cm_jsl("CR Parlor (To Bombs)", #doorsubmenu_select, #$0021)

doormenu_left_AD88:
    %cm_jsl("CR Parlor (To Map)", #doorsubmenu_select, #$0022)

doormenu_left_AD7C:
    %cm_jsl("CR Parlor (To Ship)", #doorsubmenu_select, #$0023)

doormenu_left_8B86:
    %cm_jsl("CR Pit", #doorsubmenu_select, #$0024)

doormenu_left_8BDA:
    %cm_jsl("CR Pre-Map Flyway", #doorsubmenu_select, #$0025)

doormenu_left_8BF2:
    %cm_jsl("CR Terminator", #doorsubmenu_select, #$0026)

doormenu_left_89E2:
    %cm_jsl("CR West Ocean (Cave)", #doorsubmenu_select, #$0027)

doormenu_left_89D6:
    %cm_jsl("CR West Ocean (Lower)", #doorsubmenu_select, #$0028)

doormenu_left_8A06:
    %cm_jsl("CR West Ocean (Mid-Lower)", #doorsubmenu_select, #$0029)

doormenu_left_89FA:
    %cm_jsl("CR West Ocean (Mid-Upper)", #doorsubmenu_select, #$002A)

doormenu_left_89EE:
    %cm_jsl("CR West Ocean (Upper)", #doorsubmenu_select, #$002B)

LayoutGreenBrinstarLeftDoorMenu:
    dw #doormenu_left_8F16
    dw #doormenu_left_8D8A
    dw #doormenu_left_8D96
    dw #doormenu_left_8D42
    dw #doormenu_left_8D5A
    dw #doormenu_left_8F46
    dw #doormenu_left_8F2E
    dw #doormenu_left_8F5E
    dw #doormenu_left_8E92
    dw #doormenu_left_8E86
    dw #doormenu_left_8CE2
    dw #doormenu_left_8CEE
    dw #doormenu_left_8CD6
    dw #doormenu_left_8F0A
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_8F16:
    %cm_jsl("GB Brinstar Beetoms", #doorsubmenu_select, #$002C)

doormenu_left_8D8A:
    %cm_jsl("GB Brinstar Firefleas", #doorsubmenu_select, #$002D)

doormenu_left_8D96:
    %cm_jsl("GB Brinstar Missile Refill", #doorsubmenu_select, #$002E)

doormenu_left_8D42:
    %cm_jsl("GB Brinstar Pre-Map", #doorsubmenu_select, #$002F)

doormenu_left_8D5A:
    %cm_jsl("GB Early Supers", #doorsubmenu_select, #$0030)

doormenu_left_8F46:
    %cm_jsl("GB Etecoons E-Tank (Lower)", #doorsubmenu_select, #$0031)

doormenu_left_8F2E:
    %cm_jsl("GB Etecoons E-Tank (Upper)", #doorsubmenu_select, #$0032)

doormenu_left_8F5E:
    %cm_jsl("GB Etecoons Supers", #doorsubmenu_select, #$0033)

doormenu_left_8E92:
    %cm_jsl("GB Green Hill Zone (Lower)", #doorsubmenu_select, #$0034)

doormenu_left_8E86:
    %cm_jsl("GB Green Hill Zone (Upper)", #doorsubmenu_select, #$0035)

doormenu_left_8CE2:
    %cm_jsl("GB Main Shaft (Middle)", #doorsubmenu_select, #$0036)

doormenu_left_8CEE:
    %cm_jsl("GB Main Shaft (Self)", #doorsubmenu_select, #$0037)

doormenu_left_8CD6:
    %cm_jsl("GB Main Shaft (Upper)", #doorsubmenu_select, #$0038)

doormenu_left_8F0A:
    %cm_jsl("GB Noob Bridge", #doorsubmenu_select, #$0039)

LayoutGreenMaridiaLeftDoorMenu:
    dw #doormenu_left_A690
    dw #doormenu_left_A66C
    dw #doormenu_left_A648
    dw #doormenu_left_A534
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_A690:
    %cm_jsl("GM East Sand Hall", #doorsubmenu_select, #$003A)

doormenu_left_A66C:
    %cm_jsl("GM Oasis", #doorsubmenu_select, #$003B)

doormenu_left_A648:
    %cm_jsl("GM West Sand Hall", #doorsubmenu_select, #$003C)

doormenu_left_A534:
    %cm_jsl("GM West Sand Hall Tunnel", #doorsubmenu_select, #$003D)

LayoutKraidLairLeftDoorMenu:
    dw #doormenu_left_919E
    dw #doormenu_left_917A
    dw #doormenu_left_9186
    dw #doormenu_left_91C2
    dw #doormenu_left_9162
    dw #doormenu_left_923A
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_919E:
    %cm_jsl("KL Baby Kraid", #doorsubmenu_select, #$003E)

doormenu_left_917A:
    %cm_jsl("KL Kihunters (Lower)", #doorsubmenu_select, #$003F)

doormenu_left_9186:
    %cm_jsl("KL Kihunters (Upper)", #doorsubmenu_select, #$0040)

doormenu_left_91C2:
    %cm_jsl("KL Kraid Eye Door (Upper)", #doorsubmenu_select, #$0041)

doormenu_left_9162:
    %cm_jsl("KL Warehouse Energy Tank", #doorsubmenu_select, #$0042)

doormenu_left_923A:
    %cm_jsl("KL Warehouse Entrance", #doorsubmenu_select, #$0043)

LayoutLowerNorfairLeftDoorMenu:
    dw #doormenu_left_9846
    dw #doormenu_left_989A
    dw #doormenu_left_9A9E
    dw #doormenu_left_9882
    dw #doormenu_left_9A0E
    dw #doormenu_left_9A02
    dw #doormenu_left_985E
    dw #doormenu_left_9A3E
    dw #doormenu_left_9936
    dw #doormenu_lower_norfair_left_goto_page2
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

LayoutLowerNorfairLeftDoorMenu2:
    dw #doormenu_left_994E
    dw #doormenu_left_9912
    dw #doormenu_left_98EE
    dw #doormenu_left_9966
    dw #doormenu_left_98BE
    dw #doormenu_left_98D6
    dw #doormenu_left_9A62
    dw #doormenu_left_9A7A
    dw #doormenu_left_9A6E
    dw #doormenu_left_99BA
    dw #doormenu_left_9A56
    dw #doormenu_left_997E
    dw #doormenu_lower_norfair_left_goto_page1
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_lower_norfair_left_goto_page1:
    %cm_adjacent_submenu("GOTO PAGE ONE", #LayoutLowerNorfairLeftDoorMenu)

doormenu_lower_norfair_left_goto_page2:
    %cm_adjacent_submenu("GOTO PAGE TWO", #LayoutLowerNorfairLeftDoorMenu2)

doormenu_left_9846:
    %cm_jsl("LN Acid Statue (Upper)", #doorsubmenu_select, #$0044)

doormenu_left_989A:
    %cm_jsl("LN Fast Rippers", #doorsubmenu_select, #$0045)

doormenu_left_9A9E:
    %cm_jsl("LN Firefleas", #doorsubmenu_select, #$0046)

doormenu_left_9882:
    %cm_jsl("LN Golden Torizo", #doorsubmenu_select, #$0047)

doormenu_left_9A0E:
    %cm_jsl("LN Kihunter Shaft (Lower)", #doorsubmenu_select, #$0048)

doormenu_left_9A02:
    %cm_jsl("LN Kihunter Shaft (Upper)", #doorsubmenu_select, #$0049)

doormenu_left_985E:
    %cm_jsl("LN Main Hall", #doorsubmenu_select, #$004A)

doormenu_left_9A3E:
    %cm_jsl("LN Metal Pirates", #doorsubmenu_select, #$004B)

doormenu_left_9936:
    %cm_jsl("LN Mickey Mouse", #doorsubmenu_select, #$004C)

doormenu_left_994E:
    %cm_jsl("LN Pillars", #doorsubmenu_select, #$004D)

doormenu_left_9912:
    %cm_jsl("LN Pillars Setup (Lower)", #doorsubmenu_select, #$004E)

doormenu_left_98EE:
    %cm_jsl("LN Pillars Setup (Upper)", #doorsubmenu_select, #$004F)

doormenu_left_9966:
    %cm_jsl("LN Plowerhouse", #doorsubmenu_select, #$0050)

doormenu_left_98BE:
    %cm_jsl("LN Ridley", #doorsubmenu_select, #$0051)

doormenu_left_98D6:
    %cm_jsl("LN Ridley Farming", #doorsubmenu_select, #$0052)

doormenu_left_9A62:
    %cm_jsl("LN Ridley Tank", #doorsubmenu_select, #$0053)

doormenu_left_9A7A:
    %cm_jsl("LN Screw Attack (Lower)", #doorsubmenu_select, #$0054)

doormenu_left_9A6E:
    %cm_jsl("LN Screw Attack (Upper)", #doorsubmenu_select, #$0055)

doormenu_left_99BA:
    %cm_jsl("LN Spring Ball Maze", #doorsubmenu_select, #$0056)

doormenu_left_9A56:
    %cm_jsl("LN Three Musketeers", #doorsubmenu_select, #$0057)

doormenu_left_997E:
    %cm_jsl("LN Worst Room", #doorsubmenu_select, #$0058)

LayoutPinkBrinstarLeftDoorMenu:
    dw #doormenu_left_8DEA
    dw #doormenu_left_8E26
    dw #doormenu_left_8E1A
    dw #doormenu_left_8DC6
    dw #doormenu_left_8DAE
    dw #doormenu_left_8F6A
    dw #doormenu_left_8FBE
    dw #doormenu_left_8E62
    dw #doormenu_left_8F76
    dw #doormenu_left_8F8E
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_8DEA:
    %cm_jsl("PB Big Pink (Lower)", #doorsubmenu_select, #$0059)

doormenu_left_8E26:
    %cm_jsl("PB Big Pink (Mid-Lower)", #doorsubmenu_select, #$005A)

doormenu_left_8E1A:
    %cm_jsl("PB Big Pink (Mid-Upper)", #doorsubmenu_select, #$005B)

doormenu_left_8DC6:
    %cm_jsl("PB Big Pink (Upper)", #doorsubmenu_select, #$005C)

doormenu_left_8DAE:
    %cm_jsl("PB Dachora", #doorsubmenu_select, #$005D)

doormenu_left_8F6A:
    %cm_jsl("PB Dachora Recharge", #doorsubmenu_select, #$005E)

doormenu_left_8FBE:
    %cm_jsl("PB Hoppers", #doorsubmenu_select, #$005F)

doormenu_left_8E62:
    %cm_jsl("PB Power Bombs (Upper)", #doorsubmenu_select, #$0060)

doormenu_left_8F76:
    %cm_jsl("PB Spore Spawn Farming", #doorsubmenu_select, #$0061)

doormenu_left_8F8E:
    %cm_jsl("PB Waterway Energy Tank", #doorsubmenu_select, #$0062)

LayoutPinkMaridiaLeftDoorMenu:
    dw #doormenu_left_A738
    dw #doormenu_left_A774
    dw #doormenu_left_A870
    dw #doormenu_left_A7F8
    dw #doormenu_left_A7EC
    dw #doormenu_left_A4C8
    dw #doormenu_left_A96C
    dw #doormenu_left_A960
    dw #doormenu_left_A8F4
    dw #doormenu_left_A8E8
    dw #doormenu_left_A924
    dw #doormenu_left_A948
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_A738:
    %cm_jsl("PM Aqueduct", #doorsubmenu_select, #$0063)

doormenu_left_A774:
    %cm_jsl("PM Botwoon Hallway", #doorsubmenu_select, #$0064)

doormenu_left_A870:
    %cm_jsl("PM Botwoon Tank", #doorsubmenu_select, #$0065)

doormenu_left_A7F8:
    %cm_jsl("PM Colosseum (Lower)", #doorsubmenu_select, #$0066)

doormenu_left_A7EC:
    %cm_jsl("PM Colosseum (Upper)", #doorsubmenu_select, #$0067)

doormenu_left_A4C8:
    %cm_jsl("PM Crab Shaft", #doorsubmenu_select, #$0068)

doormenu_left_A96C:
    %cm_jsl("PM Draygon", #doorsubmenu_select, #$0069)

doormenu_left_A960:
    %cm_jsl("PM East Cactus Alley", #doorsubmenu_select, #$006A)

doormenu_left_A8F4:
    %cm_jsl("PM Halfie Climb (Lower)", #doorsubmenu_select, #$006B)

doormenu_left_A8E8:
    %cm_jsl("PM Halfie Climb (Upper)", #doorsubmenu_select, #$006C)

doormenu_left_A924:
    %cm_jsl("PM Space Jump", #doorsubmenu_select, #$006D)

doormenu_left_A948:
    %cm_jsl("PM West Cactus Alley", #doorsubmenu_select, #$006E)

LayoutRedBrinstarLeftDoorMenu:
    dw #doormenu_left_90EA
    dw #doormenu_left_9102
    dw #doormenu_left_911A
    dw #doormenu_left_9126
    dw #doormenu_left_90DE
    dw #doormenu_left_90D2
    dw #doormenu_left_90C6
    dw #doormenu_left_908A
    dw #doormenu_left_9066
    dw #doormenu_left_9042
    dw #doormenu_left_901E
    dw #doormenu_left_91FE
    dw #doormenu_left_9072
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_90EA:
    %cm_jsl("RB Alpha Power Bombs", #doorsubmenu_select, #$006F)

doormenu_left_9102:
    %cm_jsl("RB Bat", #doorsubmenu_select, #$0070)

doormenu_left_911A:
    %cm_jsl("RB Below Spazer (Lower)", #doorsubmenu_select, #$0071)

doormenu_left_9126:
    %cm_jsl("RB Below Spazer (Upper)", #doorsubmenu_select, #$0072)

doormenu_left_90DE:
    %cm_jsl("RB Beta Power Bombs", #doorsubmenu_select, #$0073)

doormenu_left_90D2:
    %cm_jsl("RB Caterpillars (Lower)", #doorsubmenu_select, #$0074)

doormenu_left_90C6:
    %cm_jsl("RB Caterpillars (Upper)", #doorsubmenu_select, #$0075)

doormenu_left_908A:
    %cm_jsl("RB Hellway", #doorsubmenu_select, #$0076)

doormenu_left_9066:
    %cm_jsl("RB Red Brinstar Firefleas", #doorsubmenu_select, #$0077)

doormenu_left_9042:
    %cm_jsl("RB Red Tower (Lower)", #doorsubmenu_select, #$0078)

doormenu_left_901E:
    %cm_jsl("RB Red Tower (Upper)", #doorsubmenu_select, #$0079)

doormenu_left_91FE:
    %cm_jsl("RB Sloaters Refill", #doorsubmenu_select, #$007A)

doormenu_left_9072:
    %cm_jsl("RB X-Ray Scope", #doorsubmenu_select, #$007B)

LayoutTourianLeftDoorMenu:
    dw #doormenu_left_AA38
    dw #doormenu_left_A9A8
    dw #doormenu_left_A9CC
    dw #doormenu_left_A9C0
    dw #doormenu_left_A9E4
    dw #doormenu_left_AA5C
    dw #doormenu_left_AA50
    dw #doormenu_left_AE0C
    dw #doormenu_left_AE24
    dw #doormenu_left_AE3C
    dw #doormenu_left_A99C
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_AA38:
    %cm_jsl("TR Big Boy", #doorsubmenu_select, #$007C)

doormenu_left_A9A8:
    %cm_jsl("TR Metroids 1", #doorsubmenu_select, #$007D)

doormenu_left_A9CC:
    %cm_jsl("TR Metroids 2 (Lower)", #doorsubmenu_select, #$007E)

doormenu_left_A9C0:
    %cm_jsl("TR Metroids 2 (Upper)", #doorsubmenu_select, #$007F)

doormenu_left_A9E4:
    %cm_jsl("TR Metroids 3", #doorsubmenu_select, #$0080)

doormenu_left_AA5C:
    %cm_jsl("TR Seaweed (Lower)", #doorsubmenu_select, #$0081)

doormenu_left_AA50:
    %cm_jsl("TR Seaweed (Upper)", #doorsubmenu_select, #$0082)

doormenu_left_AE0C:
    %cm_jsl("TR Tourian Escape 2", #doorsubmenu_select, #$0083)

doormenu_left_AE24:
    %cm_jsl("TR Tourian Escape 3", #doorsubmenu_select, #$0084)

doormenu_left_AE3C:
    %cm_jsl("TR Tourian Escape 4", #doorsubmenu_select, #$0085)

doormenu_left_A99C:
    %cm_jsl("TR Mother Brain", #doorsubmenu_select, #$0086)

LayoutUpperNorfairLeftDoorMenu:
    dw #doormenu_left_9756
    dw #doormenu_left_97B6
    dw #doormenu_left_9582
    dw #doormenu_left_958E
    dw #doormenu_left_92E2
    dw #doormenu_left_92FA
    dw #doormenu_left_92CA
    dw #doormenu_left_929A
    dw #doormenu_left_92B2
    dw #doormenu_left_940E
    dw #doormenu_left_93C6
    dw #doormenu_left_93BA
    dw #doormenu_left_9396
    dw #doormenu_left_938A
    dw #doormenu_left_961E
    dw #doormenu_upper_norfair_left_goto_page2
    dw #doormenu_upper_norfair_left_goto_page3
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

LayoutUpperNorfairLeftDoorMenu2:
    dw #doormenu_left_971A
    dw #doormenu_left_97E6
    dw #doormenu_left_953A
    dw #doormenu_left_93F6
    dw #doormenu_left_941A
    dw #doormenu_left_9276
    dw #doormenu_left_932A
    dw #doormenu_left_9366
    dw #doormenu_left_937E
    dw #doormenu_left_9372
    dw #doormenu_left_934E
    dw #doormenu_left_9672
    dw #doormenu_left_96D2
    dw #doormenu_left_96EA
    dw #doormenu_upper_norfair_left_goto_page1
    dw #doormenu_upper_norfair_left_goto_page3
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

LayoutUpperNorfairLeftDoorMenu3:
    dw #doormenu_left_96A2
    dw #doormenu_left_952E
    dw #doormenu_left_9792
    dw #doormenu_left_973E
    dw #doormenu_left_96BA
    dw #doormenu_left_96C6
    dw #doormenu_left_97F2
    dw #doormenu_left_95FA
    dw #doormenu_left_95EE
    dw #doormenu_left_95E2
    dw #doormenu_left_95D6
    dw #doormenu_left_95B2
    dw #doormenu_left_977A
    dw #doormenu_upper_norfair_left_goto_page1
    dw #doormenu_upper_norfair_left_goto_page2
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_upper_norfair_left_goto_page1:
    %cm_adjacent_submenu("GOTO PAGE ONE", #LayoutUpperNorfairLeftDoorMenu)

doormenu_upper_norfair_left_goto_page2:
    %cm_adjacent_submenu("GOTO PAGE TWO", #LayoutUpperNorfairLeftDoorMenu2)

doormenu_upper_norfair_left_goto_page3:
    %cm_adjacent_submenu("GOTO PAGE THREE", #LayoutUpperNorfairLeftDoorMenu3)

doormenu_left_9756:
    %cm_jsl("UN Acid Snakes Tunnel", #doorsubmenu_select, #$0087)

doormenu_left_97B6:
    %cm_jsl("UN Bat Cave", #doorsubmenu_select, #$0088)

doormenu_left_9582:
    %cm_jsl("UN Bubble Mtn (Lower)", #doorsubmenu_select, #$0089)

doormenu_left_958E:
    %cm_jsl("UN Bubble Mtn (Upper)", #doorsubmenu_select, #$008A)

doormenu_left_92E2:
    %cm_jsl("UN Business Center (Lower)", #doorsubmenu_select, #$008B)

doormenu_left_92FA:
    %cm_jsl("UN Business Center (Mid)", #doorsubmenu_select, #$008C)

doormenu_left_92CA:
    %cm_jsl("UN Business Center (Upper)", #doorsubmenu_select, #$008D)

doormenu_left_929A:
    %cm_jsl("UN Cathedral", #doorsubmenu_select, #$008E)

doormenu_left_92B2:
    %cm_jsl("UN Cathedral Entrance", #doorsubmenu_select, #$008F)

doormenu_left_940E:
    %cm_jsl("UN Crocomire Escape", #doorsubmenu_select, #$0090)

doormenu_left_93C6:
    %cm_jsl("UN Croc Speedway (Lower)", #doorsubmenu_select, #$0091)

doormenu_left_93BA:
    %cm_jsl("UN Croc Speedway (Upper)", #doorsubmenu_select, #$0092)

doormenu_left_9396:
    %cm_jsl("UN Crumble Shaft (Lower)", #doorsubmenu_select, #$0093)

doormenu_left_938A:
    %cm_jsl("UN Crumble Shaft (Upper)", #doorsubmenu_select, #$0094)

doormenu_left_961E:
    %cm_jsl("UN Double Chamber", #doorsubmenu_select, #$0095)

doormenu_left_971A:
    %cm_jsl("UN Farming", #doorsubmenu_select, #$0096)

doormenu_left_97E6:
    %cm_jsl("UN Frog Speedway", #doorsubmenu_select, #$0097)

doormenu_left_953A:
    %cm_jsl("UN Green Bubbles Missiles", #doorsubmenu_select, #$0098)

doormenu_left_93F6:
    %cm_jsl("UN Hi Jump Boots", #doorsubmenu_select, #$0099)

doormenu_left_941A:
    %cm_jsl("UN Hi Jump Energy Tank", #doorsubmenu_select, #$009A)

doormenu_left_9276:
    %cm_jsl("UN Ice Beam Acid", #doorsubmenu_select, #$009B)

doormenu_left_932A:
    %cm_jsl("UN Ice Beam Gate", #doorsubmenu_select, #$009C)

doormenu_left_9366:
    %cm_jsl("UN Ice Beam Snake (Lower)", #doorsubmenu_select, #$009D)

doormenu_left_937E:
    %cm_jsl("UN Ice Beam Snake (Middle)", #doorsubmenu_select, #$009E)

doormenu_left_9372:
    %cm_jsl("UN Ice Beam Snake (Upper)", #doorsubmenu_select, #$009F)

doormenu_left_934E:
    %cm_jsl("UN Ice Beam Tutorial", #doorsubmenu_select, #$00A0)

doormenu_left_9672:
    %cm_jsl("UN Kronic Boost", #doorsubmenu_select, #$00A1)

doormenu_left_96D2:
    %cm_jsl("UN Lava Dive", #doorsubmenu_select, #$00A2)

doormenu_left_96EA:
    %cm_jsl("UN Lower Norfair Elevator", #doorsubmenu_select, #$00A3)

doormenu_left_96A2:
    %cm_jsl("UN Magdollite Tunnel", #doorsubmenu_select, #$00A4)

doormenu_left_952E:
    %cm_jsl("UN Norfair Reserve Tank", #doorsubmenu_select, #$00A5)

doormenu_left_9792:
    %cm_jsl("UN Nutella Refill", #doorsubmenu_select, #$00A6)

doormenu_left_973E:
    %cm_jsl("UN Rising Tide", #doorsubmenu_select, #$00A7)

doormenu_left_96BA:
    %cm_jsl("UN Purple Shaft (Lower)", #doorsubmenu_select, #$00A8)

doormenu_left_96C6:
    %cm_jsl("UN Purple Shaft (Upper)", #doorsubmenu_select, #$00A9)

doormenu_left_97F2:
    %cm_jsl("UN Red Pirates Shaft", #doorsubmenu_select, #$00AA)

doormenu_left_95FA:
    %cm_jsl("UN Single Chamber (Hidden)", #doorsubmenu_select, #$00AB)

doormenu_left_95EE:
    %cm_jsl("UN Single Chamber (Lower)", #doorsubmenu_select, #$00AC)

doormenu_left_95E2:
    %cm_jsl("UN Single Chamber (Middle)", #doorsubmenu_select, #$00AD)

doormenu_left_95D6:
    %cm_jsl("UN Single Chamber (Upper)", #doorsubmenu_select, #$00AE)

doormenu_left_95B2:
    %cm_jsl("UN Speed Booster Hall", #doorsubmenu_select, #$00AF)

doormenu_left_977A:
    %cm_jsl("UN Spiky Acid Snake Tunnel", #doorsubmenu_select, #$00B0)

LayoutWestMaridiaLeftDoorMenu:
    dw #doormenu_left_A51C
    dw #doormenu_left_A504
    dw #doormenu_left_A420
    dw #doormenu_left_A384
    dw #doormenu_left_A390
    dw #doormenu_left_A3E4
    dw #doormenu_left_A354
    dw #doormenu_left_A3A8
    dw #doormenu_left_A3B4
    dw #doormenu_left_A3C0
    dw #doormenu_left_A468
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_A51C:
    %cm_jsl("WM Crab Hole (Lower)", #doorsubmenu_select, #$00B1)

doormenu_left_A504:
    %cm_jsl("WM Crab Hole (Upper)", #doorsubmenu_select, #$00B2)

doormenu_left_A420:
    %cm_jsl("WM Crab Tunnel", #doorsubmenu_select, #$00B3)

doormenu_left_A384:
    %cm_jsl("WM East Tunnel (Lower)", #doorsubmenu_select, #$00B4)

doormenu_left_A390:
    %cm_jsl("WM East Tunnel (Upper)", #doorsubmenu_select, #$00B5)

doormenu_left_A3E4:
    %cm_jsl("WM Fish Tank", #doorsubmenu_select, #$00B6)

doormenu_left_A354:
    %cm_jsl("WM Glass Tunnel (Lower)", #doorsubmenu_select, #$00B7)

doormenu_left_A3A8:
    %cm_jsl("WM Main Street (Lower)", #doorsubmenu_select, #$00B8)

doormenu_left_A3B4:
    %cm_jsl("WM Main Street (Middle)", #doorsubmenu_select, #$00B9)

doormenu_left_A3C0:
    %cm_jsl("WM Main Street (Upper)", #doorsubmenu_select, #$00BA)

doormenu_left_A468:
    %cm_jsl("WM Mount Everest", #doorsubmenu_select, #$00BB)

LayoutWreckedShipLeftDoorMenu:
    dw #doormenu_left_A1D4
    dw #doormenu_left_A2AC
    dw #doormenu_left_A264
    dw #doormenu_left_A288
    dw #doormenu_left_A30C
    dw #doormenu_left_A234
    dw #doormenu_left_A204
    dw #doormenu_left_A240
    dw #doormenu_left_A258
    dw #doormenu_left_A2DC
    dw #doormenu_left_A2E8
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_A1D4:
    %cm_jsl("WS Attic", #doorsubmenu_select, #$00BC)

doormenu_left_A2AC:
    %cm_jsl("WS Basement", #doorsubmenu_select, #$00BD)

doormenu_left_A264:
    %cm_jsl("WS Electric Death", #doorsubmenu_select, #$00BE)

doormenu_left_A288:
    %cm_jsl("WS Energy Tank", #doorsubmenu_select, #$00BF)

doormenu_left_A30C:
    %cm_jsl("WS Gravity Suit", #doorsubmenu_select, #$00C0)

doormenu_left_A234:
    %cm_jsl("WS Main Shaft (Lower)", #doorsubmenu_select, #$00C1)

doormenu_left_A204:
    %cm_jsl("WS Main Shaft (Middle)", #doorsubmenu_select, #$00C2)

doormenu_left_A240:
    %cm_jsl("WS Main Shaft (Upper)", #doorsubmenu_select, #$00C3)

doormenu_left_A258:
    %cm_jsl("WS Spiky Death", #doorsubmenu_select, #$00C4)

doormenu_left_A2DC:
    %cm_jsl("WS Sponge Bath", #doorsubmenu_select, #$00C5)

doormenu_left_A2E8:
    %cm_jsl("WS West Supers", #doorsubmenu_select, #$00C6)

LayoutYellowMaridiaLeftDoorMenu:
    dw #doormenu_left_A75C
    dw #doormenu_left_A5DC
    dw #doormenu_left_A588
    dw #doormenu_left_A4A4
    dw #doormenu_left_A5A0
    dw #doormenu_left_A5C4
    dw #doormenu_left_A5B8
    dw #doormenu_left_A54C
    dw #doormenu_left_A570
    dw #doormenu_left_A48C
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_A75C:
    %cm_jsl("YM Butterfly", #doorsubmenu_select, #$00C7)

doormenu_left_A5DC:
    %cm_jsl("YM Kassiuz", #doorsubmenu_select, #$00C8)

doormenu_left_A588:
    %cm_jsl("YM Maridia Elevator", #doorsubmenu_select, #$00C9)

doormenu_left_A4A4:
    %cm_jsl("YM Northwest Maridia Bugs", #doorsubmenu_select, #$00CA)

doormenu_left_A5A0:
    %cm_jsl("YM Plasma Spark (Lower)", #doorsubmenu_select, #$00CB)

doormenu_left_A5C4:
    %cm_jsl("YM Plasma Spark (Middle)", #doorsubmenu_select, #$00CC)

doormenu_left_A5B8:
    %cm_jsl("YM Plasma Spark (Upper)", #doorsubmenu_select, #$00CD)

doormenu_left_A54C:
    %cm_jsl("YM Plasma Tutorial", #doorsubmenu_select, #$00CE)

doormenu_left_A570:
    %cm_jsl("YM Thread The Needle", #doorsubmenu_select, #$00CF)

doormenu_left_A48C:
    %cm_jsl("YM Watering Hole", #doorsubmenu_select, #$00D0)

LayoutExitOnlyLeftDoorMenu:
    dw #doormenu_left_893A
    dw #doormenu_left_8E4A
    dw #doormenu_left_A798
    dw #doormenu_left_A7BC
    dw #doormenu_left_A8D0
    dw #doormenu_left_91DA
    dw #doormenu_left_91B6
    dw #doormenu_left_983A
    dw #doormenu_left_99A2
    dw #doormenu_left_8E6E
    dw #doormenu_left_A918
    dw #$0000
    %cm_header("SELECT LEFT DOOR")

doormenu_left_893A:
    %cm_jsl("CR Landing Site (Upper)", #doorsubmenu_select, #$00D1)

doormenu_left_8E4A:
    %cm_jsl("GB Spore Spawn", #doorsubmenu_select, #$00D2)

doormenu_left_A798:
    %cm_jsl("GM Pants", #doorsubmenu_select, #$00D3)

doormenu_left_A7BC:
    %cm_jsl("GM Pants (East)", #doorsubmenu_select, #$00D4)

doormenu_left_A8D0:
    %cm_jsl("GM Shaktool", #doorsubmenu_select, #$00D5)

doormenu_left_91DA:
    %cm_jsl("KL Kraid", #doorsubmenu_select, #$00D6)

doormenu_left_91B6:
    %cm_jsl("KL Kraid Eye Door (Lower)", #doorsubmenu_select, #$00D7)

doormenu_left_983A:
    %cm_jsl("LN Acid Statue (Lower)", #doorsubmenu_select, #$00D8)

doormenu_left_99A2:
    %cm_jsl("LN Amphitheatre", #doorsubmenu_select, #$00D9)

doormenu_left_8E6E:
    %cm_jsl("PB Power Bombs (Lower)", #doorsubmenu_select, #$00DA)

doormenu_left_A918:
    %cm_jsl("PM Botwoon", #doorsubmenu_select, #$00DB)

layout_leftright_leftdoor:
    dw !ACTION_CHOICE_JSL_TEXT
    dl #!ram_door_portal_left
    dw #$0000
    dw #doormenu_left_8FA6      ; Blue Brinstar
    dw #doormenu_left_8FFA
    dw #doormenu_left_8FE2
    dw #doormenu_left_8ECE
    dw #doormenu_left_8EAA
    dw #doormenu_left_9516      ; Croc's Lair
    dw #doormenu_left_9522
    dw #doormenu_left_94F2
    dw #doormenu_left_94C2
    dw #doormenu_left_9456
    dw #doormenu_left_9432
    dw #doormenu_left_946E
    dw #doormenu_left_9492
    dw #doormenu_left_8C8E      ; Crateria
    dw #doormenu_left_8C9A
    dw #doormenu_left_8A1E
    dw #doormenu_left_ADE8
    dw #doormenu_left_ADDC
    dw #doormenu_left_ADD0
    dw #doormenu_left_8A36
    dw #doormenu_left_8AD2
    dw #doormenu_left_8A72
    dw #doormenu_left_8BC2
    dw #doormenu_left_8AA2
    dw #doormenu_left_8B0E
    dw #doormenu_left_8946
    dw #doormenu_left_8BFE
    dw #doormenu_left_8C52
    dw #doormenu_left_8C3A
    dw #doormenu_left_8C5E
    dw #doormenu_left_8922
    dw #doormenu_left_8C16
    dw #doormenu_left_8AEA
    dw #doormenu_left_AD94
    dw #doormenu_left_AD88
    dw #doormenu_left_AD7C
    dw #doormenu_left_8B86
    dw #doormenu_left_8BDA
    dw #doormenu_left_8BF2
    dw #doormenu_left_89E2
    dw #doormenu_left_89D6
    dw #doormenu_left_8A06
    dw #doormenu_left_89FA
    dw #doormenu_left_89EE
    dw #doormenu_left_8F16      ; Green Brinstar
    dw #doormenu_left_8D8A
    dw #doormenu_left_8D96
    dw #doormenu_left_8D42
    dw #doormenu_left_8D5A
    dw #doormenu_left_8F46
    dw #doormenu_left_8F2E
    dw #doormenu_left_8F5E
    dw #doormenu_left_8E92
    dw #doormenu_left_8E86
    dw #doormenu_left_8CE2
    dw #doormenu_left_8CEE
    dw #doormenu_left_8CD6
    dw #doormenu_left_8F0A
    dw #doormenu_left_A690      ; Green Maridia
    dw #doormenu_left_A66C
    dw #doormenu_left_A648
    dw #doormenu_left_A534
    dw #doormenu_left_919E      ; Kraid's Lair
    dw #doormenu_left_917A
    dw #doormenu_left_9186
    dw #doormenu_left_91C2
    dw #doormenu_left_9162
    dw #doormenu_left_923A
    dw #doormenu_left_9846      ; Lower Norfair
    dw #doormenu_left_989A
    dw #doormenu_left_9A9E
    dw #doormenu_left_9882
    dw #doormenu_left_9A0E
    dw #doormenu_left_9A02
    dw #doormenu_left_985E
    dw #doormenu_left_9A3E
    dw #doormenu_left_9936
    dw #doormenu_left_994E
    dw #doormenu_left_9912
    dw #doormenu_left_98EE
    dw #doormenu_left_9966
    dw #doormenu_left_98BE
    dw #doormenu_left_98D6
    dw #doormenu_left_9A62
    dw #doormenu_left_9A7A
    dw #doormenu_left_9A6E
    dw #doormenu_left_99BA
    dw #doormenu_left_9A56
    dw #doormenu_left_997E
    dw #doormenu_left_8DEA      ; Pink Brinstar
    dw #doormenu_left_8E26
    dw #doormenu_left_8E1A
    dw #doormenu_left_8DC6
    dw #doormenu_left_8DAE
    dw #doormenu_left_8F6A
    dw #doormenu_left_8FBE
    dw #doormenu_left_8E62
    dw #doormenu_left_8F76
    dw #doormenu_left_8F8E
    dw #doormenu_left_A738      ; Pink Maridia
    dw #doormenu_left_A774
    dw #doormenu_left_A870
    dw #doormenu_left_A7F8
    dw #doormenu_left_A7EC
    dw #doormenu_left_A4C8
    dw #doormenu_left_A96C
    dw #doormenu_left_A960
    dw #doormenu_left_A8F4
    dw #doormenu_left_A8E8
    dw #doormenu_left_A924
    dw #doormenu_left_A948
    dw #doormenu_left_90EA      ; Red Brinstar
    dw #doormenu_left_9102
    dw #doormenu_left_911A
    dw #doormenu_left_9126
    dw #doormenu_left_90DE
    dw #doormenu_left_90D2
    dw #doormenu_left_90C6
    dw #doormenu_left_908A
    dw #doormenu_left_9066
    dw #doormenu_left_9042
    dw #doormenu_left_901E
    dw #doormenu_left_91FE
    dw #doormenu_left_9072
    dw #doormenu_left_AA38      ; Tourian
    dw #doormenu_left_A9A8
    dw #doormenu_left_A9CC
    dw #doormenu_left_A9C0
    dw #doormenu_left_A9E4
    dw #doormenu_left_AA5C
    dw #doormenu_left_AA50
    dw #doormenu_left_AE0C
    dw #doormenu_left_AE24
    dw #doormenu_left_AE3C
    dw #doormenu_left_A99C
    dw #doormenu_left_9756      ; Upper Norfair
    dw #doormenu_left_97B6
    dw #doormenu_left_9582
    dw #doormenu_left_958E
    dw #doormenu_left_92E2
    dw #doormenu_left_92FA
    dw #doormenu_left_92CA
    dw #doormenu_left_929A
    dw #doormenu_left_92B2
    dw #doormenu_left_940E
    dw #doormenu_left_93C6
    dw #doormenu_left_93BA
    dw #doormenu_left_9396
    dw #doormenu_left_938A
    dw #doormenu_left_961E
    dw #doormenu_left_971A
    dw #doormenu_left_97E6
    dw #doormenu_left_953A
    dw #doormenu_left_93F6
    dw #doormenu_left_941A
    dw #doormenu_left_9276
    dw #doormenu_left_932A
    dw #doormenu_left_9366
    dw #doormenu_left_937E
    dw #doormenu_left_9372
    dw #doormenu_left_934E
    dw #doormenu_left_9672
    dw #doormenu_left_96D2
    dw #doormenu_left_96EA
    dw #doormenu_left_96A2
    dw #doormenu_left_952E
    dw #doormenu_left_9792
    dw #doormenu_left_973E
    dw #doormenu_left_96BA
    dw #doormenu_left_96C6
    dw #doormenu_left_97F2
    dw #doormenu_left_95FA
    dw #doormenu_left_95EE
    dw #doormenu_left_95E2
    dw #doormenu_left_95D6
    dw #doormenu_left_95B2
    dw #doormenu_left_977A
    dw #doormenu_left_A51C      ; West Maridia
    dw #doormenu_left_A504
    dw #doormenu_left_A420
    dw #doormenu_left_A384
    dw #doormenu_left_A390
    dw #doormenu_left_A3E4
    dw #doormenu_left_A354
    dw #doormenu_left_A3A8
    dw #doormenu_left_A3B4
    dw #doormenu_left_A3C0
    dw #doormenu_left_A468
    dw #doormenu_left_A1D4      ; Wrecked Ship
    dw #doormenu_left_A2AC
    dw #doormenu_left_A264
    dw #doormenu_left_A288
    dw #doormenu_left_A30C
    dw #doormenu_left_A234
    dw #doormenu_left_A204
    dw #doormenu_left_A240
    dw #doormenu_left_A258
    dw #doormenu_left_A2DC
    dw #doormenu_left_A2E8
    dw #doormenu_left_A75C      ; Yellow Maridia
    dw #doormenu_left_A5DC
    dw #doormenu_left_A588
    dw #doormenu_left_A4A4
    dw #doormenu_left_A5A0
    dw #doormenu_left_A5C4
    dw #doormenu_left_A5B8
    dw #doormenu_left_A54C
    dw #doormenu_left_A570
    dw #doormenu_left_A48C
    dw #doormenu_left_893A      ; Exit Only
    dw #doormenu_left_8E4A
    dw #doormenu_left_A798
    dw #doormenu_left_A7BC
    dw #doormenu_left_A8D0
    dw #doormenu_left_91DA
    dw #doormenu_left_91B6
    dw #doormenu_left_983A
    dw #doormenu_left_99A2
    dw #doormenu_left_8E6E
    dw #doormenu_left_A918
    dw #$0000


; -----------------
; Right Doors
; -----------------
LayoutBlueBrinstarRightDoorMenu:
    dw #doormenu_right_8FEE
    dw #doormenu_right_8EDA
    dw #doormenu_right_8EC2
    dw #doormenu_right_8EE6
    dw #doormenu_right_8EF2
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_8FEE:
    %cm_jsl("BB Boulder", #doorsubmenu_select, #$0000)

doormenu_right_8EDA:
    %cm_jsl("BB Construction (Lower)", #doorsubmenu_select, #$0001)

doormenu_right_8EC2:
    %cm_jsl("BB Construction (Upper)", #doorsubmenu_select, #$0002)

doormenu_right_8EE6:
    %cm_jsl("BB Energy Tank (Lower)", #doorsubmenu_select, #$0003)

doormenu_right_8EF2:
    %cm_jsl("BB Energy Tank (Upper)", #doorsubmenu_select, #$0004)

LayoutCrocLairRightDoorMenu:
    dw #doormenu_right_94AA
    dw #doormenu_right_94E6
    dw #doormenu_right_94B6
    dw #doormenu_right_943E
    dw #doormenu_right_94DA
    dw #doormenu_right_9486
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_94AA:
    %cm_jsl("CL Cosine Missiles", #doorsubmenu_select, #$0005)

doormenu_right_94E6:
    %cm_jsl("CL Grapple Tutorial 2", #doorsubmenu_select, #$0006)

doormenu_right_94B6:
    %cm_jsl("CL Grapple Tutorial 3", #doorsubmenu_select, #$0007)

doormenu_right_943E:
    %cm_jsl("CL Post Croc Farm", #doorsubmenu_select, #$0008)

doormenu_right_94DA:
    %cm_jsl("CL Post Croc Jump", #doorsubmenu_select, #$0009)

doormenu_right_9486:
    %cm_jsl("CL Post Croc Shaft", #doorsubmenu_select, #$000A)

LayoutCrateriaRightDoorMenu:
    dw #doormenu_right_8C82
    dw #doormenu_right_8BAA
    dw #doormenu_right_8A12
    dw #doormenu_right_ADF4
    dw #doormenu_right_8C76
    dw #doormenu_right_8C6A
    dw #doormenu_right_8AAE
    dw #doormenu_right_8A2A
    dw #doormenu_right_89B2
    dw #doormenu_right_8AC6
    dw #doormenu_right_8A66
    dw #doormenu_right_8BB6
    dw #doormenu_right_8A7E
    dw #doormenu_right_8B1A
    dw #doormenu_right_8952
    dw #doormenu_right_8C46
    dw #doormenu_crateria_right_goto_page2
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

LayoutCrateriaRightDoorMenu2:
    dw #doormenu_right_8916
    dw #doormenu_right_8C22
    dw #doormenu_right_8ADE
    dw #doormenu_right_8B92
    dw #doormenu_right_ADB8
    dw #doormenu_right_ADAC
    dw #doormenu_right_AD70
    dw #doormenu_right_8B7A
    dw #doormenu_right_8BCE
    dw #doormenu_right_8BE6
    dw #doormenu_right_89CA
    dw #doormenu_crateria_right_goto_page1
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_crateria_right_goto_page1:
    %cm_adjacent_submenu("GOTO PAGE ONE", #LayoutCrateriaRightDoorMenu)

doormenu_crateria_right_goto_page2:
    %cm_adjacent_submenu("GOTO PAGE TWO", #LayoutCrateriaRightDoorMenu2)

doormenu_right_8C82:
    %cm_jsl("CR 230 Bombway", #doorsubmenu_select, #$000B)

doormenu_right_8BAA:
    %cm_jsl("CR Bomb Torizo", #doorsubmenu_select, #$000C)

doormenu_right_8A12:
    %cm_jsl("CR Bowling Alley Path", #doorsubmenu_select, #$000D)

doormenu_right_ADF4:
    %cm_jsl("CR Climb", #doorsubmenu_select, #$000E)

doormenu_right_8C76:
    %cm_jsl("CR Climb Supers (Lower)", #doorsubmenu_select, #$000F)

doormenu_right_8C6A:
    %cm_jsl("CR Climb Supers (Upper)", #doorsubmenu_select, #$0010)

doormenu_right_8AAE:
    %cm_jsl("CR Crab Maze", #doorsubmenu_select, #$0011)

doormenu_right_8A2A:
    %cm_jsl("CR Crateria Kihunters", #doorsubmenu_select, #$0012)

doormenu_right_89B2:
    %cm_jsl("CR Crateria Power Bombs", #doorsubmenu_select, #$0013)

doormenu_right_8AC6:
    %cm_jsl("CR Crateria Tube", #doorsubmenu_select, #$0014)

doormenu_right_8A66:
    %cm_jsl("CR East Ocean", #doorsubmenu_select, #$0015)

doormenu_right_8BB6:
    %cm_jsl("CR Flyway", #doorsubmenu_select, #$0016)

doormenu_right_8A7E:
    %cm_jsl("CR Forgotten Highway Kago", #doorsubmenu_select, #$0017)

doormenu_right_8B1A:
    %cm_jsl("CR Gauntlet Energy Tank", #doorsubmenu_select, #$0018)

doormenu_right_8952:
    %cm_jsl("CR Gauntlet Entrance", #doorsubmenu_select, #$0019)

doormenu_right_8C46:
    %cm_jsl("CR Green Pirates Shaft", #doorsubmenu_select, #$001A)

doormenu_right_8916:
    %cm_jsl("CR Landing Site (Lower)", #doorsubmenu_select, #$001B)

doormenu_right_8C22:
    %cm_jsl("CR Lower Mushrooms", #doorsubmenu_select, #$001C)

doormenu_right_8ADE:
    %cm_jsl("CR Moat", #doorsubmenu_select, #$001D)

doormenu_right_8B92:
    %cm_jsl("CR Morph Elevator", #doorsubmenu_select, #$001E)

doormenu_right_ADB8:
    %cm_jsl("CR Parlor (Lower)", #doorsubmenu_select, #$001F)

doormenu_right_ADAC:
    %cm_jsl("CR Parlor (Middle)", #doorsubmenu_select, #$0020)

doormenu_right_AD70:
    %cm_jsl("CR Parlor (Upper)", #doorsubmenu_select, #$0021)

doormenu_right_8B7A:
    %cm_jsl("CR Pit", #doorsubmenu_select, #$0022)

doormenu_right_8BCE:
    %cm_jsl("CR Pre-Map Flyway", #doorsubmenu_select, #$0023)

doormenu_right_8BE6:
    %cm_jsl("CR Terminator", #doorsubmenu_select, #$0024)

doormenu_right_89CA:
    %cm_jsl("CR West Ocean (Lower)", #doorsubmenu_select, #$0025)

LayoutGreenBrinstarRightDoorMenu:
    dw #doormenu_right_8F22
    dw #doormenu_right_8D7E
    dw #doormenu_right_8D36
    dw #doormenu_right_8D66
    dw #doormenu_right_8D4E
    dw #doormenu_right_8F52
    dw #doormenu_right_8F3A
    dw #doormenu_right_8E7A
    dw #doormenu_right_8CFA
    dw #doormenu_right_8CBE
    dw #doormenu_right_8CCA
    dw #doormenu_right_8D12
    dw #doormenu_right_8D06
    dw #doormenu_right_8CB2
    dw #doormenu_right_8EFE
    dw #doormenu_right_8E32
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_8F22:
    %cm_jsl("GB Brinstar Beetoms", #doorsubmenu_select, #$0026)

doormenu_right_8D7E:
    %cm_jsl("GB Brinstar Firefleas", #doorsubmenu_select, #$0027)

doormenu_right_8D36:
    %cm_jsl("GB Brinstar Pre-Map", #doorsubmenu_select, #$0028)

doormenu_right_8D66:
    %cm_jsl("GB Brinstar Reserve Tank", #doorsubmenu_select, #$0029)

doormenu_right_8D4E:
    %cm_jsl("GB Early Supers", #doorsubmenu_select, #$002A)

doormenu_right_8F52:
    %cm_jsl("GB Etecoons E-Tank (Lower)", #doorsubmenu_select, #$002B)

doormenu_right_8F3A:
    %cm_jsl("GB Etecoons E-Tank (Upper)", #doorsubmenu_select, #$002C)

doormenu_right_8E7A:
    %cm_jsl("GB Green Hill Zone", #doorsubmenu_select, #$002D)

doormenu_right_8CFA:
    %cm_jsl("GB Main Shaft (Etecoons)", #doorsubmenu_select, #$002E)

doormenu_right_8CBE:
    %cm_jsl("GB Main Shaft (Mid-Lower)", #doorsubmenu_select, #$002F)

doormenu_right_8CCA:
    %cm_jsl("GB Main Shaft (Middle)", #doorsubmenu_select, #$0030)

doormenu_right_8D12:
    %cm_jsl("GB Main Shaft (Mid-Upper)", #doorsubmenu_select, #$0031)

doormenu_right_8D06:
    %cm_jsl("GB Main Shaft (Self)", #doorsubmenu_select, #$0032)

doormenu_right_8CB2:
    %cm_jsl("GB Main Shaft (Upper)", #doorsubmenu_select, #$0033)

doormenu_right_8EFE:
    %cm_jsl("GB Noob Bridge", #doorsubmenu_select, #$0034)

doormenu_right_8E32:
    %cm_jsl("GB Spore Spawn Kihunters", #doorsubmenu_select, #$0035)

LayoutGreenMaridiaRightDoorMenu:
    dw #doormenu_right_A684
    dw #doormenu_right_A660
    dw #doormenu_right_A780
    dw #doormenu_right_A8C4
    dw #doormenu_right_A7C8
    dw #doormenu_right_A63C
    dw #doormenu_right_A528
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_A684:
    %cm_jsl("GM East Sand Hall", #doorsubmenu_select, #$0036)

doormenu_right_A660:
    %cm_jsl("GM Oasis", #doorsubmenu_select, #$0037)

doormenu_right_A780:
    %cm_jsl("GM Pants", #doorsubmenu_select, #$0038)

doormenu_right_A8C4:
    %cm_jsl("GM Shaktool", #doorsubmenu_select, #$0039)

doormenu_right_A7C8:
    %cm_jsl("GM Spring Ball", #doorsubmenu_select, #$003A)

doormenu_right_A63C:
    %cm_jsl("GM West Sand Hall", #doorsubmenu_select, #$003B)

doormenu_right_A528:
    %cm_jsl("GM West Sand Hall Tunnel", #doorsubmenu_select, #$003C)

LayoutKraidLairRightDoorMenu:
    dw #doormenu_right_9192
    dw #doormenu_right_91CE
    dw #doormenu_right_91AA
    dw #doormenu_right_920A
    dw #doormenu_right_9252
    dw #doormenu_right_922E
    dw #doormenu_right_914A
    dw #doormenu_right_913E
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_9192:
    %cm_jsl("KL Baby Kraid", #doorsubmenu_select, #$003D)

doormenu_right_91CE:
    %cm_jsl("KL Kraid", #doorsubmenu_select, #$003E)

doormenu_right_91AA:
    %cm_jsl("KL Kraid Eye Door", #doorsubmenu_select, #$003F)

doormenu_right_920A:
    %cm_jsl("KL Kraid Refill", #doorsubmenu_select, #$0040)

doormenu_right_9252:
    %cm_jsl("KL Varia Suit", #doorsubmenu_select, #$0041)

doormenu_right_922E:
    %cm_jsl("KL Warehouse Entrance", #doorsubmenu_select, #$0042)

doormenu_right_914A:
    %cm_jsl("KL Warehouse Zeela (Lower)", #doorsubmenu_select, #$0043)

doormenu_right_913E:
    %cm_jsl("KL Warehouse Zeela (Upper)", #doorsubmenu_select, #$0044)

LayoutLowerNorfairRightDoorMenu:
    dw #doormenu_right_9996
    dw #doormenu_right_988E
    dw #doormenu_right_9AAA
    dw #doormenu_right_9A92
    dw #doormenu_right_9876
    dw #doormenu_right_98A6
    dw #doormenu_right_99D2
    dw #doormenu_right_99F6
    dw #doormenu_right_9852
    dw #doormenu_right_9A32
    dw #doormenu_right_992A
    dw #doormenu_lower_norfair_right_goto_page2
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

LayoutLowerNorfairRightDoorMenu2:
    dw #doormenu_right_9942
    dw #doormenu_right_9906
    dw #doormenu_right_98E2
    dw #doormenu_right_995A
    dw #doormenu_right_98B2
    dw #doormenu_right_98CA
    dw #doormenu_right_9A86
    dw #doormenu_right_99AE
    dw #doormenu_right_9A4A
    dw #doormenu_right_9A1A
    dw #doormenu_right_998A
    dw #doormenu_right_9972
    dw #doormenu_lower_norfair_right_goto_page1
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_lower_norfair_right_goto_page1:
    %cm_adjacent_submenu("GOTO PAGE ONE", #LayoutLowerNorfairRightDoorMenu)

doormenu_lower_norfair_right_goto_page2:
    %cm_adjacent_submenu("GOTO PAGE TWO", #LayoutLowerNorfairRightDoorMenu2)

doormenu_right_9996:
    %cm_jsl("LN Amphitheatre", #doorsubmenu_select, #$0045)

doormenu_right_988E:
    %cm_jsl("LN Fast Rippers", #doorsubmenu_select, #$0046)

doormenu_right_9AAA:
    %cm_jsl("LN Firefleas (Lower)", #doorsubmenu_select, #$0047)

doormenu_right_9A92:
    %cm_jsl("LN Firefleas (Upper)", #doorsubmenu_select, #$0048)

doormenu_right_9876:
    %cm_jsl("LN Golden Torizo", #doorsubmenu_select, #$0049)

doormenu_right_98A6:
    %cm_jsl("LN Golden Torizo Recharge", #doorsubmenu_select, #$004A)

doormenu_right_99D2:
    %cm_jsl("LN Jail Power Bombs", #doorsubmenu_select, #$004B)

doormenu_right_99F6:
    %cm_jsl("LN Kihunter Shaft", #doorsubmenu_select, #$004C)

doormenu_right_9852:
    %cm_jsl("LN Main Hall", #doorsubmenu_select, #$004D)

doormenu_right_9A32:
    %cm_jsl("LN Metal Pirates", #doorsubmenu_select, #$004E)

doormenu_right_992A:
    %cm_jsl("LN Mickey Mouse", #doorsubmenu_select, #$004F)

doormenu_right_9942:
    %cm_jsl("LN Pillars", #doorsubmenu_select, #$0050)

doormenu_right_9906:
    %cm_jsl("LN Pillars Setup (Lower)", #doorsubmenu_select, #$0051)

doormenu_right_98E2:
    %cm_jsl("LN Pillars Setup (Upper)", #doorsubmenu_select, #$0052)

doormenu_right_995A:
    %cm_jsl("LN Plowerhouse", #doorsubmenu_select, #$0053)

doormenu_right_98B2:
    %cm_jsl("LN Ridley", #doorsubmenu_select, #$0054)

doormenu_right_98CA:
    %cm_jsl("LN Ridley Farming", #doorsubmenu_select, #$0055)

doormenu_right_9A86:
    %cm_jsl("LN Screw Attack", #doorsubmenu_select, #$0056)

doormenu_right_99AE:
    %cm_jsl("LN Spring Ball Maze", #doorsubmenu_select, #$0057)

doormenu_right_9A4A:
    %cm_jsl("LN Three Musketeers", #doorsubmenu_select, #$0058)

doormenu_right_9A1A:
    %cm_jsl("LN Wasteland", #doorsubmenu_select, #$0059)

doormenu_right_998A:
    %cm_jsl("LN Worst Room (Lower)", #doorsubmenu_select, #$005A)

doormenu_right_9972:
    %cm_jsl("LN Worst Room (Upper)", #doorsubmenu_select, #$005B)

LayoutPinkBrinstarRightDoorMenu:
    dw #doormenu_right_8E0E
    dw #doormenu_right_8DDE
    dw #doormenu_right_8DD2
    dw #doormenu_right_8DF6
    dw #doormenu_right_8DBA
    dw #doormenu_right_8DA2
    dw #doormenu_right_8FB2
    dw #doormenu_right_8FCA
    dw #doormenu_right_8F82
    dw #doormenu_right_8D1E
    dw #doormenu_right_8D2A
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_8E0E:
    %cm_jsl("PB Big Pink (Lower)", #doorsubmenu_select, #$005C)

doormenu_right_8DDE:
    %cm_jsl("PB Big Pink (Mid-Lower)", #doorsubmenu_select, #$005D)

doormenu_right_8DD2:
    %cm_jsl("PB Big Pink (Mid-Upper)", #doorsubmenu_select, #$005E)

doormenu_right_8DF6:
    %cm_jsl("PB Big Pink (Upper)", #doorsubmenu_select, #$005F)

doormenu_right_8DBA:
    %cm_jsl("PB Dachora (Lower)", #doorsubmenu_select, #$0060)

doormenu_right_8DA2:
    %cm_jsl("PB Dachora (Upper)", #doorsubmenu_select, #$0061)

doormenu_right_8FB2:
    %cm_jsl("PB Hoppers", #doorsubmenu_select, #$0062)

doormenu_right_8FCA:
    %cm_jsl("PB Hoppers Energy Tank", #doorsubmenu_select, #$0063)

doormenu_right_8F82:
    %cm_jsl("PB Spore Spawn Farming", #doorsubmenu_select, #$0064)

doormenu_right_8D1E:
    %cm_jsl("PB Spo-Spo Supers (Lower)", #doorsubmenu_select, #$0065)

doormenu_right_8D2A:
    %cm_jsl("PB Spo-Spo Supers (Upper)", #doorsubmenu_select, #$0066)

LayoutPinkMaridiaRightDoorMenu:
    dw #doormenu_right_A744
    dw #doormenu_right_A708
    dw #doormenu_right_A7D4
    dw #doormenu_right_A90C
    dw #doormenu_right_A84C
    dw #doormenu_right_A7E0
    dw #doormenu_right_A4B0
    dw #doormenu_right_A978
    dw #doormenu_right_A954
    dw #doormenu_right_A8DC
    dw #doormenu_right_A900
    dw #doormenu_right_A894
    dw #doormenu_right_A840
    dw #doormenu_right_A834
    dw #doormenu_right_A93C
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_A744:
    %cm_jsl("PM Aqueduct (Lower)", #doorsubmenu_select, #$0067)

doormenu_right_A708:
    %cm_jsl("PM Aqueduct (Upper)", #doorsubmenu_select, #$0068)

doormenu_right_A7D4:
    %cm_jsl("PM Below Botwoon", #doorsubmenu_select, #$0069)

doormenu_right_A90C:
    %cm_jsl("PM Botwoon", #doorsubmenu_select, #$006A)

doormenu_right_A84C:
    %cm_jsl("PM Botwoon Tank", #doorsubmenu_select, #$006B)

doormenu_right_A7E0:
    %cm_jsl("PM Colosseum", #doorsubmenu_select, #$006C)

doormenu_right_A4B0:
    %cm_jsl("PM Crab Shaft", #doorsubmenu_select, #$006D)

doormenu_right_A978:
    %cm_jsl("PM Draygon", #doorsubmenu_select, #$006E)

doormenu_right_A954:
    %cm_jsl("PM East Cactus Alley", #doorsubmenu_select, #$006F)

doormenu_right_A8DC:
    %cm_jsl("PM Halfie Climb (Lower)", #doorsubmenu_select, #$0070)

doormenu_right_A900:
    %cm_jsl("PM Halfie Climb (Upper)", #doorsubmenu_select, #$0071)

doormenu_right_A894:
    %cm_jsl("PM Maridia Missile Refill", #doorsubmenu_select, #$0072)

doormenu_right_A840:
    %cm_jsl("PM Precious (Lower)", #doorsubmenu_select, #$0073)

doormenu_right_A834:
    %cm_jsl("PM Precious (Upper)", #doorsubmenu_select, #$0074)

doormenu_right_A93C:
    %cm_jsl("PM West Cactus Alley", #doorsubmenu_select, #$0075)

LayoutRedBrinstarRightDoorMenu:
    dw #doormenu_right_90F6
    dw #doormenu_right_910E
    dw #doormenu_right_9096
    dw #doormenu_right_90AE
    dw #doormenu_right_90A2
    dw #doormenu_right_907E
    dw #doormenu_right_905A
    dw #doormenu_right_904E
    dw #doormenu_right_9036
    dw #doormenu_right_902A
    dw #doormenu_right_9132
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_90F6:
    %cm_jsl("RB Bat", #doorsubmenu_select, #$0076)

doormenu_right_910E:
    %cm_jsl("RB Below Spazer", #doorsubmenu_select, #$0077)

doormenu_right_9096:
    %cm_jsl("RB Caterpillars (Lower)", #doorsubmenu_select, #$0078)

doormenu_right_90AE:
    %cm_jsl("RB Caterpillars (Middle)", #doorsubmenu_select, #$0079)

doormenu_right_90A2:
    %cm_jsl("RB Caterpillars (Upper)", #doorsubmenu_select, #$007A)

doormenu_right_907E:
    %cm_jsl("RB Hellway", #doorsubmenu_select, #$007B)

doormenu_right_905A:
    %cm_jsl("RB Red Brinstar Firefleas", #doorsubmenu_select, #$007C)

doormenu_right_904E:
    %cm_jsl("RB Red Tower (Lower)", #doorsubmenu_select, #$007D)

doormenu_right_9036:
    %cm_jsl("RB Red Tower (Middle)", #doorsubmenu_select, #$007E)

doormenu_right_902A:
    %cm_jsl("RB Red Tower (Upper)", #doorsubmenu_select, #$007F)

doormenu_right_9132:
    %cm_jsl("RB Spazer", #doorsubmenu_select, #$0080)

LayoutTourianRightDoorMenu:
    dw #doormenu_right_A9B4
    dw #doormenu_right_A9D8
    dw #doormenu_right_A9F0
    dw #doormenu_right_AE60
    dw #doormenu_right_AAC8
    dw #doormenu_right_AABC
    dw #doormenu_right_AA68
    dw #doormenu_right_AE18
    dw #doormenu_right_AE30
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_A9B4:
    %cm_jsl("TR Metroids 1", #doorsubmenu_select, #$0081)

doormenu_right_A9D8:
    %cm_jsl("TR Metroids 3", #doorsubmenu_select, #$0082)

doormenu_right_A9F0:
    %cm_jsl("TR Metroids 4", #doorsubmenu_select, #$0083)

doormenu_right_AE60:
    %cm_jsl("TR Mother Brain", #doorsubmenu_select, #$0084)

doormenu_right_AAC8:
    %cm_jsl("TR Rinka Shaft (Lower)", #doorsubmenu_select, #$0085)

doormenu_right_AABC:
    %cm_jsl("TR Rinka Shaft (Middle)", #doorsubmenu_select, #$0086)

doormenu_right_AA68:
    %cm_jsl("TR Seaweed", #doorsubmenu_select, #$0087)

doormenu_right_AE18:
    %cm_jsl("TR Tourian Escape 3", #doorsubmenu_select, #$0088)

doormenu_right_AE30:
    %cm_jsl("TR Tourian Escape 4", #doorsubmenu_select, #$0089)

LayoutUpperNorfairRightDoorMenu:
    dw #doormenu_right_974A
    dw #doormenu_right_97AA
    dw #doormenu_right_956A
    dw #doormenu_right_955E
    dw #doormenu_right_959A
    dw #doormenu_right_9552
    dw #doormenu_right_92D6
    dw #doormenu_right_9306
    dw #doormenu_right_92BE
    dw #doormenu_right_928E
    dw #doormenu_right_92A6
    dw #doormenu_right_9402
    dw #doormenu_right_93A2
    dw #doormenu_right_93AE
    dw #doormenu_right_9612
    dw #doormenu_right_9606
    dw #doormenu_upper_norfair_right_goto_page2
    dw #doormenu_upper_norfair_right_goto_page3
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

LayoutUpperNorfairRightDoorMenu2:
    dw #doormenu_right_9726
    dw #doormenu_right_970E
    dw #doormenu_right_97DA
    dw #doormenu_right_9546
    dw #doormenu_right_9426
    dw #doormenu_right_935A
    dw #doormenu_right_9282
    dw #doormenu_right_9336
    dw #doormenu_right_931E
    dw #doormenu_right_9312
    dw #doormenu_right_9342
    dw #doormenu_right_967E
    dw #doormenu_right_968A
    dw #doormenu_right_9666
    dw #doormenu_right_96DE
    dw #doormenu_right_9702
    dw #doormenu_upper_norfair_right_goto_page1
    dw #doormenu_upper_norfair_right_goto_page3
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

LayoutUpperNorfairRightDoorMenu3:
    dw #doormenu_right_9696
    dw #doormenu_right_9786
    dw #doormenu_right_979E
    dw #doormenu_right_9732
    dw #doormenu_right_95CA
    dw #doormenu_right_95BE
    dw #doormenu_right_95A6
    dw #doormenu_right_976E
    dw #doormenu_right_965A
    dw #doormenu_right_964E
    dw #doormenu_right_962A
    dw #doormenu_upper_norfair_right_goto_page1
    dw #doormenu_upper_norfair_right_goto_page2
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_upper_norfair_right_goto_page1:
    %cm_adjacent_submenu("GOTO PAGE ONE", #LayoutUpperNorfairRightDoorMenu)

doormenu_upper_norfair_right_goto_page2:
    %cm_adjacent_submenu("GOTO PAGE TWO", #LayoutUpperNorfairRightDoorMenu2)

doormenu_upper_norfair_right_goto_page3:
    %cm_adjacent_submenu("GOTO PAGE THREE", #LayoutUpperNorfairRightDoorMenu3)

doormenu_right_974A:
    %cm_jsl("UN Acid Snakes Tunnel", #doorsubmenu_select, #$008A)

doormenu_right_97AA:
    %cm_jsl("UN Bat Cave", #doorsubmenu_select, #$008B)

doormenu_right_956A:
    %cm_jsl("UN Bubble Mtn (Lower)", #doorsubmenu_select, #$008C)

doormenu_right_955E:
    %cm_jsl("UN Bubble Mtn (Mid-Lower)", #doorsubmenu_select, #$008D)

doormenu_right_959A:
    %cm_jsl("UN Bubble Mtn (Mid-Upper)", #doorsubmenu_select, #$008E)

doormenu_right_9552:
    %cm_jsl("UN Bubble Mtn (Upper)", #doorsubmenu_select, #$008F)

doormenu_right_92D6:
    %cm_jsl("UN Business Center (Lower)", #doorsubmenu_select, #$0090)

doormenu_right_9306:
    %cm_jsl("UN Business Center (Mid)", #doorsubmenu_select, #$0091)

doormenu_right_92BE:
    %cm_jsl("UN Business Center (Upper)", #doorsubmenu_select, #$0092)

doormenu_right_928E:
    %cm_jsl("UN Cathedral", #doorsubmenu_select, #$0093)

doormenu_right_92A6:
    %cm_jsl("UN Cathedral Entrance", #doorsubmenu_select, #$0094)

doormenu_right_9402:
    %cm_jsl("UN Crocomire Escape", #doorsubmenu_select, #$0095)

doormenu_right_93A2:
    %cm_jsl("UN Croc Speedway (Lower)", #doorsubmenu_select, #$0096)

doormenu_right_93AE:
    %cm_jsl("UN Croc Speedway (Upper)", #doorsubmenu_select, #$0097)

doormenu_right_9612:
    %cm_jsl("UN Double Chamber (Lower)", #doorsubmenu_select, #$0098)

doormenu_right_9606:
    %cm_jsl("UN Double Chamber (Upper)", #doorsubmenu_select, #$0099)

doormenu_right_9726:
    %cm_jsl("UN Farming (Lower)", #doorsubmenu_select, #$009A)

doormenu_right_970E:
    %cm_jsl("UN Farming (Upper)", #doorsubmenu_select, #$009B)

doormenu_right_97DA:
    %cm_jsl("UN Frog Speedway", #doorsubmenu_select, #$009C)

doormenu_right_9546:
    %cm_jsl("UN Green Bubbles Missiles", #doorsubmenu_select, #$009D)

doormenu_right_9426:
    %cm_jsl("UN Hi Jump Energy Tank", #doorsubmenu_select, #$009E)

doormenu_right_935A:
    %cm_jsl("UN Ice Beam", #doorsubmenu_select, #$009F)

doormenu_right_9282:
    %cm_jsl("UN Ice Beam Acid", #doorsubmenu_select, #$00A0)

doormenu_right_9336:
    %cm_jsl("UN Ice Beam Gate (Lower)", #doorsubmenu_select, #$00A1)

doormenu_right_931E:
    %cm_jsl("UN Ice Beam Gate (Middle)", #doorsubmenu_select, #$00A2)

doormenu_right_9312:
    %cm_jsl("UN Ice Beam Gate (Upper)", #doorsubmenu_select, #$00A3)

doormenu_right_9342:
    %cm_jsl("UN Ice Beam Tutorial", #doorsubmenu_select, #$00A4)

doormenu_right_967E:
    %cm_jsl("UN Kronic Boost (Lower)", #doorsubmenu_select, #$00A5)

doormenu_right_968A:
    %cm_jsl("UN Kronic Boost (Middle)", #doorsubmenu_select, #$00A6)

doormenu_right_9666:
    %cm_jsl("UN Kronic Boost (Upper)", #doorsubmenu_select, #$00A7)

doormenu_right_96DE:
    %cm_jsl("UN Lava Dive", #doorsubmenu_select, #$00A8)

doormenu_right_9702:
    %cm_jsl("UN Lower Norfair Elevator", #doorsubmenu_select, #$00A9)

doormenu_right_9696:
    %cm_jsl("UN Magdollite Tunnel", #doorsubmenu_select, #$00AA)

doormenu_right_9786:
    %cm_jsl("UN Nutella Refill", #doorsubmenu_select, #$00AB)

doormenu_right_979E:
    %cm_jsl("UN Purple Farming", #doorsubmenu_select, #$00AC)

doormenu_right_9732:
    %cm_jsl("UN Rising Tide", #doorsubmenu_select, #$00AD)

doormenu_right_95CA:
    %cm_jsl("UN Single Chamber", #doorsubmenu_select, #$00AE)

doormenu_right_95BE:
    %cm_jsl("UN Speed Booster", #doorsubmenu_select, #$00AF)

doormenu_right_95A6:
    %cm_jsl("UN Speed Booster Hall", #doorsubmenu_select, #$00B0)

doormenu_right_976E:
    %cm_jsl("UN Spiky Acid Snake Tunnel", #doorsubmenu_select, #$00B1)

doormenu_right_965A:
    %cm_jsl("UN Volcano (Lower)", #doorsubmenu_select, #$00B2)

doormenu_right_964E:
    %cm_jsl("UN Volcano (Upper)", #doorsubmenu_select, #$00B3)

doormenu_right_962A:
    %cm_jsl("UN Wave Beam", #doorsubmenu_select, #$00B4)

LayoutWestMaridiaRightDoorMenu:
    dw #doormenu_right_A510
    dw #doormenu_right_A4F8
    dw #doormenu_right_A414
    dw #doormenu_right_A378
    dw #doormenu_right_A3D8
    dw #doormenu_right_A408
    dw #doormenu_right_A438
    dw #doormenu_right_A480
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_A510:
    %cm_jsl("WM Crab Hole (Lower)", #doorsubmenu_select, #$00B5)

doormenu_right_A4F8:
    %cm_jsl("WM Crab Hole (Upper)", #doorsubmenu_select, #$00B6)

doormenu_right_A414:
    %cm_jsl("WM Crab Tunnel", #doorsubmenu_select, #$00B7)

doormenu_right_A378:
    %cm_jsl("WM East Tunnel", #doorsubmenu_select, #$00B8)

doormenu_right_A3D8:
    %cm_jsl("WM Fish Tank", #doorsubmenu_select, #$00B9)

doormenu_right_A408:
    %cm_jsl("WM Mama Turtle", #doorsubmenu_select, #$00BA)

doormenu_right_A438:
    %cm_jsl("WM Mount Everest (Upper)", #doorsubmenu_select, #$00BB)

doormenu_right_A480:
    %cm_jsl("WM Red Fish", #doorsubmenu_select, #$00BC)

LayoutWreckedShipRightDoorMenu:
    dw #doormenu_right_A1EC
    dw #doormenu_right_A1E0
    dw #doormenu_right_A2A0
    dw #doormenu_right_A198
    dw #doormenu_right_A2F4
    dw #doormenu_right_A270
    dw #doormenu_right_A27C
    dw #doormenu_right_A300
    dw #doormenu_right_A210
    dw #doormenu_right_A1F8
    dw #doormenu_right_A2C4
    dw #doormenu_right_A24C
    dw #doormenu_right_A2D0
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_A1EC:
    %cm_jsl("WS Assembly Line", #doorsubmenu_select, #$00BD)

doormenu_right_A1E0:
    %cm_jsl("WS Attic", #doorsubmenu_select, #$00BE)

doormenu_right_A2A0:
    %cm_jsl("WS Basement", #doorsubmenu_select, #$00BF)

doormenu_right_A198:
    %cm_jsl("WS Bowling Alley (Middle)", #doorsubmenu_select, #$00C0)

doormenu_right_A2F4:
    %cm_jsl("WS East Supers", #doorsubmenu_select, #$00C1)

doormenu_right_A270:
    %cm_jsl("WS Electric Death (Lower)", #doorsubmenu_select, #$00C2)

doormenu_right_A27C:
    %cm_jsl("WS Electric Death (Upper)", #doorsubmenu_select, #$00C3)

doormenu_right_A300:
    %cm_jsl("WS Gravity Suit", #doorsubmenu_select, #$00C4)

doormenu_right_A210:
    %cm_jsl("WS Main Shaft (Lower)", #doorsubmenu_select, #$00C5)

doormenu_right_A1F8:
    %cm_jsl("WS Main Shaft (Upper)", #doorsubmenu_select, #$00C6)

doormenu_right_A2C4:
    %cm_jsl("WS Phantoon", #doorsubmenu_select, #$00C7)

doormenu_right_A24C:
    %cm_jsl("WS Spiky Death", #doorsubmenu_select, #$00C8)

doormenu_right_A2D0:
    %cm_jsl("WS Sponge Bath", #doorsubmenu_select, #$00C9)

LayoutYellowMaridiaRightDoorMenu:
    dw #doormenu_right_A750
    dw #doormenu_right_A5D0
    dw #doormenu_right_A57C
    dw #doormenu_right_A498
    dw #doormenu_right_A558
    dw #doormenu_right_A540
    dw #doormenu_right_A4D4
    dw #doormenu_right_A564
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_A750:
    %cm_jsl("YM Butterfly", #doorsubmenu_select, #$00CA)

doormenu_right_A5D0:
    %cm_jsl("YM Kassiuz", #doorsubmenu_select, #$00CB)

doormenu_right_A57C:
    %cm_jsl("YM Maridia Elevator", #doorsubmenu_select, #$00CC)

doormenu_right_A498:
    %cm_jsl("YM Northwest Maridia Bugs", #doorsubmenu_select, #$00CD)

doormenu_right_A558:
    %cm_jsl("YM Plasma", #doorsubmenu_select, #$00CE)

doormenu_right_A540:
    %cm_jsl("YM Plasma Tutorial", #doorsubmenu_select, #$00CF)

doormenu_right_A4D4:
    %cm_jsl("YM Pseudo Plasma Spark", #doorsubmenu_select, #$00D0)

doormenu_right_A564:
    %cm_jsl("YM Thread The Needle", #doorsubmenu_select, #$00D1)

LayoutExitOnlyRightDoorMenu:
    dw #doormenu_right_93DE
    dw #doormenu_right_892E
    dw #doormenu_right_AA44
    dw #doormenu_right_AA14
    dw #doormenu_right_AAB0
    dw #doormenu_right_A1A4
    dw #$0000
    %cm_header("SELECT RIGHT DOOR")

doormenu_right_93DE:
    %cm_jsl("CL Crocomire", #doorsubmenu_select, #$00D2)

doormenu_right_892E:
    %cm_jsl("CR Landing Site (Upper)", #doorsubmenu_select, #$00D3)

doormenu_right_AA44:
    %cm_jsl("TR Big Boy", #doorsubmenu_select, #$00D4)

doormenu_right_AA14:
    %cm_jsl("TR Blue Hoppers", #doorsubmenu_select, #$00D5)

doormenu_right_AAB0:
    %cm_jsl("TR Rinka Shaft (Upper)", #doorsubmenu_select, #$00D6)

doormenu_right_A1A4:
    %cm_jsl("WS Bowling Alley (Lower)", #doorsubmenu_select, #$00D7)

layout_leftright_rightdoor:
    dw !ACTION_CHOICE_JSL_TEXT
    dl #!ram_door_portal_right
    dw #$0000
    dw #doormenu_right_8FEE     ; Blue Brinstar
    dw #doormenu_right_8EDA
    dw #doormenu_right_8EC2
    dw #doormenu_right_8EE6
    dw #doormenu_right_8EF2
    dw #doormenu_right_94AA     ; Croc's Lair
    dw #doormenu_right_94E6
    dw #doormenu_right_94B6
    dw #doormenu_right_943E
    dw #doormenu_right_94DA
    dw #doormenu_right_9486
    dw #doormenu_right_8C82     ; Crateria
    dw #doormenu_right_8BAA
    dw #doormenu_right_8A12
    dw #doormenu_right_ADF4
    dw #doormenu_right_8C76
    dw #doormenu_right_8C6A
    dw #doormenu_right_8AAE
    dw #doormenu_right_8A2A
    dw #doormenu_right_89B2
    dw #doormenu_right_8AC6
    dw #doormenu_right_8A66
    dw #doormenu_right_8BB6
    dw #doormenu_right_8A7E
    dw #doormenu_right_8B1A
    dw #doormenu_right_8952
    dw #doormenu_right_8C46
    dw #doormenu_right_8916
    dw #doormenu_right_8C22
    dw #doormenu_right_8ADE
    dw #doormenu_right_8B92
    dw #doormenu_right_ADB8
    dw #doormenu_right_ADAC
    dw #doormenu_right_AD70
    dw #doormenu_right_8B7A
    dw #doormenu_right_8BCE
    dw #doormenu_right_8BE6
    dw #doormenu_right_89CA
    dw #doormenu_right_8F22     ; Green Brinstar
    dw #doormenu_right_8D7E
    dw #doormenu_right_8D36
    dw #doormenu_right_8D66
    dw #doormenu_right_8D4E
    dw #doormenu_right_8F52
    dw #doormenu_right_8F3A
    dw #doormenu_right_8E7A
    dw #doormenu_right_8CFA
    dw #doormenu_right_8CBE
    dw #doormenu_right_8CCA
    dw #doormenu_right_8D12
    dw #doormenu_right_8D06
    dw #doormenu_right_8CB2
    dw #doormenu_right_8EFE
    dw #doormenu_right_8E32
    dw #doormenu_right_A684     ; Green Maridia
    dw #doormenu_right_A660
    dw #doormenu_right_A780
    dw #doormenu_right_A8C4
    dw #doormenu_right_A7C8
    dw #doormenu_right_A63C
    dw #doormenu_right_A528
    dw #doormenu_right_9192     ; Kraid's Lair
    dw #doormenu_right_91CE
    dw #doormenu_right_91AA
    dw #doormenu_right_920A
    dw #doormenu_right_9252
    dw #doormenu_right_922E
    dw #doormenu_right_914A
    dw #doormenu_right_913E
    dw #doormenu_right_9996     ; Lower Norfair
    dw #doormenu_right_988E
    dw #doormenu_right_9AAA
    dw #doormenu_right_9A92
    dw #doormenu_right_9876
    dw #doormenu_right_98A6
    dw #doormenu_right_99D2
    dw #doormenu_right_99F6
    dw #doormenu_right_9852
    dw #doormenu_right_9A32
    dw #doormenu_right_992A
    dw #doormenu_right_9942
    dw #doormenu_right_9906
    dw #doormenu_right_98E2
    dw #doormenu_right_995A
    dw #doormenu_right_98B2
    dw #doormenu_right_98CA
    dw #doormenu_right_9A86
    dw #doormenu_right_99AE
    dw #doormenu_right_9A4A
    dw #doormenu_right_9A1A
    dw #doormenu_right_998A
    dw #doormenu_right_9972
    dw #doormenu_right_8E0E     ; Pink Brinstar
    dw #doormenu_right_8DDE
    dw #doormenu_right_8DD2
    dw #doormenu_right_8DF6
    dw #doormenu_right_8DBA
    dw #doormenu_right_8DA2
    dw #doormenu_right_8FB2
    dw #doormenu_right_8FCA
    dw #doormenu_right_8F82
    dw #doormenu_right_8D1E
    dw #doormenu_right_8D2A
    dw #doormenu_right_A744     ; Pink Maridia
    dw #doormenu_right_A708
    dw #doormenu_right_A7D4
    dw #doormenu_right_A90C
    dw #doormenu_right_A84C
    dw #doormenu_right_A7E0
    dw #doormenu_right_A4B0
    dw #doormenu_right_A978
    dw #doormenu_right_A954
    dw #doormenu_right_A8DC
    dw #doormenu_right_A900
    dw #doormenu_right_A894
    dw #doormenu_right_A840
    dw #doormenu_right_A834
    dw #doormenu_right_A93C
    dw #doormenu_right_90F6     ; Red Brinstar
    dw #doormenu_right_910E
    dw #doormenu_right_9096
    dw #doormenu_right_90AE
    dw #doormenu_right_90A2
    dw #doormenu_right_907E
    dw #doormenu_right_905A
    dw #doormenu_right_904E
    dw #doormenu_right_9036
    dw #doormenu_right_902A
    dw #doormenu_right_9132
    dw #doormenu_right_A9B4     ; Tourian
    dw #doormenu_right_A9D8
    dw #doormenu_right_A9F0
    dw #doormenu_right_AE60
    dw #doormenu_right_AAC8
    dw #doormenu_right_AABC
    dw #doormenu_right_AA68
    dw #doormenu_right_AE18
    dw #doormenu_right_AE30
    dw #doormenu_right_974A     ; Upper Norfair
    dw #doormenu_right_97AA
    dw #doormenu_right_956A
    dw #doormenu_right_955E
    dw #doormenu_right_959A
    dw #doormenu_right_9552
    dw #doormenu_right_92D6
    dw #doormenu_right_9306
    dw #doormenu_right_92BE
    dw #doormenu_right_928E
    dw #doormenu_right_92A6
    dw #doormenu_right_9402
    dw #doormenu_right_93A2
    dw #doormenu_right_93AE
    dw #doormenu_right_9612
    dw #doormenu_right_9606
    dw #doormenu_right_9726
    dw #doormenu_right_970E
    dw #doormenu_right_97DA
    dw #doormenu_right_9546
    dw #doormenu_right_9426
    dw #doormenu_right_935A
    dw #doormenu_right_9282
    dw #doormenu_right_9336
    dw #doormenu_right_931E
    dw #doormenu_right_9312
    dw #doormenu_right_9342
    dw #doormenu_right_967E
    dw #doormenu_right_968A
    dw #doormenu_right_9666
    dw #doormenu_right_96DE
    dw #doormenu_right_9702
    dw #doormenu_right_9696
    dw #doormenu_right_9786
    dw #doormenu_right_979E
    dw #doormenu_right_9732
    dw #doormenu_right_95CA
    dw #doormenu_right_95BE
    dw #doormenu_right_95A6
    dw #doormenu_right_976E
    dw #doormenu_right_965A
    dw #doormenu_right_964E
    dw #doormenu_right_962A
    dw #doormenu_right_A510     ; West Maridia
    dw #doormenu_right_A4F8
    dw #doormenu_right_A414
    dw #doormenu_right_A378
    dw #doormenu_right_A3D8
    dw #doormenu_right_A408
    dw #doormenu_right_A438
    dw #doormenu_right_A480
    dw #doormenu_right_A1EC     ; Wrecked Ship
    dw #doormenu_right_A1E0
    dw #doormenu_right_A2A0
    dw #doormenu_right_A198
    dw #doormenu_right_A2F4
    dw #doormenu_right_A270
    dw #doormenu_right_A27C
    dw #doormenu_right_A300
    dw #doormenu_right_A210
    dw #doormenu_right_A1F8
    dw #doormenu_right_A2C4
    dw #doormenu_right_A24C
    dw #doormenu_right_A2D0
    dw #doormenu_right_A750     ; Yellow Maridia
    dw #doormenu_right_A5D0
    dw #doormenu_right_A57C
    dw #doormenu_right_A498
    dw #doormenu_right_A558
    dw #doormenu_right_A540
    dw #doormenu_right_A4D4
    dw #doormenu_right_A564
    dw #doormenu_right_93DE     ; Exit Only
    dw #doormenu_right_892E
    dw #doormenu_right_AA44
    dw #doormenu_right_AA14
    dw #doormenu_right_AAB0
    dw #doormenu_right_A1A4
    dw #$0000


; -----------------
; Up Doors
; -----------------
LayoutBlueBrinstarUpDoorMenu:
    dw #$0000
    %cm_header("SELECT UP DOOR")

LayoutCrocLairUpDoorMenu:
    dw #doormenu_up_944A
    dw #doormenu_up_949E
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_944A:
    %cm_jsl("CL Post Croc Farm", #doorsubmenu_select, #$0000)

doormenu_up_949E:
    %cm_jsl("CL Post Croc Shaft", #doorsubmenu_select, #$0001)

LayoutCrateriaUpDoorMenu:
    dw #doormenu_up_8A42
    dw #doormenu_up_8ABA
    dw #doormenu_up_8A8A
    dw #doormenu_up_ADA0
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_8A42:
    %cm_jsl("CR Crateria Kihunters", #doorsubmenu_select, #$0002)

doormenu_up_8ABA:
    %cm_jsl("CR Forgotten Highway Elbow", #doorsubmenu_select, #$0003)

doormenu_up_8A8A:
    %cm_jsl("CR Forgotten Highway Kago", #doorsubmenu_select, #$0004)

doormenu_up_ADA0:
    %cm_jsl("CR Parlor", #doorsubmenu_select, #$0005)

LayoutGreenBrinstarUpDoorMenu:
    dw #doormenu_up_8E56
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_8E56:
    %cm_jsl("GB Spore Spawn", #doorsubmenu_select, #$0006)

LayoutGreenMaridiaUpDoorMenu:
    dw #$0000
    %cm_header("SELECT UP DOOR")

LayoutKraidLairUpDoorMenu:
    dw #doormenu_up_916E
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_916E:
    %cm_jsl("KL Kihunters", #doorsubmenu_select, #$0007)

LayoutLowerNorfairUpDoorMenu:
    dw #doormenu_up_99EA
    dw #doormenu_up_99C6
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_99EA:
    %cm_jsl("LN Kihunter Shaft", #doorsubmenu_select, #$0008)

doormenu_up_99C6:
    %cm_jsl("LN Spring Ball Maze", #doorsubmenu_select, #$0009)

LayoutPinkBrinstarUpDoorMenu:
    dw #$0000
    %cm_header("SELECT UP DOOR")

LayoutPinkMaridiaUpDoorMenu:
    dw #doormenu_up_A768
    dw #doormenu_up_A6CC
    dw #doormenu_up_A6B4
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_A768:
    %cm_jsl("PM Botwoon Hallway", #doorsubmenu_select, #$000A)

doormenu_up_A6CC:
    %cm_jsl("PM East Sand Hole", #doorsubmenu_select, #$000B)

doormenu_up_A6B4:
    %cm_jsl("PM West Sand Hole", #doorsubmenu_select, #$000C)

LayoutRedBrinstarUpDoorMenu:
    dw #$0000
    %cm_header("SELECT UP DOOR")

LayoutTourianUpDoorMenu:
    dw #doormenu_up_A9FC
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_A9FC:
    %cm_jsl("TR Metroids 4", #doorsubmenu_select, #$000D)

LayoutUpperNorfairUpDoorMenu:
    dw #doormenu_up_9576
    dw #doormenu_up_93D2
    dw #doormenu_up_97FE
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_9576:
    %cm_jsl("UN Bubble Mtn", #doorsubmenu_select, #$000E)

doormenu_up_93D2:
    %cm_jsl("UN Croc Speedway", #doorsubmenu_select, #$000F)

doormenu_up_97FE:
    %cm_jsl("UN Red Pirates Shaft", #doorsubmenu_select, #$0010)

LayoutWestMaridiaUpDoorMenu:
    dw #doormenu_up_A39C
    dw #doormenu_up_A444
    dw #doormenu_up_A450
    dw #doormenu_up_A474
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_A39C:
    %cm_jsl("WM Main Street", #doorsubmenu_select, #$0011)

doormenu_up_A444:
    %cm_jsl("WM Mount Everest (Left)", #doorsubmenu_select, #$0012)

doormenu_up_A450:
    %cm_jsl("WM Mount Everest (Right)", #doorsubmenu_select, #$0013)

doormenu_up_A474:
    %cm_jsl("WM Red Fish", #doorsubmenu_select, #$0014)

LayoutWreckedShipUpDoorMenu:
    dw #doormenu_up_A1C8
    dw #doormenu_up_A21C
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_A1C8:
    %cm_jsl("WS Attic", #doorsubmenu_select, #$0015)

doormenu_up_A21C:
    %cm_jsl("WS Main Shaft", #doorsubmenu_select, #$0016)

LayoutYellowMaridiaUpDoorMenu:
    dw #doormenu_up_A5AC
    dw #doormenu_up_A4E0
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_A5AC:
    %cm_jsl("YM Plasma Spark", #doorsubmenu_select, #$0017)

doormenu_up_A4E0:
    %cm_jsl("YM Pseudo Plasma Spark", #doorsubmenu_select, #$0018)

LayoutExitOnlyUpDoorMenu:
    dw #doormenu_up_AAEC
    dw #$0000
    %cm_header("SELECT UP DOOR")

doormenu_up_AAEC:
    %cm_jsl("TR Tourian Escape 1", #doorsubmenu_select, #$0019)

layout_updown_updoor:
    dw !ACTION_CHOICE_JSL_TEXT
    dl #!ram_door_portal_up
    dw #$0000
    dw #doormenu_up_944A        ; Croc's Lair
    dw #doormenu_up_949E
    dw #doormenu_up_8A42        ; Crateria
    dw #doormenu_up_8ABA
    dw #doormenu_up_8A8A
    dw #doormenu_up_ADA0
    dw #doormenu_up_8E56        ; Green Brinstar
    dw #doormenu_up_916E        ; Kraid's Lair
    dw #doormenu_up_99EA        ; Lower Norfair
    dw #doormenu_up_99C6
    dw #doormenu_up_A768        ; Pink Maridia
    dw #doormenu_up_A6CC
    dw #doormenu_up_A6B4
    dw #doormenu_up_A9FC        ; Tourian
    dw #doormenu_up_9576        ; Upper Norfair
    dw #doormenu_up_93D2
    dw #doormenu_up_97FE
    dw #doormenu_up_A39C        ; West Maridia
    dw #doormenu_up_A444
    dw #doormenu_up_A450
    dw #doormenu_up_A474
    dw #doormenu_up_A1C8        ; Wrecked Ship
    dw #doormenu_up_A21C
    dw #doormenu_up_A5AC        ; Yellow Maridia
    dw #doormenu_up_A4E0
    dw #doormenu_up_AAEC        ; Exit Only
    dw #$0000


; -----------------
; Down Doors
; -----------------
LayoutBlueBrinstarDownDoorMenu:
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

LayoutCrocLairDownDoorMenu:
    dw #doormenu_down_93EA
    dw #doormenu_down_94CE
    dw #doormenu_down_947A
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_93EA:
    %cm_jsl("CL Crocomire", #doorsubmenu_select, #$0000)

doormenu_down_94CE:
    %cm_jsl("CL Post Croc Jump", #doorsubmenu_select, #$0001)

doormenu_down_947A:
    %cm_jsl("CL Post Croc Shaft", #doorsubmenu_select, #$0002)

LayoutCrateriaDownDoorMenu:
    dw #doormenu_down_ADC4
    dw #doormenu_down_8A96
    dw #doormenu_down_8A4E
    dw #doormenu_down_8AF6
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_ADC4:
    %cm_jsl("CR Climb", #doorsubmenu_select, #$0003)

doormenu_down_8A96:
    %cm_jsl("CR Crab Maze", #doorsubmenu_select, #$0004)

doormenu_down_8A4E:
    %cm_jsl("CR Forgotten Elevator", #doorsubmenu_select, #$0005)

doormenu_down_8AF6:
    %cm_jsl("CR Red Brin Elevator", #doorsubmenu_select, #$0006)

LayoutGreenBrinstarDownDoorMenu:
    dw #doormenu_down_8E3E
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_8E3E:
    %cm_jsl("GB Spore Spawn Kihunters", #doorsubmenu_select, #$0007)

LayoutGreenMaridiaDownDoorMenu:
    dw #doormenu_down_A678
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_A678:
    %cm_jsl("GM Oasis", #doorsubmenu_select, #$0008)

LayoutKraidLairDownDoorMenu:
    dw #doormenu_down_9156
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_9156:
    %cm_jsl("KL Warehouse Zeela", #doorsubmenu_select, #$0009)

LayoutLowerNorfairDownDoorMenu:
    dw #doormenu_down_99DE
    dw #doormenu_down_9A26
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_99DE:
    %cm_jsl("LN Jail Power Bombs", #doorsubmenu_select, #$000A)

doormenu_down_9A26:
    %cm_jsl("LN Wasteland", #doorsubmenu_select, #$000B)

LayoutPinkBrinstarDownDoorMenu:
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

LayoutPinkMaridiaDownDoorMenu:
    dw #doormenu_down_A72C
    dw #doormenu_down_A4BC
    dw #doormenu_down_A6C0
    dw #doormenu_down_A6A8
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_A72C:
    %cm_jsl("PM Aqueduct", #doorsubmenu_select, #$000C)

doormenu_down_A4BC:
    %cm_jsl("PM Crab Shaft", #doorsubmenu_select, #$000D)

doormenu_down_A6C0:
    %cm_jsl("PM East Sand Hole", #doorsubmenu_select, #$000E)

doormenu_down_A6A8:
    %cm_jsl("PM West Sand Hole", #doorsubmenu_select, #$000F)

LayoutRedBrinstarDownDoorMenu:
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

LayoutTourianDownDoorMenu:
    dw #doormenu_down_AA08
    dw #doormenu_down_AE00
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_AA08:
    %cm_jsl("TR Blue Hoppers", #doorsubmenu_select, #$0010)

doormenu_down_AE00:
    %cm_jsl("TR Tourian Escape 2", #doorsubmenu_select, #$0011)

LayoutUpperNorfairDownDoorMenu:
    dw #doormenu_down_9762
    dw #doormenu_down_96AE
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_9762:
    %cm_jsl("UN Acid Snakes Tunnel", #doorsubmenu_select, #$0012)

doormenu_down_96AE:
    %cm_jsl("UN Purple Shaft", #doorsubmenu_select, #$0013)

LayoutWestMaridiaDownDoorMenu:
    dw #doormenu_down_A3F0
    dw #doormenu_down_A3FC
    dw #doormenu_down_A330
    dw #doormenu_down_A42C
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_A3F0:
    %cm_jsl("WM Fish Tank (Left)", #doorsubmenu_select, #$0014)

doormenu_down_A3FC:
    %cm_jsl("WM Fish Tank (Right)", #doorsubmenu_select, #$0015)

doormenu_down_A330:
    %cm_jsl("WM Glass Tunnel", #doorsubmenu_select, #$0016)

doormenu_down_A42C:
    %cm_jsl("WM Mount Everest", #doorsubmenu_select, #$0017)

LayoutWreckedShipDownDoorMenu:
    dw #doormenu_down_A294
    dw #doormenu_down_A228
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

doormenu_down_A294:
    %cm_jsl("WS Basement", #doorsubmenu_select, #$0018)

doormenu_down_A228:
    %cm_jsl("WS Main Shaft", #doorsubmenu_select, #$0019)

LayoutYellowMaridiaDownDoorMenu:
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

LayoutExitOnlyDownDoorMenu:
    dw #$0000
    %cm_header("SELECT DOWN DOOR")

layout_updown_downdoor:
    dw !ACTION_CHOICE_JSL_TEXT
    dl #!ram_door_portal_down
    dw #$0000
    dw #doormenu_down_93EA      ; Croc's Lair
    dw #doormenu_down_94CE
    dw #doormenu_down_947A
    dw #doormenu_down_ADC4      ; Crateria
    dw #doormenu_down_8A96
    dw #doormenu_down_8A4E
    dw #doormenu_down_8AF6
    dw #doormenu_down_8E3E      ; Green Brinstar
    dw #doormenu_down_A678      ; Green Maridia
    dw #doormenu_down_9156      ; Kraid's Lair
    dw #doormenu_down_99DE      ; Lower Norfair
    dw #doormenu_down_9A26
    dw #doormenu_down_A72C      ; Pink Maridia
    dw #doormenu_down_A4BC
    dw #doormenu_down_A6C0
    dw #doormenu_down_A6A8
    dw #doormenu_down_AA08      ; Tourian
    dw #doormenu_down_AE00
    dw #doormenu_down_9762      ; Upper Norfair
    dw #doormenu_down_96AE
    dw #doormenu_down_A3F0      ; West Maridia
    dw #doormenu_down_A3FC
    dw #doormenu_down_A330
    dw #doormenu_down_A42C
    dw #doormenu_down_A294      ; Wrecked Ship
    dw #doormenu_down_A228
    dw #$0000


print pc, " layoutmenu end"
pullpc
