
; ---------------
; Clear Enemies
; (autogenerated)
; ---------------

org !ORG_CLEAR_ENEMIES+$F000
print pc, " clearenemies start"
ClearEnemiesTable:

org !ORG_CLEAR_ENEMIES+$F3AF
dw $0001  ; BOYON      (boyon, bouncing gooball)

org !ORG_CLEAR_ENEMIES+$F3BF
dw $0001  ; STOKE      (mini-Crocomire)

org !ORG_CLEAR_ENEMIES+$F3CF
dw $0001  ; kame is Japanese for turtle)

org !ORG_CLEAR_ENEMIES+$F3DF
dw $0001  ;            (mini-tatori)

org !ORG_CLEAR_ENEMIES+$F3EF
dw $0001  ; PUYO       (puyo, thin hopping blobs)

org !ORG_CLEAR_ENEMIES+$F3FF
dw $0001  ; saboten is Japanese for cactus)

org !ORG_CLEAR_ENEMIES+$F40F
dw $0001  ; toge is Japanese for thorn)

org !ORG_CLEAR_ENEMIES+$F41F
dw $0000  ;            (gunship top)

org !ORG_CLEAR_ENEMIES+$F42F
dw $0000  ;            (gunship bottom / entrance pad)

org !ORG_CLEAR_ENEMIES+$F43F
dw $0001  ; MERO       (mellow, pre-Bomb Torizo fly)

org !ORG_CLEAR_ENEMIES+$F44F
dw $0001  ; MELLA      (mella, under ice beam fly)

org !ORG_CLEAR_ENEMIES+$F45F
dw $0001  ; MEMU       (memu, pre-spring ball fly)

org !ORG_CLEAR_ENEMIES+$F46F
dw $0001  ; MULTI      (multiviola, Norfair erratic fireball)

org !ORG_CLEAR_ENEMIES+$F47F
dw $0001  ; POLYP      (lavaquake rocks)

org !ORG_CLEAR_ENEMIES+$F48F
dw $0001  ; rinko is Japanese for outline)

org !ORG_CLEAR_ENEMIES+$F49F
dw $0001  ; RIO        (rio, Brinstar flying enemy)

org !ORG_CLEAR_ENEMIES+$F4AF
dw $0001  ; SQUEEWPT   (squeept, Norfair lava-jumping enemy)

org !ORG_CLEAR_ENEMIES+$F4BF
dw $0001  ; GERUDA     (geruta, Norfair rio)

org !ORG_CLEAR_ENEMIES+$F4CF
dw $0001  ; HOLTZ      (holtz, Lower Norfair rio)

org !ORG_CLEAR_ENEMIES+$F4DF
dw $0001  ; OUM        (oum, Maridia large indestructible snails)

org !ORG_CLEAR_ENEMIES+$F4EF
dw $0001  ; hiru is Japanese for leech)

org !ORG_CLEAR_ENEMIES+$F4FF
dw $0001  ; RIPPER2    (gripper, grapplable jet powered ripper)

org !ORG_CLEAR_ENEMIES+$F50F
dw $0001  ; RIPPER2    (ripper ii, jet powered ripper)

org !ORG_CLEAR_ENEMIES+$F51F
dw $0001  ; RIPPER     (ripper)

org !ORG_CLEAR_ENEMIES+$F52F
dw $0001  ; DRAGON     (dragon, lava seahorse)

org !ORG_CLEAR_ENEMIES+$F53F
dw $0000  ; SHUTTER    (timed shutter)

org !ORG_CLEAR_ENEMIES+$F54F
dw $0000  ; SHUTTER2   (shootable shutter)

org !ORG_CLEAR_ENEMIES+$F55F
dw $0000  ; SHUTTER2   (horizontal shootable shutter)

org !ORG_CLEAR_ENEMIES+$F56F
dw $0000  ; SHUTTER2   (destroyable timed shutter)

org !ORG_CLEAR_ENEMIES+$F57F
dw $0000  ; SHUTTER2   (rising and falling platform)

