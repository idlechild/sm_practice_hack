
; ---------
; Work RAM
; ---------

!ram_tilemap_buffer = $7E5800
!CRASHDUMP_TILEMAP_BUFFER = !ram_tilemap_buffer

!WRAM_BANK = #$007E
!WRAM_SIZE = #$0200
!WRAM_START = $7EFD00
!WRAM_END = $7EFF00

; These variables are NOT PERSISTENT across savestates --
; they're saved and reloaded along with the game state.
; Use this section for infohud variables that are dependent
; on the game state. For variables that depend on user
; settings, place them below WRAM_PERSIST_START below.

!ram_custom_preset                  = !WRAM_START+$7A
!ram_auto_save_state                = !WRAM_START+$7C

; ^ FREE SPACE ^ up to +$7E

!WRAM_PERSIST_START = !WRAM_START+$80

; ----------------------------------------------------------
; Variables below this point are PERSISTENT -- they maintain
; their value across savestates. Use this section for
; variables such as user settings that do not depend on the
; current game state.

!ram_override_grey_door_close       = !WRAM_PERSIST_START+$52
!ram_sprite_feature_flags           = !WRAM_PERSIST_START+$54
!ram_door_portals_enabled           = !WRAM_PERSIST_START+$56
!ram_door_portal_left               = !WRAM_PERSIST_START+$58
!ram_door_portal_right              = !WRAM_PERSIST_START+$5A
!ram_door_portal_up                 = !WRAM_PERSIST_START+$5C
!ram_door_portal_down               = !WRAM_PERSIST_START+$5E

; ^ FREE SPACE ^ up to +$7E

; ---------
; RAM Menu
; ---------

!WRAM_MENU_START = $7EFE00

!ram_cm_stack_index = $05D5
!ram_cm_menu_stack = !WRAM_MENU_START+$00         ; 16 bytes
!ram_cm_cursor_stack = !WRAM_MENU_START+$10       ; 16 bytes

!ram_cm_cursor_max = !WRAM_MENU_START+$20
!ram_cm_horizontal_cursor = !WRAM_MENU_START+$22
!ram_cm_input_timer = !WRAM_MENU_START+$24
!ram_cm_controller = !WRAM_MENU_START+$26
!ram_cm_menu_bank = !WRAM_MENU_START+$28

!ram_cm_etanks = !WRAM_MENU_START+$2A
!ram_cm_reserve = !WRAM_MENU_START+$2C
!ram_cm_leave = !WRAM_MENU_START+$2E
!ram_cm_input_counter = !WRAM_MENU_START+$30
!ram_cm_last_nmi_counter = !WRAM_MENU_START+$32

!ram_cm_ctrl_mode = !WRAM_MENU_START+$34
!ram_cm_ctrl_timer = !WRAM_MENU_START+$36
!ram_cm_ctrl_last_input = !WRAM_MENU_START+$38
!ram_cm_ctrl_assign = !WRAM_MENU_START+$3A
!ram_cm_ctrl_swap = !WRAM_MENU_START+$3C

!ram_cm_palette_border = !WRAM_MENU_START+$3E
!ram_cm_palette_headeroutline = !WRAM_MENU_START+$40
!ram_cm_palette_text = !WRAM_MENU_START+$42
!ram_cm_palette_background = !WRAM_MENU_START+$44
!ram_cm_palette_numoutline = !WRAM_MENU_START+$46
!ram_cm_palette_numfill = !WRAM_MENU_START+$48
!ram_cm_palette_toggleon = !WRAM_MENU_START+$4A
!ram_cm_palette_seltext = !WRAM_MENU_START+$4C
!ram_cm_palette_seltextbg = !WRAM_MENU_START+$4E
!ram_cm_palette_numseloutline = !WRAM_MENU_START+$50
!ram_cm_palette_numsel = !WRAM_MENU_START+$52
!ram_cm_custom_preset_labels = !WRAM_MENU_START+$54

!ram_cm_door_menu_value = !WRAM_MENU_START+$72
!ram_cm_door_menu_bank = !WRAM_MENU_START+$74
!ram_cm_door_direction_index = !WRAM_MENU_START+$76

