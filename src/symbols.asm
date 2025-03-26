
; ---------------
; Symbol Export
; (autogenerated)
; ---------------

incsrc wram_symbols.asm

; ---------
; Work RAM
; ---------

; The crash buffer and initial address can be moved around as needed
; It is currently placed in the back half of the backup of BG2 tilemap during x-ray,
; which means it is unlikely to overwrite anything relevant for debugging

; Practice hack menu tilemap buffer
ram_tilemap_buffer = !ram_tilemap_buffer ; $7EF500 ; 2048 bytes

; Shortcut routine is written on boot and each time the menu closes,
; so it can use the same space as the practice hack menu tilemap buffer
; Shortcuts can skip remaining checks by replacing the return address word

; These variables are NOT PERSISTENT across savestates --
; they're saved and reloaded along with the game state.
; Use this section for infohud variables that are dependent
; on the game state. For variables that depend on user
; settings, place them below WRAM_PERSIST_START below.

ram_load_preset = !ram_load_preset ; !WRAM_START+$00
ram_gametime_room = !ram_gametime_room ; !WRAM_START+$02
ram_last_gametime_room = !ram_last_gametime_room ; !WRAM_START+$04
ram_realtime_room = !ram_realtime_room ; !WRAM_START+$06
ram_last_realtime_room = !ram_last_realtime_room ; !WRAM_START+$08
ram_last_room_lag = !ram_last_room_lag ; !WRAM_START+$0A
ram_last_door_lag_frames = !ram_last_door_lag_frames ; !WRAM_START+$0C
ram_transition_counter = !ram_transition_counter ; !WRAM_START+$0E
ram_transition_flag = !ram_transition_flag ; !WRAM_START+$10
ram_last_realtime_door = !ram_last_realtime_door ; !WRAM_START+$12

ram_seg_rt_frames = !ram_seg_rt_frames ; !WRAM_START+$14
ram_seg_rt_seconds = !ram_seg_rt_seconds ; !WRAM_START+$16
ram_seg_rt_minutes = !ram_seg_rt_minutes ; !WRAM_START+$18
ram_reset_segment_later = !ram_reset_segment_later ; !WRAM_START+$1A

ram_ih_controller = !ram_ih_controller ; !WRAM_START+$1C
ram_slowdown_controller_1 = !ram_slowdown_controller_1 ; !WRAM_START+$1E
ram_slowdown_controller_2 = !ram_slowdown_controller_2 ; !WRAM_START+$20
ram_slowdown_frames = !ram_slowdown_frames ; !WRAM_START+$22

ram_momentum_sum = !ram_momentum_sum ; !WRAM_START+$24
ram_momentum_count = !ram_momentum_count ; !WRAM_START+$26
ram_momentum_direction = !ram_momentum_direction ; !WRAM_START+$28
ram_momentum_last = !ram_momentum_last ; !WRAM_START+$2A

ram_last_hp = !ram_last_hp ; !WRAM_START+$2C
ram_reserves_last = !ram_reserves_last ; !WRAM_START+$2E

ram_metronome_counter = !ram_metronome_counter ; !WRAM_START+$30
ram_armed_shine_duration = !ram_armed_shine_duration ; !WRAM_START+$32
ram_auto_save_state = !ram_auto_save_state ; !WRAM_START+$34
ram_vcounter_data = !ram_vcounter_data ; !WRAM_START+$36
ram_custom_preset = !ram_custom_preset ; !WRAM_START+$38

ram_magic_pants_state = !ram_magic_pants_state ; !WRAM_START+$3A
ram_magic_pants_pal1 = !ram_magic_pants_pal1 ; !WRAM_START+$3C
ram_magic_pants_pal2 = !ram_magic_pants_pal2 ; !WRAM_START+$3E
ram_magic_pants_pal3 = !ram_magic_pants_pal3 ; !WRAM_START+$40

ram_room_has_set_rng = !ram_room_has_set_rng ; !WRAM_START+$42
ram_HUD_top = !ram_HUD_top ; !WRAM_START+$44
ram_HUD_middle = !ram_HUD_middle ; !WRAM_START+$46
ram_HUD_check = !ram_HUD_check ; !WRAM_START+$48
ram_roomstrat_counter = !ram_roomstrat_counter ; !WRAM_START+$4A
ram_roomstrat_state = !ram_roomstrat_state ; !WRAM_START+$4C
ram_enemy_hp = !ram_enemy_hp ; !WRAM_START+$4E
ram_mb_hp = !ram_mb_hp ; !WRAM_START+$50
ram_shot_timer = !ram_shot_timer ; !WRAM_START+$52
ram_shine_counter = !ram_shine_counter ; !WRAM_START+$54
ram_dash_counter = !ram_dash_counter ; !WRAM_START+$56

ram_lag_counter = !ram_lag_counter ; !WRAM_START+$58
ram_kraid_adjust_timer = !ram_kraid_adjust_timer ; !WRAM_START+$5A
ram_print_segment_timer = !ram_print_segment_timer ; !WRAM_START+$5C
ram_activated_shine_duration = !ram_activated_shine_duration ; !WRAM_START+$5E
ram_watch_left_hud = !ram_watch_left_hud ; !WRAM_START+$60
ram_watch_right_hud = !ram_watch_right_hud ; !WRAM_START+$62
ram_infidoppler_active = !ram_infidoppler_active ; !WRAM_START+$64

