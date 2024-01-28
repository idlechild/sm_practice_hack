@echo off
cls

set VERSION_REV=2
set SIMPLE_NAME=smarcadehack_v1.06.%VERSION_REV%_simple
set SAVELESS_NAME=smarcadehack_v1.06.%VERSION_REV%_saveless
set SD2SNES_NAME=smarcadehack_v1.06.%VERSION_REV%_sd2snes

if not exist build mkdir build

echo Building SM Arcade Hack
python layout\create_layout.py portals.txt layoutmenutemplate.asm ..\src\layoutmenu.asm ..\src\layoutportaltables.asm
python names\create_names.py ..\src\roomnames.asm default_names.txt custom_names.txt
cd resources
python create_ram_symbols.py ..\src\defines.asm ..\src\symbols.asm
python create_dummies.py 00.sfc ff.sfc

echo Building simple version
if exist ..\build\%SIMPLE_NAME%.ips del ..\build\%SIMPLE_NAME%.ips
copy *.sfc ..\build
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=0 -DFEATURE_SD2SNES=0 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\00.sfc
if ERRORLEVEL 1 goto end_build_simple
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=0 -DFEATURE_SD2SNES=0 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\ff.sfc
python sort_debug_symbols.py ..\build\Debugging_Symbols.sym x x
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\%SIMPLE_NAME%.ips
:end_build_simple

echo Building saveless version
if exist ..\build\%SAVELESS_NAME%.ips del ..\build\%SAVELESS_NAME%.ips
copy *.sfc ..\build
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=0 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\00.sfc
if ERRORLEVEL 1 goto end_build_saveless
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=0 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\ff.sfc
python sort_debug_symbols.py ..\build\Debugging_Symbols.sym x x
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\%SAVELESS_NAME%.ips
:end_build_saveless

echo Building SD2SNES version
if exist ..\build\%SD2SNES_NAME%.ips del ..\build\%SD2SNES_NAME%.ips
copy *.sfc ..\build
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=1 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\00.sfc
if ERRORLEVEL 1 goto end_build_sd2snes
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=1 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\ff.sfc
python sort_debug_symbols.py ..\build\Debugging_Symbols.sym ..\build\Debugging_Sorted.sym ..\build\Debugging_Combined.sym
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\%SD2SNES_NAME%.ips
:end_build_sd2snes

del 00.sfc ff.sfc ..\build\00.sfc ..\build\ff.sfc
cd ..

if exist build\%SIMPLE_NAME%.sfc del build\%SIMPLE_NAME%.sfc
if not exist build\%SIMPLE_NAME%.ips goto end_patch_simple
copy build\arcade.sfc build\%SIMPLE_NAME%.sfc
"tools\Lunar IPS.exe" -ApplyIPS build\%SIMPLE_NAME%.ips build\%SIMPLE_NAME%.sfc
:end_patch_simple

if exist build\%SAVELESS_NAME%.sfc del build\%SAVELESS_NAME%.sfc
if not exist build\%SAVELESS_NAME%.ips goto end_patch_saveless
copy build\arcade.sfc build\%SAVELESS_NAME%.sfc
"tools\Lunar IPS.exe" -ApplyIPS build\%SAVELESS_NAME%.ips build\%SAVELESS_NAME%.sfc
:end_patch_saveless

if exist build\%SD2SNES_NAME%.sfc del build\%SD2SNES_NAME%.sfc
if not exist build\%SD2SNES_NAME%.ips goto end_patch_sd2snes
copy build\arcade.sfc build\%SD2SNES_NAME%.sfc
"tools\Lunar IPS.exe" -ApplyIPS build\%SD2SNES_NAME%.ips build\%SD2SNES_NAME%.sfc
:end_patch_sd2snes