!ram_cm_varia = !WRAM_MENU_START+$80
!ram_cm_gravity = !WRAM_MENU_START+$82
!ram_cm_morph = !WRAM_MENU_START+$84
!ram_cm_bombs = !WRAM_MENU_START+$86
!ram_cm_spring = !WRAM_MENU_START+$88
!ram_cm_screw = !WRAM_MENU_START+$8A
!ram_cm_hijump = !WRAM_MENU_START+$8C
!ram_cm_space = !WRAM_MENU_START+$8E
!ram_cm_speed = !WRAM_MENU_START+$90
!ram_cm_charge = !WRAM_MENU_START+$92
!ram_cm_ice = !WRAM_MENU_START+$94
!ram_cm_wave = !WRAM_MENU_START+$96
!ram_cm_spazer = !WRAM_MENU_START+$98
!ram_cm_plasma = !WRAM_MENU_START+$9A

!ram_cm_custompalette_blue = !WRAM_MENU_START+$9C
!ram_cm_custompalette_green = !WRAM_MENU_START+$9E
!ram_cm_custompalette_red = !WRAM_MENU_START+$A0
!ram_cm_custompalette = !WRAM_MENU_START+$A2
!ram_cm_dummy_on = !WRAM_MENU_START+$A4
!ram_cm_dummy_off = !WRAM_MENU_START+$A6
!ram_cm_dummy_num = !WRAM_MENU_START+$A8

!ram_cm_manage_slots = !WRAM_MENU_START+$AA
!ram_cm_selected_slot = !WRAM_MENU_START+$AC

; ^ FREE SPACE ^ up to +$B6

!ram_cm_keyboard_buffer = !WRAM_MENU_START+$B8 ; $18 bytes

; Reserve 48 bytes for CGRAM cache
; Currently first 28 bytes plus last 2 bytes are used
!ram_cgram_cache = !WRAM_MENU_START+$D0

!CRASHDUMP = $7EFF00


; -----
; SRAM
; -----

if !FEATURE_SD2SNES
!SRAM_START_BANK = $770000
else
if !FEATURE_PRESETS
!SRAM_START_BANK = $710000
else
!SRAM_START_BANK = $700000
endif
endif

!SRAM_START = !SRAM_START_BANK+$1C00

!sram_initialized = !SRAM_START+$00
!sram_ctrl_menu = !SRAM_START+$02
!sram_ctrl_load_state = !SRAM_START+$04
!sram_ctrl_save_state = !SRAM_START+$06
!sram_ctrl_auto_save_state = !SRAM_START+$08
!sram_ctrl_save_custom_preset = !SRAM_START+$0A
!sram_ctrl_load_custom_preset = !SRAM_START+$0C

!sram_rerandomize = !SRAM_START+$28
!sram_music_toggle = !SRAM_START+$2A
!sram_healthalarm = !SRAM_START+$2C
!sram_skip_splash = !SRAM_START+$2E
!sram_preset_close_doors = !SRAM_START+$30
!sram_custom_preset_slot = !SRAM_START+$32
!sram_preset_preserve_enemies = !SRAM_START+$34
!sram_sprite_prio_flag = !SRAM_START+$36
!sram_custom_header = !SRAM_START+$38 ; $18 bytes

; do not change order without updating custom palette profiles in customizemenu.asm
!sram_palette_border = !SRAM_START+$5C
!sram_palette_headeroutline = !SRAM_START+$5E
!sram_palette_text = !SRAM_START+$60
!sram_palette_numoutline = !SRAM_START+$62
!sram_palette_numfill = !SRAM_START+$64
!sram_palette_toggleon = !SRAM_START+$66
!sram_palette_seltext = !SRAM_START+$68
!sram_palette_seltextbg = !SRAM_START+$6A
!sram_palette_background = !SRAM_START+$6C
!sram_palette_numseloutline = !SRAM_START+$6E
!sram_palette_numsel = !SRAM_START+$70

