
; ---------------
; Clear Enemies
; (autogenerated)
; ---------------

org $E7F000
print pc, " clearenemies start"
ClearEnemiesTable:

if !FEATURE_PAL
org $E7F3B7
else
org $E7F3AF
endif
dw $0001  ; BOYON      (boyon, bouncing gooball)

if !FEATURE_PAL
org $E7F3C7
else
org $E7F3BF
endif
dw $0001  ; STOKE      (mini-Crocomire)

if !FEATURE_PAL
org $E7F3D7
else
org $E7F3CF
endif
dw $0001  ; kame is Japanese for turtle)

if !FEATURE_PAL
org $E7F3E7
else
org $E7F3DF
endif
dw $0001  ;            (mini-tatori)

if !FEATURE_PAL
org $E7F3F7
else
org $E7F3EF
endif
dw $0001  ; PUYO       (puyo, thin hopping blobs)

if !FEATURE_PAL
org $E7F407
else
org $E7F3FF
endif
dw $0001  ; saboten is Japanese for cactus)

if !FEATURE_PAL
org $E7F417
else
org $E7F40F
endif
dw $0001  ; toge is Japanese for thorn)

if !FEATURE_PAL
org $E7F427
else
org $E7F41F
endif
dw $0000  ;            (gunship top)

if !FEATURE_PAL
org $E7F437
else
org $E7F42F
endif
dw $0000  ;            (gunship bottom / entrance pad)

if !FEATURE_PAL
org $E7F447
else
org $E7F43F
endif
dw $0001  ; MERO       (mellow, pre-Bomb Torizo fly)

if !FEATURE_PAL
org $E7F457
else
org $E7F44F
endif
dw $0001  ; MELLA      (mella, under ice beam fly)

if !FEATURE_PAL
org $E7F467
else
org $E7F45F
endif
dw $0001  ; MEMU       (memu, pre-spring ball fly)

if !FEATURE_PAL
org $E7F477
else
org $E7F46F
endif
dw $0001  ; MULTI      (multiviola, Norfair erratic fireball)

if !FEATURE_PAL
org $E7F487
else
org $E7F47F
endif
dw $0001  ; POLYP      (lavaquake rocks)

if !FEATURE_PAL
org $E7F497
else
org $E7F48F
endif
dw $0001  ; rinko is Japanese for outline)

if !FEATURE_PAL
org $E7F4A7
else
org $E7F49F
endif
dw $0001  ; RIO        (rio, Brinstar flying enemy)

if !FEATURE_PAL
org $E7F4B7
else
org $E7F4AF
endif
dw $0001  ; SQUEEWPT   (squeept, Norfair lava-jumping enemy)

if !FEATURE_PAL
org $E7F4C7
else
org $E7F4BF
endif
dw $0001  ; GERUDA     (geruta, Norfair rio)

if !FEATURE_PAL
org $E7F4D7
else
org $E7F4CF
endif
dw $0001  ; HOLTZ      (holtz, Lower Norfair rio)

if !FEATURE_PAL
org $E7F4E7
else
org $E7F4DF
endif
dw $0001  ; OUM        (oum, Maridia large indestructible snails)

if !FEATURE_PAL
org $E7F4F7
else
org $E7F4EF
endif
dw $0001  ; hiru is Japanese for leech)

if !FEATURE_PAL
org $E7F507
else
org $E7F4FF
endif
dw $0001  ; RIPPER2    (gripper, grapplable jet powered ripper)

if !FEATURE_PAL
org $E7F517
else
org $E7F50F
endif
dw $0001  ; RIPPER2    (ripper ii, jet powered ripper)

if !FEATURE_PAL
org $E7F527
else
org $E7F51F
endif
dw $0001  ; RIPPER     (ripper)

if !FEATURE_PAL
org $E7F537
else
org $E7F52F
endif
dw $0001  ; DRAGON     (dragon, lava seahorse)

if !FEATURE_PAL
org $E7F547
else
org $E7F53F
endif
dw $0000  ; SHUTTER    (timed shutter)