; ^ FREE SPACE ^ up to +$6C

; ----------------------------------------------------------
; A few room strats like shinetune use several variables
; that are not used by other modes,
; but also they do not need many other variables,
; so the following variables share the same WRAM

ram_xpos = !ram_xpos ; !WRAM_START+$6E
ram_ypos = !ram_ypos ; !WRAM_START+$70
ram_subpixel_pos = !ram_subpixel_pos ; !WRAM_START+$72
ram_HUD_top_counter = !ram_HUD_top_counter ; !WRAM_START+$74
ram_HUD_middle_counter = !ram_HUD_middle_counter ; !WRAM_START+$76
ram_quickdrop_counter = !ram_quickdrop_counter ; !WRAM_START+$78
ram_walljump_counter = !ram_walljump_counter ; !WRAM_START+$7A
ram_fail_sum = !ram_fail_sum ; !WRAM_START+$7C
ram_fail_count = !ram_fail_count ; !WRAM_START+$7E

; Kihunter manip
ram_enemy0_last_xpos = !ram_enemy0_last_xpos ; !WRAM_START+$6E
ram_enemy0_last_ypos = !ram_enemy0_last_ypos ; !WRAM_START+$70
ram_enemy4_last_xpos = !ram_enemy4_last_xpos ; !WRAM_START+$72
ram_enemy4_last_ypos = !ram_enemy4_last_ypos ; !WRAM_START+$74
ram_enemy6_last_xpos = !ram_enemy6_last_xpos ; !WRAM_START+$76
ram_enemy6_last_ypos = !ram_enemy6_last_ypos ; !WRAM_START+$78
ram_enemy8_last_xpos = !ram_enemy8_last_xpos ; !WRAM_START+$7A
ram_enemy8_last_ypos = !ram_enemy8_last_ypos ; !WRAM_START+$7C

; Kraid radar (reuses above ram_enemy6 variables)
ram_radar6 = !ram_radar6 ; !WRAM_START+$6E
ram_radar7 = !ram_radar7 ; !WRAM_START+$70
ram_enemy7_last_xpos = !ram_enemy7_last_xpos ; !WRAM_START+$7A
ram_enemy7_last_ypos = !ram_enemy7_last_ypos ; !WRAM_START+$7C

; Shinetune
ram_shine_dash_held_late = !ram_shine_dash_held_late ; !WRAM_START+$6E
ram_shinetune_early_1 = !ram_shinetune_early_1 ; !WRAM_START+$70
ram_shinetune_late_1 = !ram_shinetune_late_1 ; !WRAM_START+$72
ram_shinetune_early_2 = !ram_shinetune_early_2 ; !WRAM_START+$74
ram_shinetune_late_2 = !ram_shinetune_late_2 ; !WRAM_START+$76
ram_shinetune_early_3 = !ram_shinetune_early_3 ; !WRAM_START+$78
ram_shinetune_late_3 = !ram_shinetune_late_3 ; !WRAM_START+$7A
ram_shinetune_early_4 = !ram_shinetune_early_4 ; !WRAM_START+$7C
ram_shinetune_late_4 = !ram_shinetune_late_4 ; !WRAM_START+$7E

; ----------------------------------------------------------
; WRAM variables below this point are PERSISTENT.
; They maintain their value across savestates.
; Use this section for variables such as user settings
; that do not depend on the current game state.

ram_metronome = !ram_metronome ; !WRAM_PERSIST_START+$00
ram_minimap = !ram_minimap ; !WRAM_PERSIST_START+$02

ram_fix_scroll_offsets = !ram_fix_scroll_offsets ; !WRAM_PERSIST_START+$04
ram_random_preset_rng = !ram_random_preset_rng ; !WRAM_PERSIST_START+$06
ram_random_preset_value = !ram_random_preset_value ; !WRAM_PERSIST_START+$08