!sram_custompalette_profile = !SRAM_START+$72
!sram_menu_background = !SRAM_START+$74
!sram_cm_scroll_delay = !SRAM_START+$76

!sram_customsfx_move = !SRAM_START+$78
!sram_customsfx_toggle = !SRAM_START+$7A
!sram_customsfx_number = !SRAM_START+$7C
!sram_customsfx_confirm = !SRAM_START+$7E
!sram_customsfx_goback = !SRAM_START+$80

!SRAM_MUSIC_DATA = !SRAM_START+$90
!SRAM_MUSIC_TRACK = !SRAM_START+$92
!SRAM_SOUND_TIMER = !SRAM_START+$94

; ^ FREE SPACE ^ up to +$1FE

if !FEATURE_PRESETS
!sram_custom_preset_names = !SRAM_START_BANK+$1000 ; $480 bytes
!sram_custom_preset_safewords = !SRAM_START_BANK+$1480 ; $60 bytes
endif


; --------------
; Vanilla Labels
; --------------

!IH_CONTROLLER_PRI = $8B
!IH_CONTROLLER_PRI_NEW = $8F
!IH_CONTROLLER_PRI_PREV = $97

!IH_CONTROLLER_SEC = $8D
!IH_CONTROLLER_SEC_NEW = $91
!IH_CONTROLLER_SEC_PREV = $99

!KB_SHIFT1 = $9A
!KB_SHIFT2 = $9B
!KB_DEL1 = $9C
!KB_DEL2 = $9D
!MENU_CLEAR = #$000E
!MENU_BLANK = #$281F
!MENU_SLASH = #$287F
!MENU_ARROW_RIGHT = #$3880
!IH_BLANK = #$2C0F
!IH_PERCENT = #$0C0A
!IH_DECIMAL = #$0CCB
!IH_HYPHEN = #$0C55
!IH_RESERVE_AUTO = #$0C0C
!IH_RESERVE_EMPTY = #$0C0D
!IH_HEALTHBOMB = #$085A
!IH_LETTER_A = #$0C64
!IH_LETTER_B = #$0C65
!IH_LETTER_C = #$0C58
!IH_LETTER_D = #$0C59
!IH_LETTER_E = #$0C5A
!IH_LETTER_F = #$0C5B
!IH_LETTER_H = #$0C6C
!IH_LETTER_L = #$0C68
!IH_LETTER_N = #$0C56
!IH_LETTER_R = #$0C69
!IH_LETTER_X = #$0C66
!IH_LETTER_Y = #$0C67
!IH_ELEVATOR = #$1C0B
!IH_SHINETIMER = #$0032

!IH_PAUSE = #$0100 ; right
!IH_SLOWDOWN = #$0400 ; down
!IH_SPEEDUP = #$0800 ; up
!IH_RESET = #$0200 ; left
!IH_STATUS_R = #$0010 ; r
!IH_STATUS_L = #$0020 ; l

!IH_INPUT_START = #$1000
!IH_INPUT_UPDOWN = #$0C00
!IH_INPUT_UP = #$0800
!IH_INPUT_DOWN = #$0400
!IH_INPUT_LEFTRIGHT = #$0300
!IH_INPUT_LEFT = #$0200
!IH_INPUT_RIGHT = #$0100
!IH_INPUT_HELD = #$0001 ; used by menu

!CTRL_B = #$8000
!CTRL_Y = #$4000
!CTRL_SELECT = #$2000
!CTRL_A = #$0080
!CTRL_X = #$0040
!CTRL_L = #$0020
!CTRL_R = #$0010

!INPUT_BIND_UP = $7E09AA
!INPUT_BIND_DOWN = $7E09AC
!INPUT_BIND_LEFT = $7E09AE
!INPUT_BIND_RIGHT = $7E09B0
!IH_INPUT_SHOT = $7E09B2
!IH_INPUT_JUMP = $7E09B4
!IH_INPUT_RUN = $7E09B6
!IH_INPUT_ITEM_CANCEL = $7E09B8
!IH_INPUT_ITEM_SELECT = $7E09BA
!IH_INPUT_ANGLE_DOWN = $7E09BC
!IH_INPUT_ANGLE_UP = $7E09BE