org !ORG_CLEAR_ENEMIES+$F58F
dw $0001  ; WAVER      (waver, wave-like path travelling enemy)

org !ORG_CLEAR_ENEMIES+$F59F
dw $0001  ; METALEE    (metaree, metal skree)

org !ORG_CLEAR_ENEMIES+$F5AF
dw $0001  ; hotaru is Japanese for firefly)

org !ORG_CLEAR_ENEMIES+$F5BF
dw $0001  ; FISH       (skultera, Maridia fish)

org !ORG_CLEAR_ENEMIES+$F5CF
dw $0000  ;            (elevator)

org !ORG_CLEAR_ENEMIES+$F5DF
dw $0001  ; kani is Japanese for crab)

org !ORG_CLEAR_ENEMIES+$F5EF
dw $0001  ; OUMU       (zero, slug)

org !ORG_CLEAR_ENEMIES+$F5FF
dw $0000  ; KAMER      (tripper, fast-moving slowly-sinking platform)

org !ORG_CLEAR_ENEMIES+$F60F
dw $0000  ; KAMER      (platform that falls with Samus' weight)

org !ORG_CLEAR_ENEMIES+$F61F
dw $0001  ; SBUG       (roach, flies away from Samus)

org !ORG_CLEAR_ENEMIES+$F62F
dw $0001  ; SBUG       (roach, unused/broken)

org !ORG_CLEAR_ENEMIES+$F63F
dw $0001  ; METMOD     (mochtroid, pre-Botwoon fake metroids)

org !ORG_CLEAR_ENEMIES+$F64F
dw $0001  ; SSIDE      (sidehopper)

org !ORG_CLEAR_ENEMIES+$F65F
dw $0001  ; SDEATH     (desgeega)

org !ORG_CLEAR_ENEMIES+$F66F
dw $0001  ; SIDE       (super-sidehopper)

org !ORG_CLEAR_ENEMIES+$F67F
dw $0001  ; SIDE       (Tourian super-sidehopper)

org !ORG_CLEAR_ENEMIES+$F68F
dw $0001  ; DESSGEEGA  (super-desgeega)

org !ORG_CLEAR_ENEMIES+$F69F
dw $0001  ; ZOA        (zoa, Maridia refill candy)

org !ORG_CLEAR_ENEMIES+$F6AF
dw $0001  ; VIOLA      (viola, Norfair slow fireball)

org !ORG_CLEAR_ENEMIES+$F6BF
dw $0001  ;            (respawning enemy placeholder)

org !ORG_CLEAR_ENEMIES+$F6CF
dw $0001  ; BANG       (bang)

org !ORG_CLEAR_ENEMIES+$F6DF
dw $0001  ; SKREE      (skree)

org !ORG_CLEAR_ENEMIES+$F6EF
dw $0001  ; YARD       (yard, Maridia snail)

org !ORG_CLEAR_ENEMIES+$F6FF
dw $0001  ; REFLEC     (reflec)

org !ORG_CLEAR_ENEMIES+$F70F
dw $0000  ; HZOOMER    (Wrecked Ship orange zoomer)

org !ORG_CLEAR_ENEMIES+$F71F
dw $0001  ; ZEELA      (zeela, big eye bugs)

org !ORG_CLEAR_ENEMIES+$F72F
dw $0001  ; NOVA       (sova, fire zoomer)

org !ORG_CLEAR_ENEMIES+$F73F
dw $0001  ; ZOOMER     (zoomer)

org !ORG_CLEAR_ENEMIES+$F74F
dw $0001  ; MZOOMER    (stone zoomer)

org !ORG_CLEAR_ENEMIES+$F75F
dw $0001  ; METROID    (metroid)

org !ORG_CLEAR_ENEMIES+$F76F
dw $0000  ;            (Crocomire)

org !ORG_CLEAR_ENEMIES+$F77F
dw $0000  ;            (Crocomire's tongue)

org !ORG_CLEAR_ENEMIES+$F78F
dw $0000  ;            (Draygon body)

org !ORG_CLEAR_ENEMIES+$F79F
dw $0000  ;            (Draygon eye)

org !ORG_CLEAR_ENEMIES+$F7AF
dw $0000  ;            (Draygon tail)

org !ORG_CLEAR_ENEMIES+$F7BF
dw $0000  ;            (Draygon arms)

org !ORG_CLEAR_ENEMIES+$F7CF
dw $0000  ;            (Spore Spawn)

org !ORG_CLEAR_ENEMIES+$F7DF
dw $0000  ;            (Spore Spawn)

org !ORG_CLEAR_ENEMIES+$F7EF
dw $0001  ; RSTONE     (boulder)

org !ORG_CLEAR_ENEMIES+$F7FF
dw $0000  ; KZAN       (spikey platform top)

org !ORG_CLEAR_ENEMIES+$F80F
dw $0000  ;            (spikey platform bottom)

org !ORG_CLEAR_ENEMIES+$F81F
dw $0001  ; HIBASHI    (fire geyser)

org !ORG_CLEAR_ENEMIES+$F82F
dw $0001  ; PUROMI     (nuclear waffle)

org !ORG_CLEAR_ENEMIES+$F83F
dw $0001  ; SCLAYD     (mini-Kraid)

org !ORG_CLEAR_ENEMIES+$F84F
dw $0000  ;            (Ceres Ridley)

org !ORG_CLEAR_ENEMIES+$F85F
dw $0000  ;            (Ridley)

org !ORG_CLEAR_ENEMIES+$F86F
dw $0000  ;            (Ridley's explosion)

org !ORG_CLEAR_ENEMIES+$F87F
dw $0001  ;            (Ceres steam)

org !ORG_CLEAR_ENEMIES+$F88F
dw $0000  ;            (Ceres door)

org !ORG_CLEAR_ENEMIES+$F89F
dw $0000  ;            (zebetites)

org !ORG_CLEAR_ENEMIES+$F8AF
dw $0000  ;            (Kraid)

org !ORG_CLEAR_ENEMIES+$F8BF
dw $0000  ;            (Kraid's arm)

org !ORG_CLEAR_ENEMIES+$F8CF
dw $0000  ;            (Kraid top lint)

org !ORG_CLEAR_ENEMIES+$F8DF
dw $0000  ;            (Kraid middle lint)

org !ORG_CLEAR_ENEMIES+$F8EF
dw $0000  ;            (Kraid bottom lint)

org !ORG_CLEAR_ENEMIES+$F8FF
dw $0000  ;            (Kraid's foot)

org !ORG_CLEAR_ENEMIES+$F90F
dw $0000  ;            (Kraid good fingernail)

org !ORG_CLEAR_ENEMIES+$F91F
dw $0000  ;            (Kraid bad fingernail)

org !ORG_CLEAR_ENEMIES+$F92F
dw $0000  ;            (Phantoon body)

org !ORG_CLEAR_ENEMIES+$F93F
dw $0000  ;            (Phantoon eye)

org !ORG_CLEAR_ENEMIES+$F94F
dw $0000  ;            (Phantoon tentacles)

org !ORG_CLEAR_ENEMIES+$F95F
dw $0000  ;            (Phantoon mouth)

org !ORG_CLEAR_ENEMIES+$F96F
dw $0000  ;            (etecoon)

org !ORG_CLEAR_ENEMIES+$F97F
dw $0000  ;            (dachora)

org !ORG_CLEAR_ENEMIES+$F98F
dw $0001  ; ebi is Japanese for prawn)

org !ORG_CLEAR_ENEMIES+$F99F
dw $0001  ;            (evir projectile)

org !ORG_CLEAR_ENEMIES+$F9AF
dw $0000  ; EYE        (morph ball eye)

org !ORG_CLEAR_ENEMIES+$F9BF
dw $0001  ; fune is Japanese for boat)

org !ORG_CLEAR_ENEMIES+$F9CF
dw $0000  ; nami is Japanese for wave)

org !ORG_CLEAR_ENEMIES+$F9DF
dw $0001  ; GAI        (coven, Wrecked Ship ghost)

org !ORG_CLEAR_ENEMIES+$F9EF
dw $0001  ; HAND       (yapping maw)

org !ORG_CLEAR_ENEMIES+$F9FF
dw $0001  ; kago is Japanese for cage)

org !ORG_CLEAR_ENEMIES+$FA0F
dw $0001  ; LAVAMAN    (magdollite, Norfair lava creature)

org !ORG_CLEAR_ENEMIES+$FA1F
dw $0001  ; nomi is Japanese for flea)

