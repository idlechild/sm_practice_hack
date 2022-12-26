@echo off

echo Building HACK Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\HACK.sfc aaaa_HACK.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_HACK.sfc && cd ..

PAUSE
