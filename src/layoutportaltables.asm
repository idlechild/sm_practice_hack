
; --------------------
; Layout Portal Tables
; --------------------

; List of vanilla area/boss doors
portals_areaboss_vanilla_table:
    dw $A96C    ; Draygon Room door 0 --> Precious Room
    dw $A840    ; Precious Room door 1 --> Draygon Room
    dw $91CE    ; Kraid Room door 0 --> Kraid Eye Door Room
    dw $91B6    ; Kraid Eye Door Room door 1 --> Kraid Room
    dw $98CA    ; Lower Norfair Farming door 0 --> Ridley Room
    dw $A2C4    ; Phantoon Room door 0 --> Basement
    dw $98BE    ; Ridley Room door 1 --> Lower Norfair Farming
    dw $A2AC    ; Basement door 2 --> Phantoon Room
    dw $8A42    ; Crateria Kihunters door 2 --> Red Brinstar Elevator
    dw $8C52    ; Green Pirates Shaft door 2 --> Statues Hallway
    dw $8C22    ; Lower Mushrooms door 1 --> Green Brinstar Elevator
    dw $8E9E    ; Morph Ball door 0 --> Green Hill Zone
    dw $8AEA    ; Moat door 1 --> West Ocean
    dw $93EA    ; Crocomire Room door 1 --> Crocomire Speedway
    dw $A708    ; Aqueduct door 0 --> Crab Shaft
    dw $8AA2    ; Forgotten Highway Elbow door 0 --> Crab Maze
    dw $91E6    ; Statues Hallway door 0 --> Green Pirates Shaft
    dw $8BFE    ; Green Brinstar Elevator door 0 --> Lower Mushrooms
    dw $8E86    ; Green Hill Zone door 1 --> Morph Ball
    dw $8F0A    ; Noob Bridge door 1 --> Red Tower
    dw $913E    ; Warehouse Zeela door 0 --> Warehouse Entrance
    dw $96D2    ; Lava Dive door 0 --> Kronic Boost
    dw $9A4A    ; Three Musketeers door 0 --> Single Chamber
    dw $90C6    ; Caterpillars door 4 --> Red Fish Room
    dw $A384    ; East Tunnel door 1 --> Warehouse Entrance
    dw $A390    ; East Tunnel door 2 --> Crab Hole
    dw $A330    ; Glass Tunnel door 0 --> Main Street
    dw $8AF6    ; Red Brinstar Elevator door 0 --> Crateria Kihunters
    dw $902A    ; Red Tower door 1 --> Noob Bridge
    dw $922E    ; Warehouse Entrance door 0 --> East Tunnel
    dw $923A    ; Warehouse Entrance door 1 --> Warehouse Zeela
    dw $93D2    ; Crocomire Speedway door 4 --> Crocomire Room
    dw $967E    ; Kronic Boost door 2 --> Lava Dive
    dw $95FA    ; Single Chamber door 4 --> Three Musketeers
    dw $A510    ; Crab Hole door 2 --> East Tunnel
    dw $A4C8    ; Crab Shaft door 2 --> Aqueduct
    dw $A39C    ; Main Street door 0 --> Glass Tunnel
    dw $A480    ; Red Fish Room door 1 --> Caterpillars
    dw $8AAE    ; Crab Maze door 1 --> Forgotten Highway Elbow
    dw $89CA    ; West Ocean door 0 --> Moat

; Above table with portals inverted
portals_areaboss_vanilla_inverted_table:
    dw $A840    ; Precious Room door 1 --> Draygon Room
    dw $A96C    ; Draygon Room door 0 --> Precious Room
    dw $91B6    ; Kraid Eye Door Room door 1 --> Kraid Room
    dw $91CE    ; Kraid Room door 0 --> Kraid Eye Door Room
    dw $98BE    ; Ridley Room door 1 --> Lower Norfair Farming
    dw $A2AC    ; Basement door 2 --> Phantoon Room
    dw $98CA    ; Lower Norfair Farming door 0 --> Ridley Room
    dw $A2C4    ; Phantoon Room door 0 --> Basement
    dw $8AF6    ; Red Brinstar Elevator door 0 --> Crateria Kihunters
    dw $91E6    ; Statues Hallway door 0 --> Green Pirates Shaft
    dw $8BFE    ; Green Brinstar Elevator door 0 --> Lower Mushrooms
    dw $8E86    ; Green Hill Zone door 1 --> Morph Ball
    dw $89CA    ; West Ocean door 0 --> Moat
    dw $93D2    ; Crocomire Speedway door 4 --> Crocomire Room
    dw $A4C8    ; Crab Shaft door 2 --> Aqueduct
    dw $8AAE    ; Crab Maze door 1 --> Forgotten Highway Elbow
    dw $8C52    ; Green Pirates Shaft door 2 --> Statues Hallway
    dw $8C22    ; Lower Mushrooms door 1 --> Green Brinstar Elevator
    dw $8E9E    ; Morph Ball door 0 --> Green Hill Zone
    dw $902A    ; Red Tower door 1 --> Noob Bridge
    dw $923A    ; Warehouse Entrance door 1 --> Warehouse Zeela
    dw $967E    ; Kronic Boost door 2 --> Lava Dive
    dw $95FA    ; Single Chamber door 4 --> Three Musketeers
    dw $A480    ; Red Fish Room door 1 --> Caterpillars
    dw $922E    ; Warehouse Entrance door 0 --> East Tunnel
    dw $A510    ; Crab Hole door 2 --> East Tunnel
    dw $A39C    ; Main Street door 0 --> Glass Tunnel
    dw $8A42    ; Crateria Kihunters door 2 --> Red Brinstar Elevator
    dw $8F0A    ; Noob Bridge door 1 --> Red Tower
    dw $A384    ; East Tunnel door 1 --> Warehouse Entrance
    dw $913E    ; Warehouse Zeela door 0 --> Warehouse Entrance
    dw $93EA    ; Crocomire Room door 1 --> Crocomire Speedway
    dw $96D2    ; Lava Dive door 0 --> Kronic Boost
    dw $9A4A    ; Three Musketeers door 0 --> Single Chamber
    dw $A390    ; East Tunnel door 2 --> Crab Hole
    dw $A708    ; Aqueduct door 0 --> Crab Shaft
    dw $A330    ; Glass Tunnel door 0 --> Main Street
    dw $90C6    ; Caterpillars door 4 --> Red Fish Room
    dw $8AA2    ; Forgotten Highway Elbow door 0 --> Crab Maze
    dw $8AEA    ; Moat door 1 --> West Ocean

; List of custom portal doors
portals_areaboss_custom_inverted_table:
    dw #door_custom_A840_precious_door1                     ; Bosses
    dw #door_custom_A96C_draygon_door0
    dw #door_custom_91B6_kraid_eye_door_door1
    dw #door_custom_91CE_kraid_door0
    dw #door_custom_98BE_ridley_door1
    dw #door_custom_A2AC_basement_door2
    dw #door_custom_98CA_lower_norfair_farming_door0
    dw #door_custom_A2C4_phantoon_door0
    dw #door_custom_8AF6_red_brinstar_elevator_door0        ; Crateria
    dw #door_custom_91E6_statues_hallway_door0
    dw #door_custom_8BFE_green_brinstar_elevator_door0
    dw #door_custom_8E86_green_hill_zone_door1
    dw #door_custom_89CA_west_ocean_door0
    dw #door_custom_93D2_crocomire_speedway_door4           ; Croc
    dw #door_custom_A4C8_crab_shaft_door2                   ; East Maridia
    dw #door_custom_8AAE_crab_maze_door1
    dw #door_custom_8C52_green_pirates_shaft_door2          ; G4
    dw #door_custom_8C22_lower_mushrooms_door1              ; Green Brinstar
    dw #door_custom_8E9E_morph_ball_door0
    dw #door_custom_902A_red_tower_door1
    dw #door_custom_923A_warehouse_entrance_door1           ; Kraid's Lair
    dw #door_custom_967E_kronic_boost_door2                 ; Lower Norfair
    dw #door_custom_95FA_single_chamber_door4
    dw #door_custom_A480_red_fish_door1                     ; Red Brinstar
    dw #door_custom_922E_warehouse_entrance_door0
    dw #door_custom_A510_crab_hole_door2
    dw #door_custom_A39C_main_street_door0
    dw #door_custom_8A42_crateria_kihunters_door2
    dw #door_custom_8F0A_noob_bridge_door1
    dw #door_custom_A384_east_tunnel_door1                  ; Upper Norfair
    dw #door_custom_913E_warehouse_zeela_door0
    dw #door_custom_93EA_crocomire_door1
    dw #door_custom_96D2_lava_dive_door0
    dw #door_custom_9A4A_three_musketeers_door0
    dw #door_custom_A390_east_tunnel_door2                  ; West Maridia
    dw #door_custom_A708_aqueduct_door0
    dw #door_custom_A330_glass_tunnel_door0
    dw #door_custom_90C6_caterpillars_door4
    dw #door_custom_8AA2_forgotten_highway_elbow_door0      ; Wrecked Ship
    dw #door_custom_8AEA_moat_door1