ram_magic_pants_enabled = !ram_magic_pants_enabled ; !WRAM_PERSIST_START+$0A
ram_space_pants_enabled = !ram_space_pants_enabled ; !WRAM_PERSIST_START+$0C
ram_kraid_claw_rng = !ram_kraid_claw_rng ; !WRAM_PERSIST_START+$0E
ram_kraid_wait_rng = !ram_kraid_wait_rng ; !WRAM_PERSIST_START+$10
ram_botwoon_first = !ram_botwoon_first ; !WRAM_PERSIST_START+$12
ram_botwoon_second = !ram_botwoon_second ; !WRAM_PERSIST_START+$14
ram_botwoon_hidden = !ram_botwoon_hidden ; !WRAM_PERSIST_START+$16
ram_botwoon_spit = !ram_botwoon_spit ; !WRAM_PERSIST_START+$18
ram_botwoon_rng = !ram_botwoon_rng ; !WRAM_PERSIST_START+$1A
ram_crocomire_rng = !ram_crocomire_rng ; !WRAM_PERSIST_START+$1C
ram_phantoon_rng_round_1 = !ram_phantoon_rng_round_1 ; !WRAM_PERSIST_START+$1E
ram_phantoon_rng_round_2 = !ram_phantoon_rng_round_2 ; !WRAM_PERSIST_START+$20
ram_phantoon_rng_inverted = !ram_phantoon_rng_inverted ; !WRAM_PERSIST_START+$22
ram_phantoon_rng_eyeclose = !ram_phantoon_rng_eyeclose ; !WRAM_PERSIST_START+$24
ram_phantoon_rng_flames = !ram_phantoon_rng_flames ; !WRAM_PERSIST_START+$26
ram_phantoon_rng_next_flames = !ram_phantoon_rng_next_flames ; !WRAM_PERSIST_START+$28
ram_phantoon_flame_direction = !ram_phantoon_flame_direction ; !WRAM_PERSIST_START+$2A
ram_draygon_rng_left = !ram_draygon_rng_left ; !WRAM_PERSIST_START+$2C
ram_draygon_rng_right = !ram_draygon_rng_right ; !WRAM_PERSIST_START+$2E

ram_suits_enemy_damage_check = !ram_suits_enemy_damage_check ; !WRAM_PERSIST_START+$30
ram_suits_heat_damage_check = !ram_suits_heat_damage_check ; !WRAM_PERSIST_START+$32
ram_pacifist = !ram_pacifist ; !WRAM_PERSIST_START+$34
ram_freeze_on_load = !ram_freeze_on_load ; !WRAM_PERSIST_START+$36

ram_spacetime_infohud = !ram_spacetime_infohud ; !WRAM_PERSIST_START+$38
ram_watch_left_index = !ram_watch_left_index ; !WRAM_PERSIST_START+$3A
ram_watch_right_index = !ram_watch_right_index ; !WRAM_PERSIST_START+$3C
ram_watch_write_mode = !ram_watch_write_mode ; !WRAM_PERSIST_START+$3E
ram_watch_bank = !ram_watch_bank ; !WRAM_PERSIST_START+$40
ram_watch_left = !ram_watch_left ; !WRAM_PERSIST_START+$42
ram_watch_right = !ram_watch_right ; !WRAM_PERSIST_START+$44
ram_watch_edit_left = !ram_watch_edit_left ; !WRAM_PERSIST_START+$46
ram_watch_edit_right = !ram_watch_edit_right ; !WRAM_PERSIST_START+$48
ram_watch_edit_lock_left = !ram_watch_edit_lock_left ; !WRAM_PERSIST_START+$4A
ram_watch_edit_lock_right = !ram_watch_edit_lock_right ; !WRAM_PERSIST_START+$4C

ram_game_loop_extras = !ram_game_loop_extras ; !WRAM_PERSIST_START+$4E
ram_infinite_ammo = !ram_infinite_ammo ; !WRAM_PERSIST_START+$50
ram_suits_heat_damage_value = !ram_suits_heat_damage_value ; !WRAM_PERSIST_START+$52
ram_sprite_feature_flags = !ram_sprite_feature_flags ; !WRAM_PERSIST_START+$54
ram_door_portal_flags = !ram_door_portal_flags ; !WRAM_PERSIST_START+$56
ram_door_source = !ram_door_source ; !WRAM_PERSIST_START+$58
ram_door_destination = !ram_door_destination ; !WRAM_PERSIST_START+$5A
ram_itempickups_all = !ram_itempickups_all ; !WRAM_PERSIST_START+$5C
ram_itempickups_visible = !ram_itempickups_visible ; !WRAM_PERSIST_START+$5E
ram_itempickups_chozo = !ram_itempickups_chozo ; !WRAM_PERSIST_START+$60
ram_itempickups_hidden = !ram_itempickups_hidden ; !WRAM_PERSIST_START+$62
ram_frames_held = !ram_frames_held ; !WRAM_PERSIST_START+$64
ram_baby_rng = !ram_baby_rng ; !WRAM_PERSIST_START+$66
ram_turret_rng = !ram_turret_rng ; !WRAM_PERSIST_START+$68

ram_quickboot_spc_state = !ram_quickboot_spc_state ; !WRAM_PERSIST_START+$6A
ram_display_backup = !ram_display_backup ; !WRAM_PERSIST_START+$6C
ram_phantoon_always_visible = !ram_phantoon_always_visible ; !WRAM_PERSIST_START+$6E
ram_loadstate_rando_enable = !ram_loadstate_rando_enable ; !WRAM_PERSIST_START+$70

; ^ FREE SPACE ^ up to +$7C (!WRAM_START+$FC - !WRAM_PERSIST_START)

; -----------------------
; RAM (Bank 7E required)
; -----------------------

ram_slowdown_mode = !ram_slowdown_mode ; $7EFDFE

; ---------
; RAM Menu
; ---------

ram_cm_menu_stack = !ram_cm_menu_stack ; !WRAM_MENU_START+$00         ; 16 bytes
ram_cm_cursor_stack = !ram_cm_cursor_stack ; !WRAM_MENU_START+$10       ; 16 bytes

