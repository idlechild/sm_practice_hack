@echo off

echo Building HACK Practice Hack

cd build
echo Building and pre-patching saveless extras version
cp HACK.sfc aaaa_HACK.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_HACK.sfc && cd ..

PAUSE