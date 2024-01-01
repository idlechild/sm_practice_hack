@echo off

set VERSION_REV=1
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
copy *.sfc ..\build
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=0 -DFEATURE_SD2SNES=0 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\00.sfc
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=0 -DFEATURE_SD2SNES=0 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\ff.sfc
python sort_debug_symbols.py ..\build\Debugging_Symbols.sym x x
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\%SIMPLE_NAME%.ips

echo Building saveless version
copy *.sfc ..\build
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=0 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\00.sfc
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=0 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\ff.sfc
python sort_debug_symbols.py ..\build\Debugging_Symbols.sym x x
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\%SAVELESS_NAME%.ips

echo Building SD2SNES version
copy *.sfc ..\build
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=1 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\00.sfc
..\tools\asar --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_PRESETS=1 -DFEATURE_SD2SNES=1 -DVERSION_REV=%VERSION_REV% ..\src\main.asm ..\build\ff.sfc
python sort_debug_symbols.py ..\build\Debugging_Symbols.sym ..\build\Debugging_Sorted.sym ..\build\Debugging_Combined.sym
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\%SD2SNES_NAME%.ips

del 00.sfc ff.sfc ..\build\00.sfc ..\build\ff.sfc
cd ..

if exist build\%SIMPLE_NAME%.sfc del build\%SIMPLE_NAME%.sfc
copy build\arcade.sfc build\%SIMPLE_NAME%.sfc
"tools\Lunar IPS.exe" -ApplyIPS build\%SIMPLE_NAME%.ips build\%SIMPLE_NAME%.sfc

if exist build\%SAVELESS_NAME%.sfc del build\%SAVELESS_NAME%.sfc
copy build\arcade.sfc build\%SAVELESS_NAME%.sfc
"tools\Lunar IPS.exe" -ApplyIPS build\%SAVELESS_NAME%.ips build\%SAVELESS_NAME%.sfc

if exist build\%SD2SNES_NAME%.sfc del build\%SD2SNES_NAME%.sfc
copy build\arcade.sfc build\%SD2SNES_NAME%.sfc
"tools\Lunar IPS.exe" -ApplyIPS build\%SD2SNES_NAME%.ips build\%SD2SNES_NAME%.sfc