if !FEATURE_PAL
org $E7F557
else
org $E7F54F
endif
dw $0000  ; SHUTTER2   (shootable shutter)

if !FEATURE_PAL
org $E7F567
else
org $E7F55F
endif
dw $0000  ; SHUTTER2   (horizontal shootable shutter)

if !FEATURE_PAL
org $E7F577
else
org $E7F56F
endif
dw $0000  ; SHUTTER2   (destroyable timed shutter)

if !FEATURE_PAL
org $E7F587
else
org $E7F57F
endif
dw $0000  ; SHUTTER2   (rising and falling platform)

if !FEATURE_PAL
org $E7F597
else
org $E7F58F
endif
dw $0001  ; WAVER      (waver, wave-like path travelling enemy)

if !FEATURE_PAL
org $E7F5A7
else
org $E7F59F
endif
dw $0001  ; METALEE    (metaree, metal skree)

if !FEATURE_PAL
org $E7F5B7
else
org $E7F5AF
endif
dw $0001  ; hotaru is Japanese for firefly)

if !FEATURE_PAL
org $E7F5C7
else
org $E7F5BF
endif
dw $0001  ; FISH       (skultera, Maridia fish)

if !FEATURE_PAL
org $E7F5D7
else
org $E7F5CF
endif
dw $0000  ;            (elevator)

if !FEATURE_PAL
org $E7F5E7
else
org $E7F5DF
endif
dw $0001  ; kani is Japanese for crab)

if !FEATURE_PAL
org $E7F5F7
else
org $E7F5EF
endif
dw $0001  ; OUMU       (zero, slug)

if !FEATURE_PAL
org $E7F607
else
org $E7F5FF
endif
dw $0000  ; KAMER      (tripper, fast-moving slowly-sinking platform)