org !ORG_CLEAR_ENEMIES+$FA2F
dw $0001  ; PUU        (powamp, Maridia floater)

org !ORG_CLEAR_ENEMIES+$FA3F
dw $0000  ; ROBO       (Wrecked Ship robot)

org !ORG_CLEAR_ENEMIES+$FA4F
dw $0000  ; ROBO2      (Wrecked Ship robot, deactivated)

org !ORG_CLEAR_ENEMIES+$FA5F
dw $0001  ; PIPE       (bull, Maridia puffer)

org !ORG_CLEAR_ENEMIES+$FA6F
dw $0001  ; NDRA       (alcoon, walking lava seahorse)

org !ORG_CLEAR_ENEMIES+$FA7F
dw $0001  ; ATOMIC     (atomic, Wrecked Ship orbs)

org !ORG_CLEAR_ENEMIES+$FA8F
dw $0000  ; SPA        (Wrecked Ship spark)

org !ORG_CLEAR_ENEMIES+$FA9F
dw $0000  ; KOMA       (blue Brinstar face block)

org !ORG_CLEAR_ENEMIES+$FAAF
dw $0001  ; hachi is Japanese for bee)

org !ORG_CLEAR_ENEMIES+$FABF
dw $0001  ;            (green ki-hunter wings)