; List of vanilla left doors
portals_left_vanilla_table:
    dw $8FA6    ; Alpha Missiles door 0 --> Construction Zone
    dw $8FFA    ; Billy Mays door 0 --> Boulder
    dw $8FE2    ; Boulder door 0 --> Blue Brinstar Energy Tank
    dw $8ECE    ; Construction Zone door 1 --> Blue Brinstar Energy Tank
    dw $8EAA    ; Morph Ball door 1 --> Construction Zone
    dw $ABAC    ; 58 Escape door 1 --> Ceres Ridley
    dw $AB4C    ; Ceres Elevator door 0 --> Falling Tile
    dw $AB94    ; Dead Scientist door 1 --> 58 Escape
    dw $AB64    ; Falling Tile door 1 --> Magnet Stairs
    dw $AB7C    ; Magnet Stairs door 1 --> Dead Scientist
    dw $9516    ; Grapple Beam door 0 --> Post Crocomire Jump
    dw $9522    ; Grapple Beam door 1 --> Grapple Tutorial 1
    dw $950A    ; Grapple Tutorial 1 door 1 --> Grapple Tutorial 2
    dw $94F2    ; Grapple Tutorial 2 door 1 --> Grapple Tutorial 3
    dw $94C2    ; Grapple Tutorial 3 door 1 --> Post Crocomire Shaft
    dw $9456    ; Post Crocomire Farming door 3 --> Post Crocomire Save
    dw $9432    ; Post Crocomire Farming door 0 --> Crocomire
    dw $946E    ; Post Crocomire Power Bombs door 0 --> Post Crocomire Farming
    dw $9492    ; Post Crocomire Shaft door 2 --> Cosine Missiles
    dw $8C8E    ; 230 Bombway door 1 --> Parlor
    dw $8C9A    ; 230 Missiles door 0 --> 230 Bombway
    dw $8A1E    ; Bowling Alley Path door 1 --> West Ocean Geemer
    dw $8B62    ; Climb door 3 --> Pit
    dw $8B56    ; Climb door 2 --> Climb Supers
    dw $8B4A    ; Climb door 1 --> Climb Supers
    dw $8A36    ; Crateria Kihunters door 1 --> Moat
    dw $89BE    ; Crateria Save door 0 --> Parlor
    dw $8AD2    ; Crateria Tube door 1 --> Crateria Kihunters
    dw $8A72    ; East Ocean door 1 --> Forgotten Highway Kago
    dw $8BC2    ; Flyway door 1 --> Bomb Torizo
    dw $8AA2    ; Forgotten Highway Elbow door 0 --> Crab Maze
    dw $8B0E    ; Gauntlet Energy Tank door 0 --> Gauntlet Entrance
    dw $8946    ; Gauntlet Entrance door 0 --> Landing Site
    dw $8BFE    ; Green Brinstar Elevator door 0 --> Lower Mushrooms
    dw $8C52    ; Green Pirates Shaft door 2 --> Statues Hallway
    dw $8C3A    ; Green Pirates Shaft door 0 --> Terminator
    dw $8C5E    ; Green Pirates Shaft door 3 --> Gauntlet Energy Tank
    dw $8922    ; Landing Site door 1 --> Crateria Tube
    dw $893A    ; Landing Site door 3 --> Crateria Power Bombs
    dw $8C16    ; Lower Mushrooms door 0 --> Green Pirates Shaft
    dw $8AEA    ; Moat door 1 --> West Ocean
    dw $8982    ; Parlor door 3 --> Flyway
    dw $8976    ; Parlor door 2 --> Pre-Map Flyway
    dw $896A    ; Parlor door 1 --> Landing Site
    dw $8B86    ; Pit door 1 --> Morph Elevator
    dw $8BDA    ; Pre-Map Flyway door 1 --> Crateria Map Station
    dw $91F2    ; Statues Hallway door 1 --> Statues
    dw $8BF2    ; Terminator door 1 --> Parlor
    dw $89E2    ; West Ocean door 2 --> Bowling Alley Path
    dw $8B32    ; West Ocean Geemer door 1 --> Bowling Alley
    dw $89D6    ; West Ocean door 1 --> Wrecked Ship Entrance
    dw $8A06    ; West Ocean door 5 --> Gravity Suit
    dw $89FA    ; West Ocean door 4 --> Bowling Alley
    dw $89EE    ; West Ocean door 3 --> Attic
    dw $8F16    ; Green Brinstar Beetoms door 0 --> Green Brinstar Main Shaft
    dw $8D8A    ; Green Brinstar Firefleas door 1 --> Green Brinstar Main Shaft
    dw $8D72    ; Brinstar Map door 0 --> Brinstar Pre-Map
    dw $8D96    ; Brinstar Missile Refill door 0 --> Green Brinstar Firefleas
    dw $8D42    ; Brinstar Pre-Map door 1 --> Green Brinstar Main Shaft
    dw $8D5A    ; Early Supers door 1 --> Brinstar Reserve Tank
    dw $8F46    ; Etecoon Energy Tank door 2 --> Green Brinstar Main Shaft
    dw $8F2E    ; Etecoon Energy Tank door 0 --> Green Brinstar Beetoms
    dw $9012    ; Etecoon Save door 0 --> Etecoon Energy Tank
    dw $8F5E    ; Etecoon Supers door 0 --> Etecoon Energy Tank
    dw $8E92    ; Green Hill Zone door 2 --> Noob Bridge
    dw $8E86    ; Green Hill Zone door 1 --> Morph Ball
    dw $8CE2    ; Green Brinstar Main Shaft door 5 --> Dachora
    dw $8CEE    ; Green Brinstar Main Shaft door 6 --> Green Brinstar Main Shaft
    dw $8CD6    ; Green Brinstar Main Shaft door 4 --> Early Supers
    dw $9006    ; Green Brinstar Main Shaft Save door 0 --> Green Brinstar Main Shaft
    dw $8F0A    ; Noob Bridge door 1 --> Red Tower
    dw $8E4A    ; Spore Spawn door 0 --> Spore Spawn Supers
    dw $A690    ; East Sand Hall door 1 --> Pants
    dw $A66C    ; Oasis door 1 --> East Sand Hall
    dw $A798    ; Pants door 2 --> Shaktool
    dw $A7BC    ; East Pants door 1 --> Shaktool
    dw $A78C    ; Pants door 1 --> East Pants
    dw $A8D0    ; Shaktool door 1 --> Spring Ball
    dw $A648    ; West Sand Hall door 1 --> Oasis
    dw $A534    ; West Sand Hall Tunnel door 1 --> West Sand Hall
    dw $919E    ; Baby Kraid door 1 --> Kraid Eye Door
    dw $917A    ; Warehouse Kihunters door 1 --> Baby Kraid
    dw $9186    ; Warehouse Kihunters door 2 --> Warehouse Save
    dw $91DA    ; Kraid door 1 --> Varia Suit
    dw $91B6    ; Kraid Eye Door door 1 --> Kraid
    dw $91C2    ; Kraid Eye Door door 2 --> Kraid Refill
    dw $9162    ; Warehouse Energy Tank door 0 --> Warehouse Zeela
    dw $923A    ; Warehouse Entrance door 1 --> Warehouse Zeela
    dw $983A    ; Acid Statue door 0 --> Golden Torizo
    dw $9846    ; Acid Statue door 1 --> Main Hall
    dw $99A2    ; Amphitheatre door 1 --> Red Kihunter Shaft
    dw $989A    ; Fast Rippers door 1 --> Fast Pillars Setup
    dw $9A9E    ; Lower Norfair Firefleas door 1 --> Jail Power Bombs
    dw $9882    ; Golden Torizo door 1 --> Screw Attack
    dw $9A0E    ; Red Kihunter Shaft door 3 --> Red Kihunter Save
    dw $9A02    ; Red Kihunter Shaft door 2 --> Lower Norfair Firefleas
    dw $985E    ; Main Hall door 1 --> Fast Pillars Setup
    dw $9A3E    ; Metal Pirates door 1 --> Wasteland
    dw $9936    ; Mickey Mouse door 1 --> Worst Room In The Game
    dw $994E    ; Pillars door 1 --> Worst Room In The Game
    dw $9912    ; Fast Pillars Setup door 4 --> Pillars
    dw $98EE    ; Fast Pillars Setup door 1 --> Mickey Mouse
    dw $9966    ; Plowerhouse door 1 --> Metal Pirates
    dw $98BE    ; Ridley door 1 --> Lower Norfair Farming
    dw $98D6    ; Lower Norfair Farming door 1 --> Plowerhouse
    dw $9A62    ; Ridley Tank door 0 --> Ridley
    dw $9A7A    ; Screw Attack door 1 --> Golden Torizo Recharge
    dw $9A6E    ; Screw Attack door 0 --> Fast Rippers
    dw $99BA    ; Spring Ball Maze door 1 --> Lower Norfair Firefleas
    dw $9A56    ; Three Musketeers door 1 --> Spring Ball Maze
    dw $997E    ; Worst Room In The Game door 1 --> Amphitheatre
    dw $8DEA    ; Big Pink door 3 --> Green Hill Zone
    dw $8E26    ; Big Pink door 8 --> Spore Spawn Farming
    dw $8E1A    ; Big Pink door 7 --> Pink Brinstar Hoppers
    dw $8DC6    ; Big Pink door 0 --> Spore Spawn Kihunters
    dw $8FD6    ; Big Pink Save door 0 --> Big Pink
    dw $8DAE    ; Dachora door 1 --> Big Pink
    dw $8F6A    ; Dachora Recharge door 0 --> Dachora
    dw $8FBE    ; Pink Brinstar Hoppers door 1 --> Hoppers Energy Tank
    dw $8E6E    ; Pink Brinstar Power Bombs door 1 --> Big Pink
    dw $8E62    ; Pink Brinstar Power Bombs door 0 --> Big Pink
    dw $8F76    ; Spore Spawn Farming door 0 --> Spore Spawn Supers
    dw $8F8E    ; Waterway Energy Tank door 0 --> Big Pink
    dw $A738    ; Aqueduct door 4 --> Below Botwoon Energy Tank
    dw $A828    ; Aqueduct Save door 0 --> Aqueduct
    dw $A69C    ; Below Botwoon Energy Tank door 1 --> West Sand Hall
    dw $A918    ; Botwoon door 1 --> Botwoon Energy Tank
    dw $A774    ; Botwoon Hallway door 1 --> Botwoon
    dw $A870    ; Botwoon Energy Tank door 3 --> Halfie Climb
    dw $A7F8    ; Colosseum door 2 --> Precious
    dw $A7EC    ; Colosseum door 1 --> Draygon Save
    dw $A4C8    ; Crab Shaft door 2 --> Aqueduct
    dw $A96C    ; Draygon door 0 --> Precious
    dw $A87C    ; Draygon Save door 0 --> Maridia Health Refill
    dw $A960    ; East Cactus Alley door 1 --> Halfie Climb
    dw $A8F4    ; Halfie Climb door 2 --> Maridia Missile Refill
    dw $A8E8    ; Halfie Climb door 1 --> Colosseum
    dw $A924    ; Space Jump door 0 --> Draygon
    dw $A948    ; West Cactus Alley door 1 --> East Cactus Alley
    dw $90EA    ; Alpha Power Bombs door 0 --> Caterpillars
    dw $9102    ; Bat door 1 --> Below Spazer
    dw $911A    ; Below Spazer door 1 --> West Tunnel
    dw $9126    ; Below Spazer door 2 --> Spazer
    dw $90DE    ; Beta Power Bombs door 0 --> Caterpillars
    dw $90D2    ; Caterpillars door 6 --> Red Brinstar Save
    dw $90C6    ; Caterpillars door 4 --> Red Fish
    dw $908A    ; Hellway door 1 --> Caterpillars
    dw $9066    ; Red Brinstar Firefleas door 1 --> Red Tower
    dw $9042    ; Red Tower door 3 --> Bat
    dw $901E    ; Red Tower door 0 --> Hellway
    dw $91FE    ; Sloaters Refill door 0 --> Red Tower
    dw $9072    ; X-Ray Scope door 0 --> Red Brinstar Firefleas