if !FEATURE_PAL
org $E7F617
else
org $E7F60F
endif
dw $0000  ; KAMER      (platform that falls with Samus' weight)

if !FEATURE_PAL
org $E7F627
else
org $E7F61F
endif
dw $0001  ; SBUG       (roach, flies away from Samus)

if !FEATURE_PAL
org $E7F637
else
org $E7F62F
endif
dw $0001  ; SBUG       (roach, unused/broken)

if !FEATURE_PAL
org $E7F647
else
org $E7F63F
endif
dw $0001  ; METMOD     (mochtroid, pre-Botwoon fake metroids)

if !FEATURE_PAL
org $E7F657
else
org $E7F64F
endif
dw $0001  ; SSIDE      (sidehopper)

if !FEATURE_PAL
org $E7F667
else
org $E7F65F
endif
dw $0001  ; SDEATH     (desgeega)

if !FEATURE_PAL
org $E7F677
else
org $E7F66F
endif
dw $0001  ; SIDE       (super-sidehopper)

if !FEATURE_PAL
org $E7F687
else
org $E7F67F
endif
dw $0001  ; SIDE       (Tourian super-sidehopper)

if !FEATURE_PAL
org $E7F697
else
org $E7F68F
endif
dw $0001  ; DESSGEEGA  (super-desgeega)

if !FEATURE_PAL
org $E7F6A7
else
org $E7F69F
endif
dw $0001  ; ZOA        (zoa, Maridia refill candy)

if !FEATURE_PAL
org $E7F6B7
else
org $E7F6AF
endif
dw $0001  ; VIOLA      (viola, Norfair slow fireball)

if !FEATURE_PAL
org $E7F6C7
else
org $E7F6BF
endif
dw $0001  ;            (respawning enemy placeholder)

if !FEATURE_PAL
org $E7F6D7
else
org $E7F6CF
endif
dw $0001  ; BANG       (bang)

if !FEATURE_PAL
org $E7F6E7
else
org $E7F6DF
endif
dw $0001  ; SKREE      (skree)

if !FEATURE_PAL
org $E7F6F7
else
org $E7F6EF
endif
dw $0001  ; YARD       (yard, Maridia snail)

if !FEATURE_PAL
org $E7F707
else
org $E7F6FF
endif
dw $0001  ; REFLEC     (reflec)

if !FEATURE_PAL
org $E7F717
else
org $E7F70F
endif
dw $0000  ; HZOOMER    (Wrecked Ship orange zoomer)

if !FEATURE_PAL
org $E7F727
else
org $E7F71F
endif
dw $0001  ; ZEELA      (zeela, big eye bugs)

if !FEATURE_PAL
org $E7F737
else
org $E7F72F
endif
dw $0001  ; NOVA       (sova, fire zoomer)

if !FEATURE_PAL
org $E7F747
else
org $E7F73F
endif
dw $0001  ; ZOOMER     (zoomer)

if !FEATURE_PAL
org $E7F757
else
org $E7F74F
endif
dw $0001  ; MZOOMER    (stone zoomer)

if !FEATURE_PAL
org $E7F767
else
org $E7F75F
endif
dw $0001  ; METROID    (metroid)

if !FEATURE_PAL
org $E7F777
else
org $E7F76F
endif
dw $0000  ;            (Crocomire)

if !FEATURE_PAL
org $E7F787
else
org $E7F77F
endif
dw $0000  ;            (Crocomire's tongue)

if !FEATURE_PAL
org $E7F797
else
org $E7F78F
endif
dw $0000  ;            (Draygon body)

if !FEATURE_PAL
org $E7F7A7
else
org $E7F79F
endif
dw $0000  ;            (Draygon eye)

if !FEATURE_PAL
org $E7F7B7
else
org $E7F7AF
endif
dw $0000  ;            (Draygon tail)

if !FEATURE_PAL
org $E7F7C7
else
org $E7F7BF
endif
dw $0000  ;            (Draygon arms)

if !FEATURE_PAL
org $E7F7D7
else
org $E7F7CF
endif
dw $0000  ;            (Spore Spawn)

if !FEATURE_PAL
org $E7F7E7
else
org $E7F7DF
endif
dw $0000  ;            (Spore Spawn)

if !FEATURE_PAL
org $E7F7F7
else
org $E7F7EF
endif
dw $0001  ; RSTONE     (boulder)

if !FEATURE_PAL
org $E7F807
else
org $E7F7FF
endif
dw $0000  ; KZAN       (spikey platform top)

if !FEATURE_PAL
org $E7F817
else
org $E7F80F
endif
dw $0000  ;            (spikey platform bottom)

if !FEATURE_PAL
org $E7F827
else
org $E7F81F
endif
dw $0000  ; HIBASHI    (fire geyser)

if !FEATURE_PAL
org $E7F837
else
org $E7F82F
endif
dw $0001  ; PUROMI     (nuclear waffle)

if !FEATURE_PAL
org $E7F847
else
org $E7F83F
endif
dw $0001  ; SCLAYD     (mini-Kraid)

if !FEATURE_PAL
org $E7F857
else
org $E7F84F
endif
dw $0000  ;            (Ceres Ridley)

if !FEATURE_PAL
org $E7F867
else
org $E7F85F
endif
dw $0000  ;            (Ridley)

if !FEATURE_PAL
org $E7F877
else
org $E7F86F
endif
dw $0000  ;            (Ridley's explosion)

if !FEATURE_PAL
org $E7F887
else
org $E7F87F
endif
dw $0001  ;            (Ceres steam)

if !FEATURE_PAL
org $E7F897
else
org $E7F88F
endif
dw $0000  ;            (Ceres door)

if !FEATURE_PAL
org $E7F8A7
else
org $E7F89F
endif
dw $0000  ;            (zebetites)

if !FEATURE_PAL
org $E7F8B7
else
org $E7F8AF
endif
dw $0000  ;            (Kraid)

if !FEATURE_PAL
org $E7F8C7
else
org $E7F8BF
endif
dw $0000  ;            (Kraid's arm)

if !FEATURE_PAL
org $E7F8D7
else
org $E7F8CF
endif
dw $0000  ;            (Kraid top lint)

if !FEATURE_PAL
org $E7F8E7
else
org $E7F8DF
endif
dw $0000  ;            (Kraid middle lint)

if !FEATURE_PAL
org $E7F8F7
else
org $E7F8EF
endif
dw $0000  ;            (Kraid bottom lint)

if !FEATURE_PAL
org $E7F907
else
org $E7F8FF
endif
dw $0000  ;            (Kraid's foot)

if !FEATURE_PAL
org $E7F917
else
org $E7F90F
endif
dw $0000  ;            (Kraid good fingernail)

if !FEATURE_PAL
org $E7F927
else
org $E7F91F
endif
dw $0000  ;            (Kraid bad fingernail)

if !FEATURE_PAL
org $E7F937
else
org $E7F92F
endif
dw $0000  ;            (Phantoon body)

if !FEATURE_PAL
org $E7F947
else
org $E7F93F
endif
dw $0000  ;            (Phantoon eye)

if !FEATURE_PAL
org $E7F957
else
org $E7F94F
endif
dw $0000  ;            (Phantoon tentacles)

if !FEATURE_PAL
org $E7F967
else
org $E7F95F
endif
dw $0000  ;            (Phantoon mouth)

if !FEATURE_PAL
org $E7F977
else
org $E7F96F
endif
dw $0000  ;            (etecoon)

if !FEATURE_PAL
org $E7F987
else
org $E7F97F
endif
dw $0000  ;            (dachora)

if !FEATURE_PAL
org $E7F997
else
org $E7F98F
endif
dw $0001  ; ebi is Japanese for prawn)

if !FEATURE_PAL
org $E7F9A7
else
org $E7F99F
endif
dw $0001  ;            (evir projectile)

if !FEATURE_PAL
org $E7F9B7
else
org $E7F9AF
endif
dw $0000  ; EYE        (morph ball eye)

if !FEATURE_PAL
org $E7F9C7
else
org $E7F9BF
endif
dw $0001  ; fune is Japanese for boat)

if !FEATURE_PAL
org $E7F9D7
else
org $E7F9CF
endif
dw $0000  ; nami is Japanese for wave)

if !FEATURE_PAL
org $E7F9E7
else
org $E7F9DF
endif
dw $0001  ; GAI        (coven, Wrecked Ship ghost)

if !FEATURE_PAL
org $E7F9F7
else
org $E7F9EF
endif
dw $0001  ; HAND       (yapping maw)

if !FEATURE_PAL
org $E7FA07
else
org $E7F9FF
endif
dw $0001  ; kago is Japanese for cage)

if !FEATURE_PAL
org $E7FA17
else
org $E7FA0F
endif
dw $0001  ; LAVAMAN    (magdollite, Norfair lava creature)

if !FEATURE_PAL
org $E7FA27
else
org $E7FA1F
endif
dw $0001  ; nomi is Japanese for flea)

