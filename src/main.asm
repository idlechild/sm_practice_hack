lorom

!VERSION_MAJOR = 1
!VERSION_MINOR = 0
!VERSION_BUILD = 6

table ../resources/normal.tbl

incsrc macros.asm
incsrc arcademacros.asm
incsrc defines.asm

print ""

if !FEATURE_SD2SNES
    print "SD2SNES ENABLED"
    !FEATURE_PRESETS = 1
    incsrc save.asm
else
if !FEATURE_PRESETS
    print "PRESETS ENABLED"
else
    print "PRESETS DISABLED"
endif
endif

incsrc gamemode.asm
incsrc menu.asm
incsrc damage.asm
incsrc misc.asm
incsrc layout.asm
incsrc init.asm
incsrc spriteprio.asm
incsrc spritefeat.asm

if !FEATURE_PRESETS
    incsrc arcadepresets.asm
    incsrc presets.asm
    incsrc symbols.asm
endif