; Above table with portals inverted
portals_left_vanilla_inverted_table:
    dw $8EDA    ; Construction Zone door 2 --> Alpha Missiles
    dw $8FEE    ; Boulder door 1 --> Billy Mays
    dw $8EF2    ; Blue Brinstar Energy Tank door 1 --> Boulder
    dw $8EE6    ; Blue Brinstar Energy Tank door 0 --> Construction Zone
    dw $8EC2    ; Construction Zone door 0 --> Morph Ball
    dw $ABB8    ; Ceres Ridley door 0 --> 58 Escape
    dw $AB58    ; Falling Tile door 0 --> Ceres Elevator
    dw $ABA0    ; 58 Escape door 0 --> Dead Scientist
    dw $AB70    ; Magnet Stairs door 0 --> Falling Tile
    dw $AB88    ; Dead Scientist door 0 --> Magnet Stairs
    dw $94DA    ; Post Crocomire Jump door 1 --> Grapple Beam
    dw $94FE    ; Grapple Tutorial 1 door 0 --> Grapple Beam
    dw $94E6    ; Grapple Tutorial 2 door 0 --> Grapple Tutorial 1
    dw $94B6    ; Grapple Tutorial 3 door 0 --> Grapple Tutorial 2
    dw $9486    ; Post Crocomire Shaft door 1 --> Grapple Tutorial 3
    dw $9462    ; Post Crocomire Save door 0 --> Post Crocomire Farming
    dw $93DE    ; Crocomire door 0 --> Post Crocomire Farming
    dw $943E    ; Post Crocomire Farming door 1 --> Post Crocomire Power Bombs
    dw $94AA    ; Cosine Missiles door 0 --> Post Crocomire Shaft
    dw $89A6    ; Parlor door 6 --> 230 Bombway
    dw $8C82    ; 230 Bombway door 0 --> 230 Missiles
    dw $8B26    ; West Ocean Geemer door 0 --> Bowling Alley Path
    dw $8B7A    ; Pit door 0 --> Climb
    dw $8C76    ; Climb Supers door 1 --> Climb
    dw $8C6A    ; Climb Supers door 0 --> Climb
    dw $8ADE    ; Moat door 0 --> Crateria Kihunters
    dw $899A    ; Parlor door 5 --> Crateria Save
    dw $8A2A    ; Crateria Kihunters door 0 --> Crateria Tube
    dw $8A7E    ; Forgotten Highway Kago door 0 --> East Ocean
    dw $8BAA    ; Bomb Torizo door 0 --> Flyway
    dw $8AAE    ; Crab Maze door 1 --> Forgotten Highway Elbow
    dw $8952    ; Gauntlet Entrance door 1 --> Gauntlet Energy Tank
    dw $892E    ; Landing Site door 2 --> Gauntlet Entrance
    dw $8C22    ; Lower Mushrooms door 1 --> Green Brinstar Elevator
    dw $91E6    ; Statues Hallway door 0 --> Green Pirates Shaft
    dw $8BE6    ; Terminator door 0 --> Green Pirates Shaft
    dw $8B1A    ; Gauntlet Energy Tank door 1 --> Green Pirates Shaft
    dw $8AC6    ; Crateria Tube door 0 --> Landing Site
    dw $89B2    ; Crateria Power Bombs door 0 --> Landing Site
    dw $8C46    ; Green Pirates Shaft door 1 --> Lower Mushrooms
    dw $89CA    ; West Ocean door 0 --> Moat
    dw $8BB6    ; Flyway door 0 --> Parlor
    dw $8BCE    ; Pre-Map Flyway door door 0 --> Parlor
    dw $8916    ; Landing Site door 0 --> Parlor
    dw $8B92    ; Morph Elevator door 0 --> Pit
    dw $8C2E    ; Crateria Map Station door 0 --> Pre-Map Flyway
    dw $9216    ; Statues door 0 --> Statues Hallway
    dw $895E    ; Parlor door 0 --> Terminator
    dw $8A12    ; Bowling Alley Path door 0 --> West Ocean
    dw $A198    ; Bowling Alley door 1 --> West Ocean Geemer
    dw $A1B0    ; Wrecked Ship Entrance door 0 --> West Ocean
    dw $A300    ; Gravity Suit door 0 --> West Ocean
    dw $A18C    ; Bowling Alley door 0 --> West Ocean
    dw $A1E0    ; Attic door 2 --> West Ocean
    dw $8CBE    ; Green Brinstar Main Shaft door 2 --> Green Brinstar Beetoms
    dw $8CCA    ; Green Brinstar Main Shaft door 3 --> Green Brinstar Firefleas
    dw $8D36    ; Brinstar Pre-Map door 0 --> Brinstar Map
    dw $8D7E    ; Green Brinstar Firefleas door 0 --> Brinstar Missile Refill
    dw $8CB2    ; Green Brinstar Main Shaft door 1 --> Brinstar Pre-Map
    dw $8D66    ; Brinstar Reserve Tank door 0 --> Early Supers
    dw $8CFA    ; Green Brinstar Main Shaft door 7 --> Etecoon Energy Tank
    dw $8F22    ; Green Brinstar Beetoms door 1 --> Etecoon Energy Tank
    dw $8F52    ; Etecoon Energy Tank door 3 --> Etecoon Save
    dw $8F3A    ; Etecoon Energy Tank door 1 --> Etecoon Supers
    dw $8EFE    ; Noob Bridge door 0 --> Green Hill Zone
    dw $8E9E    ; Morph Ball door 0 --> Green Hill Zone
    dw $8DA2    ; Dachora door 0 --> Green Brinstar Main Shaft
    dw $8D06    ; Green Brinstar Main Shaft door 8 --> Green Brinstar Main Shaft
    dw $8D4E    ; Early Supers door 0 --> Green Brinstar Main Shaft
    dw $8D12    ; Green Brinstar Main Shaft door A --> Green Brinstar Main Shaft Save
    dw $902A    ; Red Tower door 1 --> Noob Bridge
    dw $8D2A    ; Spore Spawn Supers door 1 --> Spore Spawn
    dw $A780    ; Pants door 0 --> East Sand Hall
    dw $A684    ; East Sand Hall door 0 --> Oasis
    dw $A804    ; (Shaktool door 0 --> Pants)
    dw $A8C4    ; Shaktool door 0 --> East Pants
    dw $A7B0    ; East Pants door 0 --> Pants
    dw $A7C8    ; Spring Ball door 0 --> Shaktool
    dw $A660    ; Oasis door 0 --> West Sand Hall
    dw $A63C    ; West Sand Hall door 0 --> West Sand Hall Tunnel
    dw $91AA    ; Kraid Eye Door door 0 --> Baby Kraid
    dw $9192    ; Baby Kraid door 0 --> Warehouse Kihunters
    dw $925E    ; Warehouse Save door 0 --> Warehouse Kihunters
    dw $9252    ; Varia Suit door 0 --> Kraid
    dw $91CE    ; Kraid door 0 --> Kraid Eye Door
    dw $920A    ; Kraid Refill door 0 --> Kraid Eye Door
    dw $914A    ; Warehouse Zeela door 1 --> Warehouse Energy Tank
    dw $913E    ; Warehouse Zeela door 0 --> Warehouse Entrance
    dw $9876    ; Golden Torizo door 0 --> Acid Statue
    dw $9852    ; Main Hall door 0 --> Acid Statue
    dw $99F6    ; Red Kihunter Shaft door 1 --> Amphitheatre
    dw $9906    ; Fast Pillars Setup door 3 --> Fast Rippers
    dw $99D2    ; Jail Power Bombs door 0 --> Lower Norfair Firefleas
    dw $9A86    ; Screw Attack door 2 --> Golden Torizo
    dw $9AB6    ; Red Kihunter Save door 0 --> Red Kihunter Shaft
    dw $9AAA    ; Lower Norfair Firefleas door 2 --> Red Kihunter Shaft
    dw $98E2    ; Fast Pillars Setup door 0 --> Main Hall
    dw $9A1A    ; Wasteland door 0 --> Metal Pirates
    dw $9972    ; Worst Room In The Game door 0 --> Mickey Mouse
    dw $998A    ; Worst Room In The Game door 2 --> Pillars
    dw $9942    ; Pillars door 0 --> Fast Pillars Setup
    dw $992A    ; Mickey Mouse door 0 --> Fast Pillars Setup
    dw $9A32    ; Metal Pirates door 0 --> Plowerhouse
    dw $98CA    ; Lower Norfair Farming door 0 --> Ridley
    dw $995A    ; Plowerhouse door 0 --> Lower Norfair Farming
    dw $98B2    ; Ridley door 0 --> Ridley Tank
    dw $98A6    ; Golden Torizo Recharge door 0 --> Screw Attack
    dw $988E    ; Fast Rippers door 0 --> Screw Attack
    dw $9A92    ; Lower Norfair Firefleas door 0 --> Spring Ball Maze
    dw $99AE    ; Spring Ball Maze door 0 --> Three Musketeers
    dw $9996    ; Amphitheatre door 0 --> Worst Room In The Game
    dw $8E7A    ; Green Hill Zone door 0 --> Big Pink
    dw $8F82    ; Spore Spawn Farming door 1 --> Big Pink
    dw $8FB2    ; Pink Brinstar Hoppers door 0 --> Big Pink
    dw $8E32    ; Spore Spawn Kihunters door 0 --> Big Pink
    dw $8DF6    ; Big Pink door 4 --> Big Pink Save
    dw $8DD2    ; Big Pink door 1 --> Dachora
    dw $8DBA    ; Dachora door 2 --> Dachora Recharge
    dw $8FCA    ; Hoppers Energy Tank door 0 --> Pink Brinstar Hoppers
    dw $8DDE    ; Big Pink door 2 --> Pink Brinstar Power Bombs
    dw $8E02    ; Big Pink door 5 --> Pink Brinstar Power Bombs
    dw $8D1E    ; Spore Spawn Supers door 0 --> Spore Spawn Farming
    dw $8E0E    ; Big Pink door 6 --> Waterway Energy Tank
    dw $A7D4    ; Below Botwoon Energy Tank door 0 --> Aqueduct
    dw $A744    ; Aqueduct door 5 --> Aqueduct Save
    dw $A654    ; West Sand Hall door 2 --> Below Botwoon Energy Tank
    dw $A84C    ; Botwoon Energy Tank door 0 --> Botwoon
    dw $A90C    ; Botwoon door 0 --> Botwoon Hallway
    dw $A8DC    ; Halfie Climb door 0 --> Botwoon Energy Tank
    dw $A834    ; Precious door 0 --> Colosseum
    dw $A888    ; Draygon Save door 1 --> Colosseum
    dw $A708    ; Aqueduct door 0 --> Crab Shaft
    dw $A840    ; Precious door 1 --> Draygon
    dw $A930    ; Maridia Health Refill door 0 --> Draygon Save
    dw $A900    ; Halfie Climb door 3 --> East Cactus Alley
    dw $A894    ; Maridia Missile Refill door 0 --> Halfie Climb
    dw $A7E0    ; Colosseum door 0 --> Halfie Climb
    dw $A978    ; Draygon door 1 --> Space Jump
    dw $A954    ; East Cactus Alley door 0 --> West Cactus Alley
    dw $9096    ; Caterpillars door 0 --> Alpha Power Bombs
    dw $910E    ; Below Spazer door 0 --> Bat
    dw $A36C    ; West Tunnel door 1 --> Below Spazer
    dw $9132    ; Spazer door 0 --> Below Spazer
    dw $90A2    ; Caterpillars door 1 --> Beta Power Bombs
    dw $926A    ; Red Brinstar Save door 0 --> Caterpillars
    dw $A480    ; Red Fish door 1 --> Caterpillars
    dw $90AE    ; Caterpillars door 2 --> Hellway
    dw $9036    ; Red Tower door 2 --> Red Brinstar Firefleas
    dw $90F6    ; Bat door 0 --> Red Tower
    dw $907E    ; Hellway door 0 --> Red Tower
    dw $904E    ; Red Tower door 4 --> Sloaters Refill
    dw $905A    ; Red Brinstar Firefleas door 0 --> X-Ray Scope