if !FEATURE_PAL
org $E7FA37
else
org $E7FA2F
endif
dw $0001  ; PUU        (powamp, Maridia floater)

if !FEATURE_PAL
org $E7FA47
else
org $E7FA3F
endif
dw $0000  ; ROBO       (Wrecked Ship robot)

if !FEATURE_PAL
org $E7FA57
else
org $E7FA4F
endif
dw $0000  ; ROBO2      (Wrecked Ship robot, deactivated)

if !FEATURE_PAL
org $E7FA67
else
org $E7FA5F
endif
dw $0001  ; PIPE       (bull, Maridia puffer)

if !FEATURE_PAL
org $E7FA77
else
org $E7FA6F
endif
dw $0001  ; NDRA       (alcoon, walking lava seahorse)

if !FEATURE_PAL
org $E7FA87
else
org $E7FA7F
endif
dw $0001  ; ATOMIC     (atomic, Wrecked Ship orbs)

if !FEATURE_PAL
org $E7FA97
else
org $E7FA8F
endif
dw $0000  ; SPA        (Wrecked Ship spark)

if !FEATURE_PAL
org $E7FAA7
else
org $E7FA9F
endif
dw $0000  ; KOMA       (blue Brinstar face block)

if !FEATURE_PAL
org $E7FAB7
else
org $E7FAAF
endif
dw $0001  ; hachi is Japanese for bee)