!MUSIC_ROUTINE = $808FC1
!SFX_LIB1 = $80903F
!SFX_LIB2 = $8090C1
!SFX_LIB3 = $809143

!OAM_STACK_POINTER = $0590
!PB_EXPLOSION_STATUS = $0592
!NMI_REQUEST_FLAG = $05B4
!FRAME_COUNTER_8BIT = $05B5
!FRAME_COUNTER = $05B6
!DEBUG_MODE = $05D1
!CACHED_RANDOM_NUMBER = $05E5
!DISABLE_SOUNDS = $05F5
!SOUND_TIMER = $0686
!LOAD_STATION_INDEX = $078B
!DOOR_ID = $078D
!DOOR_DIRECTION = $0791
!ROOM_ID = $079B
!AREA_ID = $079F
!ROOM_WIDTH_BLOCKS = $07A5
!ROOM_WIDTH_SCROLLS = $07A9
!PREVIOUS_CRE_BITSET = $07B1
!CRE_BITSET = $07B3
!STATE_POINTER = $07BB
!MUSIC_DATA = $07F3
!MUSIC_TRACK = $07F5
!LAYER1_X = $0911
!LAYER1_Y = $0915
!LAYER2_X = $0917
!LAYER2_Y = $0919
!BG2_X_SCROLL = $0921
!BG2_Y_SCROLL = $0923
!SAMUS_DOOR_SUBSPEED = $092B
!SAMUS_DOOR_SPEED = $092D
!CURRENT_SAVE_FILE = $0952
!GAMEMODE = $0998
!DOOR_FUNCTION_POINTER = $099C
!SAMUS_ITEMS_EQUIPPED = $09A2
!SAMUS_ITEMS_COLLECTED = $09A4
!SAMUS_BEAMS_EQUIPPED = $09A6
!SAMUS_BEAMS_COLLECTED = $09A8
!SAMUS_RESERVE_MODE = $09C0
!SAMUS_HP = $09C2
!SAMUS_HP_MAX = $09C4
!SAMUS_MISSILES = $09C6
!SAMUS_MISSILES_MAX = $09C8
!SAMUS_SUPERS = $09CA
!SAMUS_SUPERS_MAX = $09CC
!SAMUS_PBS = $09CE
!SAMUS_PBS_MAX = $09D0
!SAMUS_ITEM_SELECTED = $09D2
!SAMUS_RESERVE_MAX = $09D4
!SAMUS_RESERVE_ENERGY = $09D6
!IGT_FRAMES = $09DA
!IGT_SECONDS = $09DC
!IGT_MINUTES = $09DE
!IGT_HOURS = $09E0
!SAMUS_AUTO_CANCEL = $0A04
!SAMUS_LAST_HP = $0A06
!SAMUS_POSE = $0A1C
!SAMUS_POSE_DIRECTION = $0A1E
!SAMUS_MOVEMENT_TYPE = $0A1F
!SAMUS_PREVIOUS_POSE = $0A20
!SAMUS_PREVIOUS_POSE_DIRECTION = $0A22
!SAMUS_PREVIOUS_MOVEMENT_TYPE = $0A23
!SAMUS_LAST_DIFFERENT_POSE = $0A24
!SAMUS_LAST_DIFFERENT_POSE_DIRECTION = $0A26
!SAMUS_LAST_DIFFERENT_MOVEMENT_TYPE = $0A27
!SAMUS_POTENTIAL_POSE_VALUES = $0A28
!SAMUS_POTENTIAL_POSE_FLAGS = $0A2E
!SAMUS_LOCKED_HANDLER = $0A42
!SAMUS_MOVEMENT_HANDLER = $0A44
!SAMUS_SUBUNIT_ENERGY = $0A4C
!SAMUS_NORMAL_MOVEMENT_HANDLER = $0A58
!SAMUS_CONTROLLER_HANDLER = $0A60
!SAMUS_SHINE_TIMER = $0A68
!SAMUS_HEALTH_WARNING = $0A6A
!SAMUS_CONTACT_DAMAGE_INDEX = $0A6E
!SAMUS_HYPER_BEAM = $0A76
!SAMUS_ANIMATION_FRAME_TIMER = $0A94
!SAMUS_ANIMATION_FRAME = $0A96
!SAMUS_SHINESPARK_DELAY_TIMER = $0AA2
!SAMUS_SHINE_TIMER_TYPE = $0ACC
!SAMUS_AUTO_JUMP_TIMER = $0AF4
!SAMUS_X = $0AF6
!SAMUS_X_SUBPX = $0AF8
!SAMUS_Y = $0AFA
!SAMUS_Y_SUBPX = $0AFC
!SAMUS_X_RADIUS = $0AFE
!SAMUS_Y_RADIUS = $0B00
!SAMUS_COLLISION_DIRECTION = $0B02
!SAMUS_SPRITEMAP_X = $0B04
!SAMUS_PREVIOUS_X = $0B10
!SAMUS_PREVIOUS_X_SUBPX = $0B12
!SAMUS_PREVIOUS_Y = $0B14
!SAMUS_PREVIOUS_Y_SUBPX = $0B16
!SAMUS_Y_SUBSPEED = $0B2C
!SAMUS_Y_SPEEDCOMBINED = $0B2D
!SAMUS_Y_SPEED = $0B2E
!SAMUS_Y_SUBACCELERATION = $0B32
!SAMUS_Y_ACCELERATION = $0B34
!SAMUS_Y_DIRECTION = $0B36
!SAMUS_DASH_COUNTER = $0B3F
!SAMUS_X_RUNSPEED = $0B42
!SAMUS_X_SUBRUNSPEED = $0B44
!SAMUS_X_MOMENTUM = $0B46
!SAMUS_X_SUBMOMENTUM = $0B48
!SAMUS_PROJ_X = $0B64
!SAMUS_PROJ_Y = $0B78
!SAMUS_PROJ_RADIUS_X = $0BB4
!SAMUS_PROJ_RADIUS_Y = $0BC8
!SAMUS_PROJ_PROPERTIES = $0C18
!SAMUS_COOLDOWN_TIMER = $0CCC
!SAMUS_PROJECTILE_TIMER = $0CCE
!SAMUS_CHARGE_TIMER = $0CD0
!SAMUS_BOMB_COUNTER = $0CD2
!SAMUS_BOMB_SPREAD_CHARGE_TIMER = $0CD4
!SAMUS_POWER_BOMB_X = $0CE2
!SAMUS_POWER_BOMB_Y = $0CE4
!ELEVATOR_PROPERTIES = $0E16
!ELEVATOR_STATUS = $0E18
!HEALTH_BOMB_FLAG = $0E1A
!ENEMY_BG2_VRAM_TRANSFER_FLAG = $0E1E
!ENEMY_INDEX = $0E54
!ENEMY_ID = $0F78
!ENEMY_X = $0F7A
!ENEMY_Y = $0F7E
!ENEMY_X_RADIUS = $0F82
!ENEMY_Y_RADIUS = $0F84
!ENEMY_PROPERTIES = $0F86
!ENEMY_EXTRA_PROPERTIES = $0F88
!ENEMY_HP = $0F8C
!ENEMY_SPRITEMAP = $0F8E
!ENEMY_BANK = $0FA6
!SAMUS_IFRAME_TIMER = $18A8
!SAMUS_KNOCKBACK_TIMER = $18AA
!ENEMY_PROJ_ID = $1997
!ENEMY_PROJ_X = $1A4B
!ENEMY_PROJ_Y = $1A93
!ENEMY_PROJ_RADIUS = $1BB3
!ENEMY_PROJ_PROPERTIES = $1BD7
!MESSAGE_BOX_INDEX = $1C1F