; List of vanilla right doors
portals_right_vanilla_table:
    dw $8FEE    ; Boulder door 1 --> Billy Mays
    dw $8EDA    ; Construction Zone door 2 --> Alpha Missiles
    dw $8EC2    ; Construction Zone door 0 --> Morph Ball
    dw $8EE6    ; Blue Brinstar Energy Tank door 0 --> Construction Zone
    dw $8EF2    ; Blue Brinstar Energy Tank door 1 --> Boulder
    dw $8E9E    ; Morph Ball door 0 --> Green Hill Zone
    dw $ABA0    ; 58 Escape door 0 --> Dead Scientist
    dw $ABB8    ; Ceres Ridley door 0 --> 58 Escape
    dw $AB88    ; Dead Scientist door 0 --> Magnet Stairs
    dw $AB58    ; Falling Tile door 0 --> Ceres Elevator
    dw $AB70    ; Magnet Stairs door 0 --> Falling Tile
    dw $94AA    ; Cosine Missiles door 0 --> Post Crocomire Shaft
    dw $93DE    ; Crocomire door 0 --> Post Crocomire Farming
    dw $94FE    ; Grapple Tutorial 1 door 0 --> Grapple Beam
    dw $94E6    ; Grapple Tutorial 2 door 0 --> Grapple Tutorial 1
    dw $94B6    ; Grapple Tutorial 3 door 0 --> Grapple Tutorial 2
    dw $943E    ; Post Crocomire Farming door 1 --> Post Crocomire Power Bombs
    dw $94DA    ; Post Crocomire Jump door 1 --> Grapple Beam
    dw $9462    ; Post Crocomire Save door 0 --> Post Crocomire Farming
    dw $9486    ; Post Crocomire Shaft door 1 --> Grapple Tutorial 3
    dw $8C82    ; 230 Bombway door 0 --> 230 Missiles
    dw $8BAA    ; Bomb Torizo door 0 --> Flyway
    dw $8A12    ; Bowling Alley Path door 0 --> West Ocean
    dw $8B6E    ; Climb door 4 --> Tourian Escape 4
    dw $8C76    ; Climb Supers door 1 --> Climb
    dw $8C6A    ; Climb Supers door 0 --> Climb
    dw $8AAE    ; Crab Maze door 1 --> Forgotten Highway Elbow
    dw $8A2A    ; Crateria Kihunters door 0 --> Crateria Tube
    dw $8C2E    ; Crateria Map Station door 0 --> Pre-Map Flyway
    dw $89B2    ; Crateria Power Bombs door 0 --> Landing Site
    dw $8AC6    ; Crateria Tube door 0 --> Landing Site
    dw $8A66    ; East Ocean door 0 --> Electric Death
    dw $8BB6    ; Flyway door 0 --> Parlor
    dw $8A7E    ; Forgotten Highway Kago door 0 --> East Ocean
    dw $8B1A    ; Gauntlet Energy Tank door 1 --> Green Pirates Shaft
    dw $8952    ; Gauntlet Entrance door 1 --> Gauntlet Energy Tank
    dw $8C46    ; Green Pirates Shaft door 1 --> Lower Mushrooms
    dw $8916    ; Landing Site door 0 --> Parlor
    dw $892E    ; Landing Site door 2 --> Gauntlet Entrance
    dw $8C22    ; Lower Mushrooms door 1 --> Green Brinstar Elevator
    dw $8ADE    ; Moat door 0 --> Crateria Kihunters
    dw $8B92    ; Morph Elevator door 0 --> Pit
    dw $89A6    ; Parlor door 6 --> 230 Bombway
    dw $899A    ; Parlor door 5 --> Crateria Save
    dw $895E    ; Parlor door 0 --> Terminator
    dw $8B7A    ; Pit door 0 --> Climb
    dw $8BCE    ; Pre-Map Flyway door door 0 --> Parlor
    dw $9216    ; Statues door 0 --> Statues Hallway
    dw $91E6    ; Statues Hallway door 0 --> Green Pirates Shaft
    dw $8BE6    ; Terminator door 0 --> Green Pirates Shaft
    dw $8B26    ; West Ocean Geemer door 0 --> Bowling Alley Path
    dw $89CA    ; West Ocean door 0 --> Moat
    dw $8F22    ; Green Brinstar Beetoms door 1 --> Etecoon Energy Tank
    dw $8D7E    ; Green Brinstar Firefleas door 0 --> Brinstar Missile Refill
    dw $8D36    ; Brinstar Pre-Map door 0 --> Brinstar Map
    dw $8D66    ; Brinstar Reserve Tank door 0 --> Early Supers
    dw $8D4E    ; Early Supers door 0 --> Green Brinstar Main Shaft
    dw $8F52    ; Etecoon Energy Tank door 3 --> Etecoon Save
    dw $8F3A    ; Etecoon Energy Tank door 1 --> Etecoon Supers
    dw $8E7A    ; Green Hill Zone door 0 --> Big Pink
    dw $8CFA    ; Green Brinstar Main Shaft door 7 --> Etecoon Energy Tank
    dw $8CBE    ; Green Brinstar Main Shaft door 2 --> Green Brinstar Beetoms
    dw $8CCA    ; Green Brinstar Main Shaft door 3 --> Green Brinstar Firefleas
    dw $8D12    ; Green Brinstar Main Shaft door A --> Green Brinstar Main Shaft Save
    dw $8D06    ; Green Brinstar Main Shaft door 8 --> Green Brinstar Main Shaft
    dw $8CB2    ; Green Brinstar Main Shaft door 1 --> Brinstar Pre-Map
    dw $8EFE    ; Noob Bridge door 0 --> Green Hill Zone
    dw $8E32    ; Spore Spawn Kihunters door 0 --> Big Pink
    dw $A684    ; East Sand Hall door 0 --> Oasis
    dw $A660    ; Oasis door 0 --> West Sand Hall
    dw $A780    ; Pants door 0 --> East Sand Hall
    dw $A7B0    ; East Pants door 0 --> Pants
    dw $A7A4    ; Pants door 3 --> Pants
    dw $A8C4    ; Shaktool door 0 --> East Pants
    dw $A7C8    ; Spring Ball door 0 --> Shaktool
    dw $A63C    ; West Sand Hall door 0 --> West Sand Hall Tunnel
    dw $A654    ; West Sand Hall door 2 --> Below Botwoon Energy Tank
    dw $A528    ; West Sand Hall Tunnel door 0 --> Crab Hole
    dw $9192    ; Baby Kraid door 0 --> Warehouse Kihunters
    dw $91CE    ; Kraid door 0 --> Kraid Eye Door
    dw $91AA    ; Kraid Eye Door door 0 --> Baby Kraid
    dw $920A    ; Kraid Refill door 0 --> Kraid Eye Door
    dw $9252    ; Varia Suit door 0 --> Kraid
    dw $922E    ; Warehouse Entrance door 0 --> East Tunnel
    dw $925E    ; Warehouse Save door 0 --> Warehouse Kihunters
    dw $914A    ; Warehouse Zeela door 1 --> Warehouse Energy Tank
    dw $913E    ; Warehouse Zeela door 0 --> Warehouse Entrance
    dw $9996    ; Amphitheatre door 0 --> Worst Room In The Game
    dw $988E    ; Fast Rippers door 0 --> Screw Attack
    dw $9AAA    ; Lower Norfair Firefleas door 2 --> Red Kihunter Shaft
    dw $9A92    ; Lower Norfair Firefleas door 0 --> Spring Ball Maze
    dw $9876    ; Golden Torizo door 0 --> Acid Statue
    dw $98A6    ; Golden Torizo Recharge door 0 --> Screw Attack
    dw $99D2    ; Jail Power Bombs door 0 --> Lower Norfair Firefleas
    dw $9AB6    ; Red Kihunter Save door 0 --> Red Kihunter Shaft
    dw $99F6    ; Red Kihunter Shaft door 1 --> Amphitheatre
    dw $9852    ; Main Hall door 0 --> Acid Statue
    dw $9A32    ; Metal Pirates door 0 --> Plowerhouse
    dw $992A    ; Mickey Mouse door 0 --> Fast Pillars Setup
    dw $9942    ; Pillars door 0 --> Fast Pillars Setup
    dw $9906    ; Fast Pillars Setup door 3 --> Fast Rippers
    dw $98E2    ; Fast Pillars Setup door 0 --> Main Hall
    dw $995A    ; Plowerhouse door 0 --> Lower Norfair Farming
    dw $98B2    ; Ridley door 0 --> Ridley Tank
    dw $98CA    ; Lower Norfair Farming door 0 --> Ridley
    dw $9A86    ; Screw Attack door 2 --> Golden Torizo
    dw $99AE    ; Spring Ball Maze door 0 --> Three Musketeers
    dw $9A4A    ; Three Musketeers door 0 --> Single Chamber
    dw $9A1A    ; Wasteland door 0 --> Metal Pirates
    dw $998A    ; Worst Room In The Game door 2 --> Pillars
    dw $9972    ; Worst Room In The Game door 0 --> Mickey Mouse
    dw $8E0E    ; Big Pink door 6 --> Waterway Energy Tank
    dw $8DDE    ; Big Pink door 2 --> Pink Brinstar Power Bombs
    dw $8E02    ; Big Pink door 5 --> Pink Brinstar Power Bombs
    dw $8DD2    ; Big Pink door 1 --> Dachora
    dw $8DF6    ; Big Pink door 4 --> Big Pink Save
    dw $8DBA    ; Dachora door 2 --> Dachora Recharge
    dw $8DA2    ; Dachora door 0 --> Green Brinstar Main Shaft
    dw $8FB2    ; Pink Brinstar Hoppers door 0 --> Big Pink
    dw $8FCA    ; Hoppers Energy Tank door 0 --> Pink Brinstar Hoppers
    dw $8F82    ; Spore Spawn Farming door 1 --> Big Pink
    dw $8D1E    ; Spore Spawn Supers door 0 --> Spore Spawn Farming
    dw $8D2A    ; Spore Spawn Supers door 1 --> Spore Spawn
    dw $A744    ; Aqueduct door 5 --> Aqueduct Save
    dw $A708    ; Aqueduct door 0 --> Crab Shaft
    dw $A7D4    ; Below Botwoon Energy Tank door 0 --> Aqueduct
    dw $A90C    ; Botwoon door 0 --> Botwoon Hallway
    dw $A84C    ; Botwoon Energy Tank door 0 --> Botwoon
    dw $A7E0    ; Colosseum door 0 --> Halfie Climb
    dw $A4B0    ; Crab Shaft door 0 --> Mount Everest
    dw $A978    ; Draygon door 1 --> Space Jump
    dw $A888    ; Draygon Save door 1 --> Colosseum
    dw $A954    ; East Cactus Alley door 0 --> West Cactus Alley
    dw $A8DC    ; Halfie Climb door 0 --> Botwoon Energy Tank
    dw $A900    ; Halfie Climb door 3 --> East Cactus Alley
    dw $A930    ; Maridia Health Refill door 0 --> Draygon Save
    dw $A894    ; Maridia Missile Refill door 0 --> Halfie Climb
    dw $A840    ; Precious door 1 --> Draygon
    dw $A834    ; Precious door 0 --> Colosseum
    dw $A93C    ; West Cactus Alley door 0 --> Butterfly
    dw $90F6    ; Bat door 0 --> Red Tower
    dw $910E    ; Below Spazer door 0 --> Bat
    dw $9096    ; Caterpillars door 0 --> Alpha Power Bombs
    dw $90AE    ; Caterpillars door 2 --> Hellway
    dw $90A2    ; Caterpillars door 1 --> Beta Power Bombs
    dw $907E    ; Hellway door 0 --> Red Tower
    dw $905A    ; Red Brinstar Firefleas door 0 --> X-Ray Scope
    dw $926A    ; Red Brinstar Save door 0 --> Caterpillars
    dw $904E    ; Red Tower door 4 --> Sloaters Refill
    dw $9036    ; Red Tower door 2 --> Red Brinstar Firefleas
    dw $902A    ; Red Tower door 1 --> Noob Bridge
    dw $9132    ; Spazer door 0 --> Below Spazer