if !FEATURE_PAL
org $E7FAC7
else
org $E7FABF
endif
dw $0001  ;            (green ki-hunter wings)

if !FEATURE_PAL
org $E7FAD7
else
org $E7FACF
endif
dw $0001  ; HACHI2     (yellow ki-hunter)

if !FEATURE_PAL
org $E7FAE7
else
org $E7FADF
endif
dw $0001  ;            (yellow ki-hunter wings)

if !FEATURE_PAL
org $E7FAF7
else
org $E7FAEF
endif
dw $0001  ; HACHI3     (red ki-hunter)

if !FEATURE_PAL
org $E7FB07
else
org $E7FAFF
endif
dw $0001  ;            (red ki-hunter wings)

if !FEATURE_PAL
org $E7FB17
else
org $E7FB0F
endif
dw $0000  ;            (Mother Brain's brain)

if !FEATURE_PAL
org $E7FB27
else
org $E7FB1F
endif
dw $0000  ;            (Mother Brain's body)

if !FEATURE_PAL
org $E7FB37
else
org $E7FB2F
endif
dw $0000  ;            (Shitroid in cutscene)

if !FEATURE_PAL
org $E7FB47
else
org $E7FB3F
endif
dw $0000  ;            (Mother Brain's tubes falling)

if !FEATURE_PAL
org $E7FB57
else
org $E7FB4F
endif
dw $0000  ;            (dead Torizo)

if !FEATURE_PAL
org $E7FB67
else
org $E7FB5F
endif
dw $0000  ;            (dead sidehopper)

if !FEATURE_PAL
org $E7FB77
else
org $E7FB6F
endif
dw $0000  ;            (dead sidehopper, part 2). Used only to load more tiles

if !FEATURE_PAL
org $E7FB87
else
org $E7FB7F
endif
dw $0000  ;            (dead zoomer)

if !FEATURE_PAL
org $E7FB97
else
org $E7FB8F
endif
dw $0000  ;            (dead ripper)

if !FEATURE_PAL
org $E7FBA7
else
org $E7FB9F
endif
dw $0000  ;            (dead skree)

if !FEATURE_PAL
org $E7FBB7
else
org $E7FBAF
endif
dw $0000  ;            (Shitroid)

if !FEATURE_PAL
org $E7FBC7
else
org $E7FBBF
endif
dw $0000  ;            (Bomb Torizo)

if !FEATURE_PAL
org $E7FBD7
else
org $E7FBCF
endif
dw $0000  ;            (Bomb Torizo orb)

if !FEATURE_PAL
org $E7FBE7
else
org $E7FBDF
endif
dw $0000  ;            (Gold Torizo)

if !FEATURE_PAL
org $E7FBF7
else
org $E7FBEF
endif
dw $0000  ;            (Gold Torizo orb)

if !FEATURE_PAL
org $E7FC07
else
org $E7FBFF
endif
dw $0000  ;            (Tourian entrance statue)

if !FEATURE_PAL
org $E7FC17
else
org $E7FC0F
endif
dw $0000  ;            (Tourian entrance statue ghost)

if !FEATURE_PAL
org $E7FC27
else
org $E7FC1F
endif
dw $0000  ; doriyuku is Japanese for effort)

if !FEATURE_PAL
org $E7FC37
else
org $E7FC2F
endif
dw $0000  ;            (n00b tube cracks)

if !FEATURE_PAL
org $E7FC47
else
org $E7FC3F
endif
dw $0000  ;            (Chozo statue)

if !FEATURE_PAL
org $E7FC5C
else
org $E7FC54
endif
dw $0000  ;            (unused spinning turtle eye: just runs a graphics instruction loop)

if !FEATURE_PAL
org $E7FC6C
else
org $E7FC64
endif
dw $0001  ; ZEB        (zeb, Brinstar red pipe bug)

if !FEATURE_PAL
org $E7FC7C
else
org $E7FC74
endif
dw $0001  ; ZEBBO      (zebbo, Brinstar green pipe bug)

if !FEATURE_PAL
org $E7FC8C
else
org $E7FC84
endif
dw $0001  ; GAMET      (gamet, Norfair pipe bug)

if !FEATURE_PAL
org $E7FC9C
else
org $E7FC94
endif
dw $0001  ; GEEGA      (geega, Brinstar yellow pipe bug)

if !FEATURE_PAL
org $E7FCAC
else
org $E7FCA4
endif
dw $0000  ; BOTOON     (Botwoon)

if !FEATURE_PAL
org $E7FCBC
else
org $E7FCB4
endif
dw $0000  ;            (escape etecoon)

if !FEATURE_PAL
org $E7FCCC
else
org $E7FCC4
endif
dw $0000  ;            (escape dachora)

if !FEATURE_PAL
org $E7FCDC
else
org $E7FCD4
endif
dw $0001  ; BATTA1     (old Tourian grey wall space pirate)

if !FEATURE_PAL
org $E7FCEC
else
org $E7FCE4
endif
dw $0001  ; BATTA1Br   (Kraid green wall space pirate)

if !FEATURE_PAL
org $E7FCFC
else
org $E7FCF4
endif
dw $0001  ; BATTA1No   (Norfair red wall space pirate)

if !FEATURE_PAL
org $E7FD0C
else
org $E7FD04
endif
dw $0001  ; BATTA1Na   (lower Norfair gold wall space pirate)

if !FEATURE_PAL
org $E7FD1C
else
org $E7FD14
endif
dw $0001  ; BATTA1Ma   (Maridia wall space pirate)

if !FEATURE_PAL
org $E7FD2C
else
org $E7FD24
endif
dw $0001  ; BATTA1Tu   (escape silver wall space pirate)

if !FEATURE_PAL
org $E7FD3C
else
org $E7FD34
endif
dw $0001  ; BATTA2     (grey ninja space pirate)

if !FEATURE_PAL
org $E7FD4C
else
org $E7FD44
endif
dw $0001  ; BATTA2Br   (green ninja space pirate)

if !FEATURE_PAL
org $E7FD5C
else
org $E7FD54
endif
dw $0001  ; BATTA2No   (red ninja space pirate)

if !FEATURE_PAL
org $E7FD6C
else
org $E7FD64
endif
dw $0001  ; BATTA2Na   (gold ninja space pirate)

if !FEATURE_PAL
org $E7FD7C
else
org $E7FD74
endif
dw $0001  ; BATTA2Ma   (magenta ninja space pirate)

if !FEATURE_PAL
org $E7FD8C
else
org $E7FD84
endif
dw $0001  ; BATTA2Tu   (escape silver ninja space pirate)

if !FEATURE_PAL
org $E7FD9C
else
org $E7FD94
endif
dw $0001  ; BATTA3     (grey walking space pirate)

if !FEATURE_PAL
org $E7FDAC
else
org $E7FDA4
endif
dw $0001  ; BATTA3Br   (green walking space pirate)

if !FEATURE_PAL
org $E7FDBC
else
org $E7FDB4
endif
dw $0001  ; BATTA3No   (red walking space pirate)

if !FEATURE_PAL
org $E7FDCC
else
org $E7FDC4
endif
dw $0001  ; BATTA3Na   (gold walking space pirate)

if !FEATURE_PAL
org $E7FDDC
else
org $E7FDD4
endif
dw $0001  ; BATTA3Ma   (magenta walking space pirate)

if !FEATURE_PAL
org $E7FDEC
else
org $E7FDE4
endif
dw $0001  ; BATTA3Tu   (escape silver walking space pirate)

print pc, " clearenemies end"