ram_cm_cursor_max = !ram_cm_cursor_max ; !WRAM_MENU_START+$20
ram_cm_input_timer = !ram_cm_input_timer ; !WRAM_MENU_START+$22
ram_cm_controller = !ram_cm_controller ; !WRAM_MENU_START+$24
ram_cm_menu_bank = !ram_cm_menu_bank ; !WRAM_MENU_START+$26
ram_cm_horizontal_cursor = !ram_cm_horizontal_cursor ; !WRAM_MENU_START+$28

ram_cm_leave = !ram_cm_leave ; !WRAM_MENU_START+$2A
ram_cm_input_counter = !ram_cm_input_counter ; !WRAM_MENU_START+$2C
ram_cm_last_nmi_counter = !ram_cm_last_nmi_counter ; !WRAM_MENU_START+$2E
ram_cm_ctrl_mode = !ram_cm_ctrl_mode ; !WRAM_MENU_START+$30
ram_cm_custom_preset_labels = !ram_cm_custom_preset_labels ; !WRAM_MENU_START+$32

ram_cm_slowdown_mode = !ram_cm_slowdown_mode ; !WRAM_MENU_START+$34
ram_cm_slowdown_frames = !ram_cm_slowdown_frames ; !WRAM_MENU_START+$36

ram_seed_X = !ram_seed_X ; !WRAM_MENU_START+$38
ram_seed_Y = !ram_seed_Y ; !WRAM_MENU_START+$3A

ram_cm_fast_scroll_menu_selection = !ram_cm_fast_scroll_menu_selection ; !WRAM_MENU_START+$3C
ram_cm_suit_properties = !ram_cm_suit_properties ; !WRAM_MENU_START+$3E

ram_cm_palette_border = !ram_cm_palette_border ; !WRAM_MENU_START+$40
ram_cm_palette_headeroutline = !ram_cm_palette_headeroutline ; !WRAM_MENU_START+$42
ram_cm_palette_text = !ram_cm_palette_text ; !WRAM_MENU_START+$44
ram_cm_palette_background = !ram_cm_palette_background ; !WRAM_MENU_START+$46
ram_cm_palette_numoutline = !ram_cm_palette_numoutline ; !WRAM_MENU_START+$48
ram_cm_palette_numfill = !ram_cm_palette_numfill ; !WRAM_MENU_START+$4A
ram_cm_palette_toggleon = !ram_cm_palette_toggleon ; !WRAM_MENU_START+$4C
ram_cm_palette_seltext = !ram_cm_palette_seltext ; !WRAM_MENU_START+$4E
ram_cm_palette_seltextbg = !ram_cm_palette_seltextbg ; !WRAM_MENU_START+$50
ram_cm_palette_numseloutline = !ram_cm_palette_numseloutline ; !WRAM_MENU_START+$52
ram_cm_palette_numsel = !ram_cm_palette_numsel ; !WRAM_MENU_START+$54

ram_cm_sfxlib1 = !ram_cm_sfxlib1 ; !WRAM_MENU_START+$56
ram_cm_sfxlib2 = !ram_cm_sfxlib2 ; !WRAM_MENU_START+$58
ram_cm_sfxlib3 = !ram_cm_sfxlib3 ; !WRAM_MENU_START+$5A

ram_sram_detection = !ram_sram_detection ; !WRAM_MENU_START+$5C

ram_timers_autoupdate = !ram_timers_autoupdate ; !WRAM_MENU_START+$5E
ram_cm_gmode = !ram_cm_gmode ; !WRAM_MENU_START+$60

ram_cm_botwoon_rng = !ram_cm_botwoon_rng ; !WRAM_MENU_START+$62
ram_cm_botwoon_first = !ram_cm_botwoon_first ; !WRAM_MENU_START+$64
ram_cm_botwoon_hidden = !ram_cm_botwoon_hidden ; !WRAM_MENU_START+$66
ram_cm_botwoon_second = !ram_cm_botwoon_second ; !WRAM_MENU_START+$68
ram_cm_botwoon_spit = !ram_cm_botwoon_spit ; !WRAM_MENU_START+$68

; ^ FREE SPACE ^ up to +$86

ram_cm_preserved_timers = !ram_cm_preserved_timers ; !WRAM_MENU_START+$88 ; 8 bytes

; ------------------
; Reusable RAM Menu
; ------------------

; The following RAM may be used multiple times,
; as long as it isn't used multiple times on the same menu page

ram_cm_watch_enemy_property = !ram_cm_watch_enemy_property ; !WRAM_MENU_START+$90
ram_cm_watch_enemy_index = !ram_cm_watch_enemy_index ; !WRAM_MENU_START+$92
ram_cm_watch_enemy_side = !ram_cm_watch_enemy_side ; !WRAM_MENU_START+$94
ram_cm_watch_common_address = !ram_cm_watch_common_address ; !WRAM_MENU_START+$96

ram_cm_preset_elevator = !ram_cm_preset_elevator ; !WRAM_MENU_START+$90

