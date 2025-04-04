PresetsMenuNintendopower:
    dw #presets_goto_nintendopower_crateria
    dw #presets_goto_nintendopower_spore_spawn
    dw #presets_goto_nintendopower_shopping_with_power
    dw #presets_goto_nintendopower_wrecked_ship
    dw #presets_goto_nintendopower_maridia
    dw #presets_goto_nintendopower_norfair
    dw #presets_goto_nintendopower_tourian
    dw #$0000
    %cm_header("PRESETS FOR NINTENDO POWER")

presets_goto_nintendopower_crateria:
    %cm_submenu("Crateria", #presets_submenu_nintendopower_crateria)

presets_goto_nintendopower_spore_spawn:
    %cm_submenu("Spore Spawn", #presets_submenu_nintendopower_spore_spawn)

presets_goto_nintendopower_shopping_with_power:
    %cm_submenu("Shopping With Power", #presets_submenu_nintendopower_shopping_with_power)

presets_goto_nintendopower_wrecked_ship:
    %cm_submenu("Wrecked Ship", #presets_submenu_nintendopower_wrecked_ship)

presets_goto_nintendopower_maridia:
    %cm_submenu("Maridia", #presets_submenu_nintendopower_maridia)

presets_goto_nintendopower_norfair:
    %cm_submenu("Norfair", #presets_submenu_nintendopower_norfair)

presets_goto_nintendopower_tourian:
    %cm_submenu("Tourian", #presets_submenu_nintendopower_tourian)

presets_submenu_nintendopower_crateria:
    dw #presets_nintendopower_crateria_ceres_elevator
    dw #presets_nintendopower_crateria_ceres_escape
    dw #presets_nintendopower_crateria_ceres_last_3_rooms
    dw #presets_nintendopower_crateria_ship
    dw #presets_nintendopower_crateria_parlor
    dw #presets_nintendopower_crateria_parlor_downback
    dw #presets_nintendopower_crateria_climb_down
    dw #presets_nintendopower_crateria_pit_room
    dw #presets_nintendopower_crateria_morph
    dw #presets_nintendopower_crateria_construction_zone_down
    dw #presets_nintendopower_crateria_construction_zone_up
    dw #presets_nintendopower_crateria_pit_room_revisit
    dw #presets_nintendopower_crateria_climb_up
    dw #presets_nintendopower_crateria_parlor_revisit
    dw #presets_nintendopower_crateria_flyway
    dw #presets_nintendopower_crateria_bomb_torizo
    dw #presets_nintendopower_crateria_alcatraz
    dw #presets_nintendopower_crateria_terminator
    dw #presets_nintendopower_crateria_green_pirate_shaft
    dw #$0000
    %cm_header("CRATERIA")

presets_submenu_nintendopower_spore_spawn:
    dw #presets_nintendopower_spore_spawn_green_brinstar_elevator
    dw #presets_nintendopower_spore_spawn_big_pink
    dw #presets_nintendopower_spore_spawn_spore_spawn
    dw #presets_nintendopower_spore_spawn_spore_fall
    dw #presets_nintendopower_spore_spawn_red_tower
    dw #$0000
    %cm_header("SPORE SPAWN")

presets_submenu_nintendopower_shopping_with_power:
    dw #presets_nintendopower_shopping_with_power_hi_jump_first
    dw #presets_nintendopower_shopping_with_power_kraid_warehouse
    dw #presets_nintendopower_shopping_with_power_kraid_fight
    dw #presets_nintendopower_shopping_with_power_rising_tide
    dw #presets_nintendopower_shopping_with_power_reserve_tank
    dw #presets_nintendopower_shopping_with_power_ice_beam
    dw #presets_nintendopower_shopping_with_power_ice_escape
    dw #presets_nintendopower_shopping_with_power_shinespark_to_power_bombs
    dw #presets_nintendopower_shopping_with_power_heading_to_croc
    dw #presets_nintendopower_shopping_with_power_crocomire
    dw #presets_nintendopower_shopping_with_power_grapple_beam
    dw #presets_nintendopower_shopping_with_power_exit_grapple_beam
    dw #presets_nintendopower_shopping_with_power_power_bombs_post_croc
    dw #presets_nintendopower_shopping_with_power_red_pirate_shaft
    dw #presets_nintendopower_shopping_with_power_bubble_mountain
    dw #presets_nintendopower_shopping_with_power_wave_beam
    dw #presets_nintendopower_shopping_with_power_heading_to_xray
    dw #presets_nintendopower_shopping_with_power_xray_entry
    dw #presets_nintendopower_shopping_with_power_xray_beam
    dw #presets_nintendopower_shopping_with_power_xray_exit
    dw #$0000
    %cm_header("SHOPPING WITH POWER")

presets_submenu_nintendopower_wrecked_ship:
    dw #presets_nintendopower_wrecked_ship_red_brinstar_elevator
    dw #presets_nintendopower_wrecked_ship_moat_missiles
    dw #presets_nintendopower_wrecked_ship_shinespark_to_phantoon
    dw #presets_nintendopower_wrecked_ship_phantoon
    dw #presets_nintendopower_wrecked_ship_movement_before_attic
    dw #presets_nintendopower_wrecked_ship_attic
    dw #presets_nintendopower_wrecked_ship_bowling_alley
    dw #presets_nintendopower_wrecked_ship_gravity_suit_room
    dw #presets_nintendopower_wrecked_ship_heading_to_maridia
    dw #$0000
    %cm_header("WRECKED SHIP")

presets_submenu_nintendopower_maridia:
    dw #presets_nintendopower_maridia_mainstreet
    dw #presets_nintendopower_maridia_pants_room
    dw #presets_nintendopower_maridia_east_pants_room
    dw #presets_nintendopower_maridia_super_door
    dw #presets_nintendopower_maridia_fish_tank
    dw #presets_nintendopower_maridia_mama_turtle
    dw #presets_nintendopower_maridia_crab_supers
    dw #presets_nintendopower_maridia_aqueduct
    dw #presets_nintendopower_maridia_botwoon
    dw #presets_nintendopower_maridia_full_halfie
    dw #presets_nintendopower_maridia_draygon
    dw #presets_nintendopower_maridia_heading_to_plasma
    dw #presets_nintendopower_maridia_plasma_beam
    dw #presets_nintendopower_maridia_long_tube
    dw #$0000
    %cm_header("MARIDIA")

presets_submenu_nintendopower_norfair:
    dw #presets_nintendopower_norfair_pre_gt_fight
    dw #presets_nintendopower_norfair_elevator_menu
    dw #presets_nintendopower_norfair_golden_torizo
    dw #presets_nintendopower_norfair_on_route_to_ridley
    dw #presets_nintendopower_norfair_worst_room_in_the_game
    dw #presets_nintendopower_norfair_metal_ninja_pirates
    dw #presets_nintendopower_norfair_ridley
    dw #presets_nintendopower_norfair_escape_from_ridley
    dw #presets_nintendopower_norfair_landing_site
    dw #$0000
    %cm_header("NORFAIR")

presets_submenu_nintendopower_tourian:
    dw #presets_nintendopower_tourian_metroids_1
    dw #presets_nintendopower_tourian_metroids_2
    dw #presets_nintendopower_tourian_metroids_3
    dw #presets_nintendopower_tourian_metroids_4
    dw #presets_nintendopower_tourian_baby_skip
    dw #presets_nintendopower_tourian_zeb_skip
    dw #presets_nintendopower_tourian_mother_brain_2
    dw #presets_nintendopower_tourian_zebes_escape
    dw #presets_nintendopower_tourian_escape_room_3
    dw #presets_nintendopower_tourian_escape_room_4
    dw #presets_nintendopower_tourian_escape_climb
    dw #presets_nintendopower_tourian_escape_parlor
    dw #$0000
    %cm_header("TOURIAN")

; Crateria
presets_nintendopower_crateria_ceres_elevator:
    %cm_preset("Ceres Elevator", #preset_nintendopower_crateria_ceres_elevator)

presets_nintendopower_crateria_ceres_escape:
    %cm_preset("Ceres Escape", #preset_nintendopower_crateria_ceres_escape)

presets_nintendopower_crateria_ceres_last_3_rooms:
    %cm_preset("Ceres Last 3 Rooms", #preset_nintendopower_crateria_ceres_last_3_rooms)

presets_nintendopower_crateria_ship:
    %cm_preset("Ship", #preset_nintendopower_crateria_ship)

presets_nintendopower_crateria_parlor:
    %cm_preset("Parlor", #preset_nintendopower_crateria_parlor)

presets_nintendopower_crateria_parlor_downback:
    %cm_preset("Parlor Downback", #preset_nintendopower_crateria_parlor_downback)

presets_nintendopower_crateria_climb_down:
    %cm_preset("Climb Down", #preset_nintendopower_crateria_climb_down)

presets_nintendopower_crateria_pit_room:
    %cm_preset("Pit Room", #preset_nintendopower_crateria_pit_room)

presets_nintendopower_crateria_morph:
    %cm_preset("Morph", #preset_nintendopower_crateria_morph)

presets_nintendopower_crateria_construction_zone_down:
    %cm_preset("Construction Zone Down", #preset_nintendopower_crateria_construction_zone_down)

presets_nintendopower_crateria_construction_zone_up:
    %cm_preset("Construction Zone Up", #preset_nintendopower_crateria_construction_zone_up)

presets_nintendopower_crateria_pit_room_revisit:
    %cm_preset("Pit Room Revisit", #preset_nintendopower_crateria_pit_room_revisit)

presets_nintendopower_crateria_climb_up:
    %cm_preset("Climb Up", #preset_nintendopower_crateria_climb_up)

presets_nintendopower_crateria_parlor_revisit:
    %cm_preset("Parlor Revisit", #preset_nintendopower_crateria_parlor_revisit)

presets_nintendopower_crateria_flyway:
    %cm_preset("Flyway", #preset_nintendopower_crateria_flyway)

presets_nintendopower_crateria_bomb_torizo:
    %cm_preset("Bomb Torizo", #preset_nintendopower_crateria_bomb_torizo)

presets_nintendopower_crateria_alcatraz:
    %cm_preset("Alcatraz", #preset_nintendopower_crateria_alcatraz)

presets_nintendopower_crateria_terminator:
    %cm_preset("Terminator", #preset_nintendopower_crateria_terminator)

presets_nintendopower_crateria_green_pirate_shaft:
    %cm_preset("Green Pirate Shaft", #preset_nintendopower_crateria_green_pirate_shaft)


; Spore Spawn
presets_nintendopower_spore_spawn_green_brinstar_elevator:
    %cm_preset("Green Brinstar Elevator", #preset_nintendopower_spore_spawn_green_brinstar_elevator)

presets_nintendopower_spore_spawn_big_pink:
    %cm_preset("Big Pink", #preset_nintendopower_spore_spawn_big_pink)

presets_nintendopower_spore_spawn_spore_spawn:
    %cm_preset("Spore Spawn", #preset_nintendopower_spore_spawn_spore_spawn)

presets_nintendopower_spore_spawn_spore_fall:
    %cm_preset("Spore Fall", #preset_nintendopower_spore_spawn_spore_fall)

presets_nintendopower_spore_spawn_red_tower:
    %cm_preset("Red Tower", #preset_nintendopower_spore_spawn_red_tower)


; Norfair
presets_nintendopower_shopping_with_power_hi_jump_first:
    %cm_preset("Hi Jump First", #preset_nintendopower_shopping_with_power_hi_jump_first)

presets_nintendopower_shopping_with_power_kraid_warehouse:
    %cm_preset("Kraid Warehouse", #preset_nintendopower_shopping_with_power_kraid_warehouse)

presets_nintendopower_shopping_with_power_kraid_fight:
    %cm_preset("Kraid Fight", #preset_nintendopower_shopping_with_power_kraid_fight)

presets_nintendopower_shopping_with_power_rising_tide:
    %cm_preset("Rising Tide", #preset_nintendopower_shopping_with_power_rising_tide)

presets_nintendopower_shopping_with_power_reserve_tank:
    %cm_preset("Reserve Tank", #preset_nintendopower_shopping_with_power_reserve_tank)

presets_nintendopower_shopping_with_power_ice_beam:
    %cm_preset("Ice Beam", #preset_nintendopower_shopping_with_power_ice_beam)

presets_nintendopower_shopping_with_power_ice_escape:
    %cm_preset("Ice Escape", #preset_nintendopower_shopping_with_power_ice_escape)

presets_nintendopower_shopping_with_power_shinespark_to_power_bombs:
    %cm_preset("Shinespark To Power Bombs", #preset_nintendopower_shopping_with_power_shinespark_to_power_bombs)

presets_nintendopower_shopping_with_power_heading_to_croc:
    %cm_preset("Heading To Croc", #preset_nintendopower_shopping_with_power_heading_to_croc)

presets_nintendopower_shopping_with_power_crocomire:
    %cm_preset("Crocomire", #preset_nintendopower_shopping_with_power_crocomire)

presets_nintendopower_shopping_with_power_grapple_beam:
    %cm_preset("Grapple Beam", #preset_nintendopower_shopping_with_power_grapple_beam)

presets_nintendopower_shopping_with_power_exit_grapple_beam:
    %cm_preset("Exit Grapple Beam", #preset_nintendopower_shopping_with_power_exit_grapple_beam)

presets_nintendopower_shopping_with_power_power_bombs_post_croc:
    %cm_preset("Power Bombs Post Croc", #preset_nintendopower_shopping_with_power_power_bombs_post_croc)

presets_nintendopower_shopping_with_power_red_pirate_shaft:
    %cm_preset("Red Pirate Shaft", #preset_nintendopower_shopping_with_power_red_pirate_shaft)

presets_nintendopower_shopping_with_power_bubble_mountain:
    %cm_preset("Bubble Mountain", #preset_nintendopower_shopping_with_power_bubble_mountain)

presets_nintendopower_shopping_with_power_wave_beam:
    %cm_preset("Wave Beam", #preset_nintendopower_shopping_with_power_wave_beam)

presets_nintendopower_shopping_with_power_heading_to_xray:
    %cm_preset("Heading To X-Ray", #preset_nintendopower_shopping_with_power_heading_to_xray)

presets_nintendopower_shopping_with_power_xray_entry:
    %cm_preset("X-Ray Entry", #preset_nintendopower_shopping_with_power_xray_entry)

presets_nintendopower_shopping_with_power_xray_beam:
    %cm_preset("X-Ray Beam", #preset_nintendopower_shopping_with_power_xray_beam)

presets_nintendopower_shopping_with_power_xray_exit:
    %cm_preset("X-Ray Exit", #preset_nintendopower_shopping_with_power_xray_exit)


; Wrecked Ship
presets_nintendopower_wrecked_ship_red_brinstar_elevator:
    %cm_preset("Red Brinstar Elevator", #preset_nintendopower_wrecked_ship_red_brinstar_elevator)

presets_nintendopower_wrecked_ship_moat_missiles:
    %cm_preset("Moat Missiles", #preset_nintendopower_wrecked_ship_moat_missiles)

presets_nintendopower_wrecked_ship_shinespark_to_phantoon:
    %cm_preset("Shinespark To Phantoon", #preset_nintendopower_wrecked_ship_shinespark_to_phantoon)

presets_nintendopower_wrecked_ship_phantoon:
    %cm_preset("Phantoon", #preset_nintendopower_wrecked_ship_phantoon)

presets_nintendopower_wrecked_ship_movement_before_attic:
    %cm_preset("Movement Before Attic", #preset_nintendopower_wrecked_ship_movement_before_attic)

presets_nintendopower_wrecked_ship_attic:
    %cm_preset("Attic", #preset_nintendopower_wrecked_ship_attic)

presets_nintendopower_wrecked_ship_bowling_alley:
    %cm_preset("Bowling Alley", #preset_nintendopower_wrecked_ship_bowling_alley)

presets_nintendopower_wrecked_ship_gravity_suit_room:
    %cm_preset("Gravity Suit Room", #preset_nintendopower_wrecked_ship_gravity_suit_room)

presets_nintendopower_wrecked_ship_heading_to_maridia:
    %cm_preset("Heading To Maridia", #preset_nintendopower_wrecked_ship_heading_to_maridia)


; Maridia
presets_nintendopower_maridia_mainstreet:
    %cm_preset("Mainstreet", #preset_nintendopower_maridia_mainstreet)

presets_nintendopower_maridia_pants_room:
    %cm_preset("Pants Room", #preset_nintendopower_maridia_pants_room)

presets_nintendopower_maridia_east_pants_room:
    %cm_preset("East Pants Room", #preset_nintendopower_maridia_east_pants_room)

presets_nintendopower_maridia_super_door:
    %cm_preset("Super Door", #preset_nintendopower_maridia_super_door)

presets_nintendopower_maridia_fish_tank:
    %cm_preset("Fish Tank", #preset_nintendopower_maridia_fish_tank)

presets_nintendopower_maridia_mama_turtle:
    %cm_preset("Mama Turtle", #preset_nintendopower_maridia_mama_turtle)

presets_nintendopower_maridia_crab_supers:
    %cm_preset("Crab Supers", #preset_nintendopower_maridia_crab_supers)

presets_nintendopower_maridia_aqueduct:
    %cm_preset("Aqueduct", #preset_nintendopower_maridia_aqueduct)

presets_nintendopower_maridia_botwoon:
    %cm_preset("Botwoon", #preset_nintendopower_maridia_botwoon)

presets_nintendopower_maridia_full_halfie:
    %cm_preset("Full Halfie", #preset_nintendopower_maridia_full_halfie)

presets_nintendopower_maridia_draygon:
    %cm_preset("Draygon", #preset_nintendopower_maridia_draygon)

presets_nintendopower_maridia_heading_to_plasma:
    %cm_preset("Heading To Plasma", #preset_nintendopower_maridia_heading_to_plasma)

presets_nintendopower_maridia_plasma_beam:
    %cm_preset("Plasma Beam", #preset_nintendopower_maridia_plasma_beam)

presets_nintendopower_maridia_long_tube:
    %cm_preset("Long Tube", #preset_nintendopower_maridia_long_tube)


; Norfair
presets_nintendopower_norfair_pre_gt_fight:
    %cm_preset("Pre GT Fight", #preset_nintendopower_norfair_pre_gt_fight)

presets_nintendopower_norfair_elevator_menu:
    %cm_preset("Elevator Menu", #preset_nintendopower_norfair_elevator_menu)

presets_nintendopower_norfair_golden_torizo:
    %cm_preset("Golden Torizo", #preset_nintendopower_norfair_golden_torizo)

presets_nintendopower_norfair_on_route_to_ridley:
    %cm_preset("On Route To Ridley", #preset_nintendopower_norfair_on_route_to_ridley)

presets_nintendopower_norfair_worst_room_in_the_game:
    %cm_preset("Worst Room In The Game", #preset_nintendopower_norfair_worst_room_in_the_game)

presets_nintendopower_norfair_metal_ninja_pirates:
    %cm_preset("Metal Ninja Pirates", #preset_nintendopower_norfair_metal_ninja_pirates)

presets_nintendopower_norfair_ridley:
    %cm_preset("Ridley", #preset_nintendopower_norfair_ridley)

presets_nintendopower_norfair_escape_from_ridley:
    %cm_preset("Escape From Ridley", #preset_nintendopower_norfair_escape_from_ridley)

presets_nintendopower_norfair_landing_site:
    %cm_preset("Landing Site", #preset_nintendopower_norfair_landing_site)


; Tourian
presets_nintendopower_tourian_metroids_1:
    %cm_preset("Metroids 1", #preset_nintendopower_tourian_metroids_1)

presets_nintendopower_tourian_metroids_2:
    %cm_preset("Metroids 2", #preset_nintendopower_tourian_metroids_2)

presets_nintendopower_tourian_metroids_3:
    %cm_preset("Metroids 3", #preset_nintendopower_tourian_metroids_3)

presets_nintendopower_tourian_metroids_4:
    %cm_preset("Metroids 4", #preset_nintendopower_tourian_metroids_4)

presets_nintendopower_tourian_baby_skip:
    %cm_preset("Baby Skip", #preset_nintendopower_tourian_baby_skip)

presets_nintendopower_tourian_zeb_skip:
    %cm_preset("Zeb Skip", #preset_nintendopower_tourian_zeb_skip)

presets_nintendopower_tourian_mother_brain_2:
    %cm_preset("Mother Brain 2", #preset_nintendopower_tourian_mother_brain_2)

presets_nintendopower_tourian_zebes_escape:
    %cm_preset("Zebes Escape", #preset_nintendopower_tourian_zebes_escape)

presets_nintendopower_tourian_escape_room_3:
    %cm_preset("Escape Room 3", #preset_nintendopower_tourian_escape_room_3)

presets_nintendopower_tourian_escape_room_4:
    %cm_preset("Escape Room 4", #preset_nintendopower_tourian_escape_room_4)

presets_nintendopower_tourian_escape_climb:
    %cm_preset("Escape Climb", #preset_nintendopower_tourian_escape_climb)

presets_nintendopower_tourian_escape_parlor:
    %cm_preset("Escape Parlor", #preset_nintendopower_tourian_escape_parlor)