org !ORG_CLEAR_ENEMIES+$FACF
dw $0001  ; HACHI2     (yellow ki-hunter)

org !ORG_CLEAR_ENEMIES+$FADF
dw $0001  ;            (yellow ki-hunter wings)

org !ORG_CLEAR_ENEMIES+$FAEF
dw $0001  ; HACHI3     (red ki-hunter)

org !ORG_CLEAR_ENEMIES+$FAFF
dw $0001  ;            (red ki-hunter wings)

org !ORG_CLEAR_ENEMIES+$FB0F
dw $0000  ;            (Mother Brain's brain)

org !ORG_CLEAR_ENEMIES+$FB1F
dw $0000  ;            (Mother Brain's body)

org !ORG_CLEAR_ENEMIES+$FB2F
dw $0000  ;            (Shitroid in cutscene)

org !ORG_CLEAR_ENEMIES+$FB3F
dw $0000  ;            (Mother Brain's tubes falling)

org !ORG_CLEAR_ENEMIES+$FB4F
dw $0000  ;            (dead Torizo)

org !ORG_CLEAR_ENEMIES+$FB5F
dw $0000  ;            (dead sidehopper)

org !ORG_CLEAR_ENEMIES+$FB6F
dw $0000  ;            (dead sidehopper, part 2). Used only to load more tiles

org !ORG_CLEAR_ENEMIES+$FB7F
dw $0000  ;            (dead zoomer)

org !ORG_CLEAR_ENEMIES+$FB8F
dw $0000  ;            (dead ripper)

org !ORG_CLEAR_ENEMIES+$FB9F
dw $0000  ;            (dead skree)

org !ORG_CLEAR_ENEMIES+$FBAF
dw $0000  ;            (Shitroid)

org !ORG_CLEAR_ENEMIES+$FBBF
dw $0000  ;            (Bomb Torizo)

org !ORG_CLEAR_ENEMIES+$FBCF
dw $0000  ;            (Bomb Torizo orb)

org !ORG_CLEAR_ENEMIES+$FBDF
dw $0000  ;            (Gold Torizo)

org !ORG_CLEAR_ENEMIES+$FBEF
dw $0000  ;            (Gold Torizo orb)

org !ORG_CLEAR_ENEMIES+$FBFF
dw $0000  ;            (Tourian entrance statue)

org !ORG_CLEAR_ENEMIES+$FC0F
dw $0000  ;            (Tourian entrance statue ghost)

org !ORG_CLEAR_ENEMIES+$FC1F
dw $0000  ; doriyuku is Japanese for effort)

org !ORG_CLEAR_ENEMIES+$FC2F
dw $0000  ;            (n00b tube cracks)

org !ORG_CLEAR_ENEMIES+$FC3F
dw $0000  ;            (Chozo statue)

org !ORG_CLEAR_ENEMIES+$FC54
dw $0000  ;            (unused spinning turtle eye: just runs a graphics instruction loop)

org !ORG_CLEAR_ENEMIES+$FC64
dw $0001  ; ZEB        (zeb, Brinstar red pipe bug)

org !ORG_CLEAR_ENEMIES+$FC74
dw $0001  ; ZEBBO      (zebbo, Brinstar green pipe bug)

org !ORG_CLEAR_ENEMIES+$FC84
dw $0001  ; GAMET      (gamet, Norfair pipe bug)

org !ORG_CLEAR_ENEMIES+$FC94
dw $0001  ; GEEGA      (geega, Brinstar yellow pipe bug)

org !ORG_CLEAR_ENEMIES+$FCA4
dw $0000  ; BOTOON     (Botwoon)

org !ORG_CLEAR_ENEMIES+$FCB4
dw $0000  ;            (escape etecoon)

org !ORG_CLEAR_ENEMIES+$FCC4
dw $0000  ;            (escape dachora)

org !ORG_CLEAR_ENEMIES+$FCD4
dw $0001  ; BATTA1     (old Tourian grey wall space pirate)

org !ORG_CLEAR_ENEMIES+$FCE4
dw $0001  ; BATTA1Br   (Kraid green wall space pirate)

org !ORG_CLEAR_ENEMIES+$FCF4
dw $0001  ; BATTA1No   (Norfair red wall space pirate)

org !ORG_CLEAR_ENEMIES+$FD04
dw $0001  ; BATTA1Na   (lower Norfair gold wall space pirate)

org !ORG_CLEAR_ENEMIES+$FD14
dw $0001  ; BATTA1Ma   (Maridia wall space pirate)

org !ORG_CLEAR_ENEMIES+$FD24
dw $0001  ; BATTA1Tu   (escape silver wall space pirate)

org !ORG_CLEAR_ENEMIES+$FD34
dw $0001  ; BATTA2     (grey ninja space pirate)

org !ORG_CLEAR_ENEMIES+$FD44
dw $0001  ; BATTA2Br   (green ninja space pirate)

org !ORG_CLEAR_ENEMIES+$FD54
dw $0001  ; BATTA2No   (red ninja space pirate)

org !ORG_CLEAR_ENEMIES+$FD64
dw $0001  ; BATTA2Na   (gold ninja space pirate)

org !ORG_CLEAR_ENEMIES+$FD74
dw $0001  ; BATTA2Ma   (magenta ninja space pirate)

org !ORG_CLEAR_ENEMIES+$FD84
dw $0001  ; BATTA2Tu   (escape silver ninja space pirate)

org !ORG_CLEAR_ENEMIES+$FD94
dw $0001  ; BATTA3     (grey walking space pirate)

org !ORG_CLEAR_ENEMIES+$FDA4
dw $0001  ; BATTA3Br   (green walking space pirate)

org !ORG_CLEAR_ENEMIES+$FDB4
dw $0001  ; BATTA3No   (red walking space pirate)

org !ORG_CLEAR_ENEMIES+$FDC4
dw $0001  ; BATTA3Na   (gold walking space pirate)

org !ORG_CLEAR_ENEMIES+$FDD4
dw $0001  ; BATTA3Ma   (magenta walking space pirate)

org !ORG_CLEAR_ENEMIES+$FDE4
dw $0001  ; BATTA3Tu   (escape silver walking space pirate)

print pc, " clearenemies end"