ram_cm_door_dynamic = !ram_cm_door_dynamic ; !WRAM_MENU_START+$90
ram_cm_door_menu_value = !ram_cm_door_menu_value ; !WRAM_MENU_START+$92
ram_cm_door_menu_bank = !ram_cm_door_menu_bank ; !WRAM_MENU_START+$94
ram_cm_door_direction_index = !ram_cm_door_direction_index ; !WRAM_MENU_START+$96
ram_cm_itempickups_visible = !ram_cm_itempickups_visible ; !WRAM_MENU_START+$98
ram_cm_itempickups_chozo = !ram_cm_itempickups_chozo ; !WRAM_MENU_START+$9A
ram_cm_itempickups_hidden = !ram_cm_itempickups_hidden ; !WRAM_MENU_START+$9C

ram_cm_phan_first_phase = !ram_cm_phan_first_phase ; !WRAM_MENU_START+$90
ram_cm_phan_second_phase = !ram_cm_phan_second_phase ; !WRAM_MENU_START+$92
ram_cm_turret_rng = !ram_cm_turret_rng ; !WRAM_MENU_START+$94

ram_cm_varia = !ram_cm_varia ; !WRAM_MENU_START+$90
ram_cm_gravity = !ram_cm_gravity ; !WRAM_MENU_START+$92
ram_cm_morph = !ram_cm_morph ; !WRAM_MENU_START+$94
ram_cm_bombs = !ram_cm_bombs ; !WRAM_MENU_START+$96
ram_cm_spring = !ram_cm_spring ; !WRAM_MENU_START+$98
ram_cm_screw = !ram_cm_screw ; !WRAM_MENU_START+$9A
ram_cm_hijump = !ram_cm_hijump ; !WRAM_MENU_START+$9C
ram_cm_space = !ram_cm_space ; !WRAM_MENU_START+$9E
ram_cm_speed = !ram_cm_speed ; !WRAM_MENU_START+$A0
ram_cm_charge = !ram_cm_charge ; !WRAM_MENU_START+$A2
ram_cm_ice = !ram_cm_ice ; !WRAM_MENU_START+$A4
ram_cm_wave = !ram_cm_wave ; !WRAM_MENU_START+$A6
ram_cm_spazer = !ram_cm_spazer ; !WRAM_MENU_START+$A8
ram_cm_plasma = !ram_cm_plasma ; !WRAM_MENU_START+$AA
ram_cm_etanks = !ram_cm_etanks ; !WRAM_MENU_START+$AC
ram_cm_reserve = !ram_cm_reserve ; !WRAM_MENU_START+$AE

ram_cm_zeb1 = !ram_cm_zeb1 ; !WRAM_MENU_START+$90
ram_cm_zeb2 = !ram_cm_zeb2 ; !WRAM_MENU_START+$92
ram_cm_zeb3 = !ram_cm_zeb3 ; !WRAM_MENU_START+$94
ram_cm_zeb4 = !ram_cm_zeb4 ; !WRAM_MENU_START+$96
ram_cm_zebmask = !ram_cm_zebmask ; !WRAM_MENU_START+$98

ram_cm_custompalette_blue = !ram_cm_custompalette_blue ; !WRAM_MENU_START+$90
ram_cm_custompalette_green = !ram_cm_custompalette_green ; !WRAM_MENU_START+$92
ram_cm_custompalette_red = !ram_cm_custompalette_red ; !WRAM_MENU_START+$94
ram_cm_custompalette = !ram_cm_custompalette ; !WRAM_MENU_START+$96
ram_cm_dummy_on = !ram_cm_dummy_on ; !WRAM_MENU_START+$9A
ram_cm_dummy_off = !ram_cm_dummy_off ; !WRAM_MENU_START+$9C
ram_cm_dummy_num = !ram_cm_dummy_num ; !WRAM_MENU_START+$9E

ram_cm_ceres_seconds = !ram_cm_ceres_seconds ; !WRAM_MENU_START+$90
ram_cm_zebes_seconds = !ram_cm_zebes_seconds ; !WRAM_MENU_START+$92

ram_cm_ctrl_add_shortcut_slot = !ram_cm_ctrl_add_shortcut_slot ; !WRAM_MENU_START+$90
ram_cm_ctrl_last_pri = !ram_cm_ctrl_last_pri ; !WRAM_MENU_START+$92
ram_cm_ctrl_last_sec = !ram_cm_ctrl_last_sec ; !WRAM_MENU_START+$94
ram_cm_ctrl_assign = !ram_cm_ctrl_assign ; !WRAM_MENU_START+$96
ram_cm_ctrl_swap = !ram_cm_ctrl_swap ; !WRAM_MENU_START+$98
ram_cm_ctrl_timer = !ram_cm_ctrl_timer ; !WRAM_MENU_START+$9A
ram_cm_ctrl_savestates_allowed = !ram_cm_ctrl_savestates_allowed ; !WRAM_MENU_START+$9C

ram_cm_crop_mode = !ram_cm_crop_mode ; !WRAM_MENU_START+$90
ram_cm_crop_tile = !ram_cm_crop_tile ; !WRAM_MENU_START+$92

