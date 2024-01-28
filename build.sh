#!/bin/bash

# Return an error if any command fails
success=0
trap success=1 ERR

VERSION_REV=2
SIMPLE_NAME=smarcadehack_v1.06.${VERSION_REV}_simple
SAVELESS_NAME=smarcadehack_v1.06.${VERSION_REV}_saveless
SD2SNES_NAME=smarcadehack_v1.06.${VERSION_REV}_sd2snes

mkdir -p build

echo "Building SM Arcade Hack"
python3 layout/create_layout.py portals.txt layoutmenutemplate.asm ../src/layoutmenu.asm ../src/layoutportaltables.asm
python3 names/create_names.py ../src/roomnames.asm default_names.txt custom_names.txt
cd resources
python3 create_ram_symbols.py ../src/defines.asm ../src/symbols.asm
python3 create_dummies.py 00.sfc ff.sfc

echo "Building simple version"
cp *.sfc ../build
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/Debugging_Symbols.sym -DFEATURE_PRESETS=0 -DFEATURE_SD2SNES=0 -DVERSION_REV=${VERSION_REV} "$@" ../src/main.asm ../build/00.sfc
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/Debugging_Symbols.sym -DFEATURE_PRESETS=0 -DFEATURE_SD2SNES=0 -DVERSION_REV=${VERSION_REV} "$@" ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/Debugging_Symbols.sym x x
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/${SIMPLE_NAME}.ips

echo "Building saveless version"
cp *.sfc ../build
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=0 -DVERSION_REV=${VERSION_REV} "$@" ../src/main.asm ../build/00.sfc
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=0 -DVERSION_REV=${VERSION_REV} "$@" ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/Debugging_Symbols.sym x x
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/${SAVELESS_NAME}.ips

echo "Building SD2SNES version"
cp *.sfc ../build
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=1 -DVERSION_REV=${VERSION_REV} "$@" ../src/main.asm ../build/00.sfc
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=1 -DVERSION_REV=${VERSION_REV} "$@" ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/Debugging_Symbols.sym ..\build\Debugging_Sorted.sym ..\build\Debugging_Combined.sym
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/${SD2SNES_NAME}.ips

rm 00.sfc ff.sfc ../build/00.sfc ../build/ff.sfc
cd ..

exit $success