!HUD_TILEMAP = $7EC600


; --------------------
; Aliases and Bitmasks
; --------------------

!FPS = #$003C
!FPS_8BIT = #$3C

!DP_MenuIndices = $00 ; 0x4
!DP_CurrentMenu = $04 ; 0x4
!DP_Address = $08 ; 0x4
!DP_JSLTarget = $0C ; 0x4
!DP_CtrlInput = $10 ; 0x4
!DP_Palette = $14
!DP_Temp = $16
; v these repeat v
!DP_ToggleValue = $18
!DP_Increment = $1A
!DP_Minimum = $1C
!DP_Maximum = $1E
!DP_DrawValue = $18
!DP_FirstDigit = $1A
!DP_SecondDigit = $1C
!DP_ThirdDigit = $1E
!DP_KB_Index = $18
!DP_KB_Row = $1A
!DP_KB_Control = $1C
!DP_KB_Shift = $1E
; v single digit editing v
!DP_DigitAddress = $20 ; 0x4
!DP_DigitValue = $24
!DP_DigitMinimum = $26
!DP_DigitMaximum = $28

!ACTION_TOGGLE              = #$0000
!ACTION_TOGGLE_BIT          = #$0002
!ACTION_TOGGLE_INVERTED     = #$0004
!ACTION_TOGGLE_BIT_INVERTED = #$0006
!ACTION_NUMFIELD            = #$0008
!ACTION_NUMFIELD_HEX        = #$000A
!ACTION_NUMFIELD_WORD       = #$000C
!ACTION_NUMFIELD_HEX_WORD   = #$000E
!ACTION_NUMFIELD_READONLY   = #$0010
!ACTION_NUMFIELD_COLOR      = #$0012
!ACTION_NUMFIELD_SOUND      = #$0014
!ACTION_CHOICE              = #$0016
!ACTION_CHOICE_JSL_TEXT     = #$0018
!ACTION_CTRL_SHORTCUT       = #$001A
!ACTION_CTRL_INPUT          = #$001C
!ACTION_JSL                 = #$001E
!ACTION_JSL_SUBMENU         = #$0020
!ACTION_CUSTOM_PRESET       = #$0022
!ACTION_DYNAMIC             = #$0024
!ACTION_MANAGE_PRESETS      = #$0026
!ACTION_ARCADE_TIMER        = #$0028