ram_cm_brb = !ram_cm_brb ; !WRAM_MENU_START+$90
ram_cm_brb_timer = !ram_cm_brb_timer ; !WRAM_MENU_START+$92
ram_cm_brb_frames = !ram_cm_brb_frames ; !WRAM_MENU_START+$94
ram_cm_brb_secs = !ram_cm_brb_secs ; !WRAM_MENU_START+$96
ram_cm_brb_mins = !ram_cm_brb_mins ; !WRAM_MENU_START+$98
ram_cm_brb_screen = !ram_cm_brb_screen ; !WRAM_MENU_START+$9A
ram_cm_brb_timer_mode = !ram_cm_brb_timer_mode ; !WRAM_MENU_START+$9C
ram_cm_brb_scroll = !ram_cm_brb_scroll ; !WRAM_MENU_START+$9E
ram_cm_brb_scroll_X = !ram_cm_brb_scroll_X ; !WRAM_MENU_START+$A0
ram_cm_brb_scroll_Y = !ram_cm_brb_scroll_Y ; !WRAM_MENU_START+$A2
ram_cm_brb_scroll_H = !ram_cm_brb_scroll_H ; !WRAM_MENU_START+$A4
ram_cm_brb_scroll_V = !ram_cm_brb_scroll_V ; !WRAM_MENU_START+$A6
ram_cm_brb_scroll_timer = !ram_cm_brb_scroll_timer ; !WRAM_MENU_START+$A8
ram_cm_brb_palette = !ram_cm_brb_palette ; !WRAM_MENU_START+$AA
ram_cm_brb_set_cycle = !ram_cm_brb_set_cycle ; !WRAM_MENU_START+$AC
ram_cm_brb_cycle_time = !ram_cm_brb_cycle_time ; !WRAM_MENU_START+$AE

ram_cm_keyboard_buffer = !ram_cm_keyboard_buffer ; !WRAM_MENU_START+$90 ; $18 bytes

ram_cm_manage_slots = !ram_cm_manage_slots ; !WRAM_MENU_START+$90
ram_cm_selected_slot = !ram_cm_selected_slot ; !WRAM_MENU_START+$92

; ^ FREE SPACE ^ up to +$CE
; Note: +$B8 to +$CE range also used as frames held counters
;       and is reset to zero when loading a savestate

; Reserve 48 bytes for CGRAM cache
; Currently first 28 bytes plus last 2 bytes are used
ram_cgram_cache = !ram_cgram_cache ; !WRAM_MENU_START+$D0 ; $30 bytes

; -----------------
; Crash Handler RAM
; -----------------

ram_crash_a = !ram_crash_a ; !CRASHDUMP
ram_crash_x = !ram_crash_x ; !CRASHDUMP+$02
ram_crash_y = !ram_crash_y ; !CRASHDUMP+$04
ram_crash_dbp = !ram_crash_dbp ; !CRASHDUMP+$06
ram_crash_sp = !ram_crash_sp ; !CRASHDUMP+$08
ram_crash_type = !ram_crash_type ; !CRASHDUMP+$0A
ram_crash_draw_value = !ram_crash_draw_value ; !CRASHDUMP+$0C
ram_crash_stack_size = !ram_crash_stack_size ; !CRASHDUMP+$0E

; Reserve 48 bytes for stack
ram_crash_stack = !ram_crash_stack ; !CRASHDUMP+$10

ram_crash_page = !ram_crash_page ; !CRASHDUMP+$40
ram_crash_palette = !ram_crash_palette ; !CRASHDUMP+$42
ram_crash_bg = !ram_crash_bg ; !CRASHDUMP+$44
ram_crash_cursor = !ram_crash_cursor ; !CRASHDUMP+$46
ram_crash_loop_counter = !ram_crash_loop_counter ; !CRASHDUMP+$48
ram_crash_bytes_to_write = !ram_crash_bytes_to_write ; !CRASHDUMP+$4A
ram_crash_stack_line_position = !ram_crash_stack_line_position ; !CRASHDUMP+$4C
ram_crash_text = !ram_crash_text ; !CRASHDUMP+$4E
ram_crash_text_bank = !ram_crash_text_bank ; !CRASHDUMP+$50
ram_crash_text_palette = !ram_crash_text_palette ; !CRASHDUMP+$52
ram_crash_mem_viewer = !ram_crash_mem_viewer ; !CRASHDUMP+$54
ram_crash_mem_viewer_bank = !ram_crash_mem_viewer_bank ; !CRASHDUMP+$56
ram_crash_temp = !ram_crash_temp ; !CRASHDUMP+$58

ram_crash_input = !ram_crash_input ; !CRASHDUMP+$60
ram_crash_input_new = !ram_crash_input_new ; !CRASHDUMP+$62
ram_crash_input_prev = !ram_crash_input_prev ; !CRASHDUMP+$64
ram_crash_input_timer = !ram_crash_input_timer ; !CRASHDUMP+$66

; -----------
; Bank 7F RAM
; -----------

; NOTE: Be careful with using Bank 7F RAM,
;       since the game may not clean this RAM up
;       and the out of bounds blocks depend on this RAM,
;       so if we make a mess not cleaned up by the vanilla game
;       then we won't be accurate to the vanilla game anymore