; Above table with portals inverted
portals_right_vanilla_inverted_table:
    dw $8FFA    ; Billy Mays door 0 --> Boulder
    dw $8FA6    ; Alpha Missiles door 0 --> Construction Zone
    dw $8EAA    ; Morph Ball door 1 --> Construction Zone
    dw $8ECE    ; Construction Zone door 1 --> Blue Brinstar Energy Tank
    dw $8FE2    ; Boulder door 0 --> Blue Brinstar Energy Tank
    dw $8E86    ; Green Hill Zone door 1 --> Morph Ball
    dw $AB94    ; Dead Scientist door 1 --> 58 Escape
    dw $ABAC    ; 58 Escape door 1 --> Ceres Ridley
    dw $AB7C    ; Magnet Stairs door 1 --> Dead Scientist
    dw $AB4C    ; Ceres Elevator door 0 --> Falling Tile
    dw $AB64    ; Falling Tile door 1 --> Magnet Stairs
    dw $9492    ; Post Crocomire Shaft door 2 --> Cosine Missiles
    dw $9432    ; Post Crocomire Farming door 0 --> Crocomire
    dw $9522    ; Grapple Beam door 1 --> Grapple Tutorial 1
    dw $950A    ; Grapple Tutorial 1 door 1 --> Grapple Tutorial 2
    dw $94F2    ; Grapple Tutorial 2 door 1 --> Grapple Tutorial 3
    dw $946E    ; Post Crocomire Power Bombs door 0 --> Post Crocomire Farming
    dw $9516    ; Grapple Beam door 0 --> Post Crocomire Jump
    dw $9456    ; Post Crocomire Farming door 3 --> Post Crocomire Save
    dw $94C2    ; Grapple Tutorial 3 door 1 --> Post Crocomire Shaft
    dw $8C9A    ; 230 Missiles door 0 --> 230 Bombway
    dw $8BC2    ; Flyway door 1 --> Bomb Torizo
    dw $89E2    ; West Ocean door 2 --> Bowling Alley Path
    dw $AB34    ; Tourian Escape 4 door 1 --> Climb
    dw $8B56    ; Climb door 2 --> Climb Supers
    dw $8B4A    ; Climb door 1 --> Climb Supers
    dw $8AA2    ; Forgotten Highway Elbow door 0 --> Crab Maze
    dw $8AD2    ; Crateria Tube door 1 --> Crateria Kihunters
    dw $8BDA    ; Pre-Map Flyway door 1 --> Crateria Map Station
    dw $893A    ; Landing Site door 3 --> Crateria Power Bombs
    dw $8922    ; Landing Site door 1 --> Crateria Tube
    dw $A264    ; Electric Death door 0 --> East Ocean
    dw $8982    ; Parlor door 3 --> Flyway
    dw $8A72    ; East Ocean door 1 --> Forgotten Highway Kago
    dw $8C5E    ; Green Pirates Shaft door 3 --> Gauntlet Energy Tank
    dw $8B0E    ; Gauntlet Energy Tank door 0 --> Gauntlet Entrance
    dw $8C16    ; Lower Mushrooms door 0 --> Green Pirates Shaft
    dw $896A    ; Parlor door 1 --> Landing Site
    dw $8946    ; Gauntlet Entrance door 0 --> Landing Site
    dw $8BFE    ; Green Brinstar Elevator door 0 --> Lower Mushrooms
    dw $8A36    ; Crateria Kihunters door 1 --> Moat
    dw $8B86    ; Pit door 1 --> Morph Elevator
    dw $8C8E    ; 230 Bombway door 1 --> Parlor
    dw $89BE    ; Crateria Save door 0 --> Parlor
    dw $8BF2    ; Terminator door 1 --> Parlor
    dw $8B62    ; Climb door 3 --> Pit
    dw $8976    ; Parlor door 2 --> Pre-Map Flyway
    dw $91F2    ; Statues Hallway door 1 --> Statues
    dw $8C52    ; Green Pirates Shaft door 2 --> Statues Hallway
    dw $8C3A    ; Green Pirates Shaft door 0 --> Terminator
    dw $8A1E    ; Bowling Alley Path door 1 --> West Ocean Geemer
    dw $8AEA    ; Moat door 1 --> West Ocean
    dw $8F2E    ; Etecoon Energy Tank door 0 --> Green Brinstar Beetoms
    dw $8D96    ; Brinstar Missile Refill door 0 --> Green Brinstar Firefleas
    dw $8D72    ; Brinstar Map door 0 --> Brinstar Pre-Map
    dw $8D5A    ; Early Supers door 1 --> Brinstar Reserve Tank
    dw $8CD6    ; Green Brinstar Main Shaft door 4 --> Early Supers
    dw $9012    ; Etecoon Save door 0 --> Etecoon Energy Tank
    dw $8F5E    ; Etecoon Supers door 0 --> Etecoon Energy Tank
    dw $8DEA    ; Big Pink door 3 --> Green Hill Zone
    dw $8F46    ; Etecoon Energy Tank door 2 --> Green Brinstar Main Shaft
    dw $8F16    ; Green Brinstar Beetoms door 0 --> Green Brinstar Main Shaft
    dw $8D8A    ; Green Brinstar Firefleas door 1 --> Green Brinstar Main Shaft
    dw $9006    ; Green Brinstar Main Shaft Save door 0 --> Green Brinstar Main Shaft
    dw $8CEE    ; Green Brinstar Main Shaft door 6 --> Green Brinstar Main Shaft
    dw $8D42    ; Brinstar Pre-Map door 1 --> Green Brinstar Main Shaft
    dw $8E92    ; Green Hill Zone door 2 --> Noob Bridge
    dw $8DC6    ; Big Pink door 0 --> Green Hill Zone
    dw $A66C    ; Oasis door 1 --> East Sand Hall
    dw $A648    ; West Sand Hall door 1 --> Oasis
    dw $A690    ; East Sand Hall door 1 --> Pants
    dw $A78C    ; Pants door 1 --> East Pants
    dw $A810    ; (Pants door 1 --> Pants)
    dw $A798    ; Pants door 2 --> Shaktool
    dw $A8D0    ; Shaktool door 1 --> Spring Ball
    dw $A534    ; West Sand Hall Tunnel door 1 --> West Sand Hall
    dw $A69C    ; Below Botwoon Energy Tank door 1 --> West Sand Hall
    dw $A504    ; Crab Hole door 1 --> West Sand Hall Tunnel
    dw $917A    ; Warehouse Kihunters door 1 --> Baby Kraid
    dw $91B6    ; Kraid Eye Door door 1 --> Kraid
    dw $919E    ; Baby Kraid door 1 --> Kraid Eye Door
    dw $91C2    ; Kraid Eye Door door 2 --> Kraid Refill
    dw $91DA    ; Kraid door 1 --> Varia Suit
    dw $A384    ; East Tunnel door 1 --> Warehouse Entrance
    dw $9186    ; Warehouse Kihunters door 2 --> Warehouse Save
    dw $9162    ; Warehouse Energy Tank door 0 --> Warehouse Zeela
    dw $923A    ; Warehouse Entrance door 1 --> Warehouse Zeela
    dw $997E    ; Worst Room In The Game door 1 --> Amphitheatre
    dw $9A6E    ; Screw Attack door 0 --> Fast Rippers
    dw $9A02    ; Red Kihunter Shaft door 2 --> Lower Norfair Firefleas
    dw $99BA    ; Spring Ball Maze door 1 --> Lower Norfair Firefleas
    dw $983A    ; Acid Statue door 0 --> Golden Torizo
    dw $9A7A    ; Screw Attack door 1 --> Golden Torizo Recharge
    dw $9A9E    ; Lower Norfair Firefleas door 1 --> Jail Power Bombs
    dw $9A0E    ; Red Kihunter Shaft door 3 --> Red Kihunter Save
    dw $99A2    ; Amphitheatre door 1 --> Red Kihunter Shaft
    dw $9846    ; Acid Statue door 1 --> Main Hall
    dw $9966    ; Plowerhouse door 1 --> Metal Pirates
    dw $98EE    ; Fast Pillars Setup door 1 --> Mickey Mouse
    dw $9912    ; Fast Pillars Setup door 4 --> Pillars
    dw $989A    ; Fast Rippers door 1 --> Fast Pillars Setup
    dw $985E    ; Main Hall door 1 --> Fast Pillars Setup
    dw $98D6    ; Lower Norfair Farming door 1 --> Plowerhouse
    dw $9A62    ; Ridley Tank door 0 --> Ridley
    dw $98BE    ; Ridley door 1 --> Lower Norfair Farming
    dw $9882    ; Golden Torizo door 1 --> Screw Attack
    dw $9A56    ; Three Musketeers door 1 --> Spring Ball Maze
    dw $95FA    ; Single Chamber door 4 --> Three Musketeers
    dw $9A3E    ; Metal Pirates door 1 --> Wasteland
    dw $994E    ; Pillars door 1 --> Worst Room In The Game
    dw $9936    ; Mickey Mouse door 1 --> Worst Room In The Game
    dw $8F8E    ; Waterway Energy Tank door 0 --> Big Pink
    dw $8E6E    ; Pink Brinstar Power Bombs door 1 --> Big Pink
    dw $8E62    ; Pink Brinstar Power Bombs door 0 --> Big Pink
    dw $8DAE    ; Dachora door 1 --> Big Pink
    dw $8FD6    ; Big Pink Save door 0 --> Big Pink
    dw $8F6A    ; Dachora Recharge door 0 --> Dachora
    dw $8CE2    ; Green Brinstar Main Shaft door 5 --> Dachora
    dw $8E1A    ; Big Pink door 7 --> Pink Brinstar Hoppers
    dw $8FBE    ; Pink Brinstar Hoppers door 1 --> Hoppers Energy Tank
    dw $8E26    ; Big Pink door 8 --> Spore Spawn Farming
    dw $8F76    ; Spore Spawn Farming door 0 --> Spore Spawn Supers
    dw $8E4A    ; Spore Spawn door 0 --> Spore Spawn Supers
    dw $A828    ; Aqueduct Save door 0 --> Aqueduct
    dw $A4C8    ; Crab Shaft door 2 --> Aqueduct
    dw $A738    ; Aqueduct door 4 --> Below Botwoon Energy Tank
    dw $A774    ; Botwoon Hallway door 1 --> Botwoon
    dw $A918    ; Botwoon door 1 --> Botwoon Energy Tank
    dw $A8E8    ; Halfie Climb door 1 --> Colosseum
    dw $A468    ; Mount Everest door 5 --> Crab Shaft
    dw $A924    ; Space Jump door 0 --> Draygon
    dw $A7EC    ; Colosseum door 1 --> Draygon Save
    dw $A948    ; West Cactus Alley door 1 --> East Cactus Alley
    dw $A870    ; Botwoon Energy Tank door 3 --> Halfie Climb
    dw $A960    ; East Cactus Alley door 1 --> Halfie Climb
    dw $A87C    ; Draygon Save door 0 --> Maridia Health Refill
    dw $A8F4    ; Halfie Climb door 2 --> Maridia Missile Refill
    dw $A96C    ; Draygon door 0 --> Precious
    dw $A7F8    ; Colosseum door 2 --> Precious
    dw $A75C    ; Butterfly door 1 --> West Cactus Alley
    dw $9042    ; Red Tower door 3 --> Bat
    dw $9102    ; Bat door 1 --> Below Spazer
    dw $90EA    ; Alpha Power Bombs door 0 --> Caterpillars
    dw $908A    ; Hellway door 1 --> Caterpillars
    dw $90DE    ; Beta Power Bombs door 0 --> Caterpillars
    dw $901E    ; Red Tower door 0 --> Hellway
    dw $9072    ; X-Ray Scope door 0 --> Red Brinstar Firefleas
    dw $90D2    ; Caterpillars door 6 --> Red Brinstar Save
    dw $91FE    ; Sloaters Refill door 0 --> Red Tower
    dw $9066    ; Red Brinstar Firefleas door 1 --> Red Tower
    dw $8F0A    ; Noob Bridge door 1 --> Red Tower
    dw $9126    ; Below Spazer door 2 --> Spazer

