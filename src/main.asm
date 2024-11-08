asar 1.81
lorom

table ../resources/normal.tbl
print ""

if !FEATURE_SD2SNES
    print "SD2SNES ENABLED"
    !FEATURE_TINYSTATES = 0
    incsrc macros.asm
    incsrc defines.asm
    incsrc save.asm
else
if !FEATURE_TINYSTATES
    print "TINYSTATES ENABLED"
    !FEATURE_SD2SNES = 1       ; Set this to enable savestate features
    incsrc macros.asm
    incsrc defines.asm
    incsrc tinystates.asm
else
    print "SD2SNES AND TINYSTATES DISABLED"
    incsrc macros.asm
    incsrc defines.asm
endif
endif

incsrc gamemode.asm
incsrc minimap.asm
incsrc menu.asm
incsrc roomnames.asm
incsrc clearenemies.asm
incsrc infohud.asm
incsrc rng.asm
incsrc custompresets.asm
incsrc presets.asm
incsrc misc.asm
incsrc init.asm
incsrc spriteprio.asm
incsrc spritefeat.asm

if !FEATURE_DEV
    incsrc symbols.asm
endif