; Temporary stack written here since level data will be initialized afterwards

; Phantoon infidoppler can use the next $200 of RAM,
; since the room outside phantoon's room is larger and will overwrite this data,
; so the only way this could have some impact is you went OOB
; either from Phantoon's room or after teleporting to another single scroll room,
; and then fell a long ways out of bounds

; An array of 5 words, one per projectile, representing
; the distance Samus travelled horizontally before firing.
; The low byte of each word is integer pixels,
; and the high byte is fractional pixels.
; Yes, that sounds weird, but the math is a little easier.
ram_infidoppler_offsets = !ram_infidoppler_offsets ; !END_OF_SINGLE_SCROLL_ROOM_LEVEL_DATA ; array of 5 words
ram_infidoppler_x = !ram_infidoppler_x ; !END_OF_SINGLE_SCROLL_ROOM_LEVEL_DATA+$10
ram_infidoppler_subx = !ram_infidoppler_subx ; !END_OF_SINGLE_SCROLL_ROOM_LEVEL_DATA+$12
ram_infidoppler_y = !ram_infidoppler_y ; !END_OF_SINGLE_SCROLL_ROOM_LEVEL_DATA+$14
ram_infidoppler_suby = !ram_infidoppler_suby ; !END_OF_SINGLE_SCROLL_ROOM_LEVEL_DATA+$16

; Do not use RAM for variables at or beyond this point

; -----
; SRAM
; -----

sram_initialized = !sram_initialized ; !SRAM_START+$00
sram_ctrl_shortcut_selections = !sram_ctrl_shortcut_selections ; !SRAM_START+$02 ; 30 bytes
; More ctrl shortcut selections starting at $EE

sram_artificial_lag = !sram_artificial_lag ; !SRAM_START+$20
sram_rerandomize = !sram_rerandomize ; !SRAM_START+$22
sram_fanfare = !sram_fanfare ; !SRAM_START+$24
sram_frame_counter_mode = !sram_frame_counter_mode ; !SRAM_START+$26
sram_display_mode = !sram_display_mode ; !SRAM_START+$28
sram_music_toggle = !sram_music_toggle ; !SRAM_START+$2A
sram_last_preset = !sram_last_preset ; !SRAM_START+$2C
sram_save_has_set_rng = !sram_save_has_set_rng ; !SRAM_START+$2E
sram_preset_category = !sram_preset_category ; !SRAM_START+$30
sram_custom_preset_slot = !sram_custom_preset_slot ; !SRAM_START+$32
sram_room_strat = !sram_room_strat ; !SRAM_START+$34
sram_sprite_prio_flag = !sram_sprite_prio_flag ; !SRAM_START+$36
sram_metronome_tickrate = !sram_metronome_tickrate ; !SRAM_START+$38
sram_metronome_sfx = !sram_metronome_sfx ; !SRAM_START+$3A
sram_status_icons = !sram_status_icons ; !SRAM_START+$3C
sram_suit_properties = !sram_suit_properties ; !SRAM_START+$3E
sram_top_display_mode = !sram_top_display_mode ; !SRAM_START+$40
sram_healthalarm = !sram_healthalarm ; !SRAM_START+$42
sram_room_layout = !sram_room_layout ; !SRAM_START+$44
sram_cutscenes = !sram_cutscenes ; !SRAM_START+$46
sram_preset_options = !sram_preset_options ; !SRAM_START+$48
sram_lag_counter_mode = !sram_lag_counter_mode ; !SRAM_START+$4A

sram_fast_doors = !sram_fast_doors ; !SRAM_START+$4C
sram_suppress_flashing = !sram_suppress_flashing ; !SRAM_START+$4E
sram_fast_elevators = !sram_fast_elevators ; !SRAM_START+$50
sram_custom_damage = !sram_custom_damage ; !SRAM_START+$52
sram_custom_charge_damage = !sram_custom_charge_damage ; !SRAM_START+$54
sram_custom_uncharge_damage = !sram_custom_uncharge_damage ; !SRAM_START+$56
sram_water_physics = !sram_water_physics ; !SRAM_START+$58
sram_double_jump = !sram_double_jump ; !SRAM_START+$5A

; do not change order without updating custom palette profiles in customizemenu.asm
sram_palette_border = !sram_palette_border ; !SRAM_START+$5C
sram_palette_headeroutline = !sram_palette_headeroutline ; !SRAM_START+$5E
sram_palette_text = !sram_palette_text ; !SRAM_START+$60
sram_palette_numoutline = !sram_palette_numoutline ; !SRAM_START+$62
sram_palette_numfill = !sram_palette_numfill ; !SRAM_START+$64
sram_palette_toggleon = !sram_palette_toggleon ; !SRAM_START+$66
sram_palette_seltext = !sram_palette_seltext ; !SRAM_START+$68
sram_palette_seltextbg = !sram_palette_seltextbg ; !SRAM_START+$6A
sram_palette_background = !sram_palette_background ; !SRAM_START+$6C
sram_palette_numseloutline = !sram_palette_numseloutline ; !SRAM_START+$6E
sram_palette_numsel = !sram_palette_numsel ; !SRAM_START+$70
sram_custompalette_profile = !sram_custompalette_profile ; !SRAM_START+$72
sram_menu_background = !sram_menu_background ; !SRAM_START+$74
sram_cm_scroll_delay = !sram_cm_scroll_delay ; !SRAM_START+$76
sram_customsfx_move = !sram_customsfx_move ; !SRAM_START+$78
sram_customsfx_toggle = !sram_customsfx_toggle ; !SRAM_START+$7A
sram_customsfx_number = !sram_customsfx_number ; !SRAM_START+$7C
sram_customsfx_confirm = !sram_customsfx_confirm ; !SRAM_START+$7E
sram_customsfx_goback = !sram_customsfx_goback ; !SRAM_START+$80