; List of vanilla up doors
portals_up_vanilla_table:
    dw $944A    ; Post Crocomire Farming door 2 --> Post Crocomire Shaft
    dw $949E    ; Post Crocomire Shaft door 3 --> Post Crocomire Jump
    dw $8A42    ; Crateria Kihunters door 2 --> Red Brinstar Elevator
    dw $8ABA    ; Forgotten Highway Elbow door 1 --> Forgotten Highway Elevator
    dw $8A8A    ; Forgotten Highway Kago door 1 --> Crab Maze
    dw $898E    ; Parlor door 4 --> Climb
    dw $8E56    ; Spore Spawn door 1 --> Spore Spawn Kihunters
    dw $916E    ; Warehouse Kihunters door 0 --> Warehouse Zeela
    dw $99EA    ; Red Kihunter Shaft door 0 --> Wasteland
    dw $99C6    ; Spring Ball Maze door 2 --> Jail Power Bombs
    dw $A714    ; Aqueduct door 1 --> West Aqueduct Quicksand
    dw $A720    ; Aqueduct door 2 --> East Aqueduct Quicksand
    dw $A600    ; Aqueduct Tube door 0 --> Oasis
    dw $A768    ; Botwoon Hallway door 0 --> Aqueduct
    dw $A8AC    ; Botwoon Quicksand door 0 --> Below Botwoon Energy Tank
    dw $A8B8    ; Botwoon Quicksand door 1 --> Below Botwoon Energy Tank
    dw $A864    ; Botwoon Energy Tank door 2 --> Botwoon Quicksand
    dw $A858    ; Botwoon Energy Tank door 1 --> Botwoon Quicksand
    dw $A6FC    ; East Aqueduct Quicksand door 1 --> East Sand Hole
    dw $A6CC    ; East Sand Hole door 1 --> East Sand Hall
    dw $A6E4    ; West Aqueduct Quicksand door 1 --> West Sand Hole
    dw $A6B4    ; West Sand Hole door 1 --> West Sand Hall