if !FEATURE_PRESETS
!TOTAL_PRESET_SLOTS = #$002F
!PRESET_SLOT_SIZE = #$0200
!PRESET_SLOTS_START = !SRAM_START_BANK+$2000
!PRESET_SLOTS_ROOM = !PRESET_SLOTS_START+$0A
!PRESET_SLOTS_ENERGY = !PRESET_SLOTS_START+$2A
!PRESET_SLOTS_MAXENERGY = !PRESET_SLOTS_START+$2C
!PRESET_SLOTS_RESERVES = !PRESET_SLOTS_START+$3E
!PRESET_SLOTS_MISSILES = !PRESET_SLOTS_START+$2E
!PRESET_SLOTS_SUPERS = !PRESET_SLOTS_START+$32
!PRESET_SLOTS_PBS = !PRESET_SLOTS_START+$36
endif

!SPRITE_SAMUS_HITBOX = #$0001
!SPRITE_ENEMY_HITBOX = #$0002
!SPRITE_EXTENDED_HITBOX = #$0004
!SPRITE_BOSS_HITBOX = #$0008
!SPRITE_SAMUS_PROJ = #$0010
!SPRITE_ENEMY_PROJ = #$0020
!SPRITE_32x32_PROJ = #$0040
!SPRITE_OOB_WATCH = #$0080


; ----------
; Save/Load
; ----------

if !FEATURE_SD2SNES
; Savestate code variables
!SS_INPUT_CUR = $8B
!SS_INPUT_NEW = $8F
!SS_INPUT_PREV = $97

!SRAM_DMA_BANK = !SRAM_START_BANK+$00
!SRAM_SAVED_RNG = !SRAM_START_BANK+$80
!SRAM_SAVED_FRAME_COUNTER = !SRAM_START_BANK+$82
!SRAM_SAVED_SP = !SRAM_START_BANK+$84
!SRAM_SAVED_STATE = !SRAM_START_BANK+$86
endif