sram_seed_X = !sram_seed_X ; !SRAM_START+$82
sram_seed_Y = !sram_seed_Y ; !SRAM_START+$84
sram_bomb_torizo_door = !sram_bomb_torizo_door ; !SRAM_START+$86
sram_door_display_mode = !sram_door_display_mode ; !SRAM_START+$88
sram_cm_fast_scroll_button = !sram_cm_fast_scroll_button ; !SRAM_START+$8A
sram_cm_font = !sram_cm_font ; !SRAM_START+$8C
sram_spin_lock = !sram_spin_lock ; !SRAM_START+$8E
sram_map_grid_alignment = !sram_map_grid_alignment ; !SRAM_START+$90
sram_number_gfx_choice = !sram_number_gfx_choice ; !SRAM_START+$92
sram_superhud_bottom = !sram_superhud_bottom ; !SRAM_START+$94
sram_superhud_middle = !sram_superhud_middle ; !SRAM_START+$96
sram_superhud_top = !sram_superhud_top ; !SRAM_START+$98
sram_infidoppler_enabled = !sram_infidoppler_enabled ; !SRAM_START+$9A
sram_random_bubble_sfx = !sram_random_bubble_sfx ; !SRAM_START+$9C
sram_demo_timer = !sram_demo_timer ; !SRAM_START+$9E
sram_ceres_timer = !sram_ceres_timer ; !SRAM_START+$A0
sram_zebes_timer = !sram_zebes_timer ; !SRAM_START+$A2

; ^ FREE SPACE ^ up to +$EC

; This is a continuation of sram_ctrl_shortcut_selections
sram_ctrl_additional_selections = !sram_ctrl_additional_selections ; !SRAM_START+$D0 ; 18 bytes starting from +$EE

sram_presetequiprando = !sram_presetequiprando ; !SRAM_START+$100
sram_presetequiprando_beampref = !sram_presetequiprando_beampref ; !SRAM_START+$102
sram_presetequiprando_max_etanks = !sram_presetequiprando_max_etanks ; !SRAM_START+$104
sram_presetequiprando_max_reserves = !sram_presetequiprando_max_reserves ; !SRAM_START+$106
sram_presetequiprando_max_missiles = !sram_presetequiprando_max_missiles ; !SRAM_START+$108
sram_presetequiprando_max_supers = !sram_presetequiprando_max_supers ; !SRAM_START+$10A
sram_presetequiprando_max_pbs = !sram_presetequiprando_max_pbs ; !SRAM_START+$10C
sram_display_mode_reward = !sram_display_mode_reward ; !SRAM_START+$10E
sram_loadstate_rando_energy = !sram_loadstate_rando_energy ; !SRAM_START+$110
sram_loadstate_rando_reserves = !sram_loadstate_rando_reserves ; !SRAM_START+$112
sram_loadstate_rando_missiles = !sram_loadstate_rando_missiles ; !SRAM_START+$114
sram_loadstate_rando_supers = !sram_loadstate_rando_supers ; !SRAM_START+$116
sram_loadstate_rando_powerbombs = !sram_loadstate_rando_powerbombs ; !SRAM_START+$118

; ^ FREE SPACE ^ up to +$13E

sram_ctrl_1_shortcut_inputs = !sram_ctrl_1_shortcut_inputs ; !SRAM_START+$140 ; 96 bytes
sram_ctrl_2_shortcut_inputs = !sram_ctrl_2_shortcut_inputs ; !SRAM_START+$1A0 ; 96 bytes

; ^ FREE SPACE ^ up to +$BA6

sram_custom_header_normal = !sram_custom_header_normal ; !SRAM_START+$BA8 ; $18 bytes
sram_custom_preset_safewords_normal = !sram_custom_preset_safewords_normal ; !SRAM_START+$BC0 ; $50 bytes
sram_custom_preset_names_normal = !sram_custom_preset_names_normal ; !SRAM_START+$C10 ; $3C0 bytes

sram_custom_header_tinystates = !sram_custom_header_tinystates ; !SRAM_START+$E18 ; $18 bytes
sram_custom_preset_safewords_tinystates = !sram_custom_preset_safewords_tinystates ; !SRAM_START+$E30 ; $20 bytes
sram_custom_preset_names_tinystates = !sram_custom_preset_names_tinystates ; !SRAM_START+$E50 ; $180 bytes

; SM specific things

; ^ FREE SPACE ^ up to +$FFE

; --------------