; Above table with portals inverted
portals_up_vanilla_inverted_table:
    dw $947A    ; Post Crocomire Shaft door 0 --> Post Crocomire Farming
    dw $94CE    ; Post Crocomire Jump door 0 --> Post Crocomire Shaft
    dw $8AF6    ; Red Brinstar Elevator door 0 --> Crateria Kihunters
    dw $8A4E    ; Forgotten Highway Elevator door 0 --> Forgotten Highway Elbow
    dw $8A96    ; Crab Maze door 0 --> Forgotten Highway Kago
    dw $8B3E    ; Climb door 0 --> Parlor
    dw $8E3E    ; Spore Spawn Kihunters door 1 --> Spore Spawn
    dw $9156    ; Warehouse Zeela door 2 --> Warehouse Kihunters
    dw $9A26    ; Wasteland door 1 --> Red Kihunter Shaft
    dw $99DE    ; Jail Power Bombs door 1 --> Spring Ball Maze
    dw $A6D8    ; West Aqueduct Quicksand door 0 --> Aqueduct
    dw $A6F0    ; East Aqueduct Quicksand door 0 --> Aqueduct
    dw $A678    ; Oasis door 2 --> Aqueduct Tube
    dw $A72C    ; Aqueduct door 3 --> Botwoon Hallway
    dw $0000    ; (Below Botwoon Energy Tank --> Botwoon Quicksand)
    dw $0000    ; (Below Botwoon Energy Tank --> Botwoon Quicksand)
    dw $0000    ; (Botwoon Quicksand --> Botwoon Energy Tank)
    dw $0000    ; (Botwoon Quicksand --> Botwoon Energy Tank)
    dw $A6C0    ; East Sand Hole door 0 --> East Aqueduct Quicksand
    dw $0000    ; (East Sand Hall --> East Sand Hole)
    dw $A6A8    ; West Sand Hole door 0 --> West Aqueduct Quicksand
    dw $0000    ; (West Sand Hall --> West Sand Hole)

; List of vanilla down doors
portals_down_vanilla_table:
    dw $93EA    ; Crocomire door 1 --> Crocomire Speedway
    dw $94CE    ; Post Crocomire Jump door 0 --> Post Crocomire Shaft
    dw $947A    ; Post Crocomire Shaft door 0 --> Post Crocomire Farming
    dw $8B3E    ; Climb door 0 --> Parlor
    dw $8A96    ; Crab Maze door 0 --> Forgotten Highway Kago
    dw $8A4E    ; Forgotten Highway Elevator door 0 --> Forgotten Highway Elbow
    dw $8AF6    ; Red Brinstar Elevator door 0 --> Crateria Kihunters
    dw $8E3E    ; Spore Spawn Kihunters door 1 --> Spore Spawn
    dw $0008    ; (East Sand Hall --> East Sand Hole)
    dw $A678    ; Oasis door 2 --> Aqueduct Tube
    dw $000A    ; (West Sand Hall --> West Sand Hole)
    dw $9156    ; Warehouse Zeela door 2 --> Warehouse Kihunters
    dw $99DE    ; Jail Power Bombs door 1 --> Spring Ball Maze
    dw $9A26    ; Wasteland door 1 --> Red Kihunter Shaft
    dw $A72C    ; Aqueduct door 3 --> Botwoon Hallway
    dw $A60C    ; Aqueduct Tube door 1 --> Plasma Spark
    dw $0010    ; (Below Botwoon Energy Tank --> Botwoon Quicksand)
    dw $0011    ; (Below Botwoon Energy Tank --> Botwoon Quicksand)
    dw $0012    ; (Botwoon Quicksand --> Botwoon Energy Tank)
    dw $0013    ; (Botwoon Quicksand --> Botwoon Energy Tank)
    dw $A4BC    ; Crab Shaft door 1 --> Pseudo Plasma Spark
    dw $A6F0    ; East Aqueduct Quicksand door 0 --> Aqueduct
    dw $A6C0    ; East Sand Hole door 0 --> East Aqueduct Quicksand
    dw $A6D8    ; West Aqueduct Quicksand door 0 --> Aqueduct
    dw $A6A8    ; West Sand Hole door 0 --> West Aqueduct Quicksand

; Above table with portals inverted
portals_down_vanilla_inverted_table:
    dw $93D2    ; Crocomire Speedway door 4 --> Crocomire
    dw $949E    ; Post Crocomire Shaft door 3 --> Post Crocomire Jump
    dw $944A    ; Post Crocomire Farming door 2 --> Post Crocomire Shaft
    dw $898E    ; Parlor door 4 --> Climb
    dw $8A8A    ; Forgotten Highway Kago door 1 --> Crab Maze
    dw $8ABA    ; Forgotten Highway Elbow door 1 --> Forgotten Highway Elevator
    dw $8A42    ; Crateria Kihunters door 2 --> Red Brinstar Elevator
    dw $8E56    ; Spore Spawn door 1 --> Spore Spawn Kihunters
    dw $A6CC    ; East Sand Hole door 1 --> East Sand Hall
    dw $A600    ; Aqueduct Tube door 0 --> Oasis
    dw $A6B4    ; West Sand Hole door 1 --> West Sand Hall
    dw $916E    ; Warehouse Kihunters door 0 --> Warehouse Zeela
    dw $99C6    ; Spring Ball Maze door 2 --> Jail Power Bombs
    dw $99EA    ; Red Kihunter Shaft door 0 --> Wasteland
    dw $A768    ; Botwoon Hallway door 0 --> Aqueduct
    dw $A5AC    ; Plasma Spark door 1 --> Aqueduct Tube
    dw $A8AC    ; Botwoon Quicksand door 0 --> Below Botwoon Energy Tank
    dw $A8B8    ; Botwoon Quicksand door 1 --> Below Botwoon Energy Tank
    dw $A864    ; Botwoon Energy Tank door 2 --> Botwoon Quicksand
    dw $A858    ; Botwoon Energy Tank door 1 --> Botwoon Quicksand
    dw $A4E0    ; Pseudo Plasma Spark door 1 --> Crab Shaft
    dw $A720    ; Aqueduct door 2 --> East Aqueduct Quicksand
    dw $A6FC    ; East Aqueduct Quicksand door 1 --> East Sand Hole
    dw $A714    ; Aqueduct door 1 --> West Aqueduct Quicksand
    dw $A6E4    ; West Aqueduct Quicksand door 1 --> West Sand Hole

