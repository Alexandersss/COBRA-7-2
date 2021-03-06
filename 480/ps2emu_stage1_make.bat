@echo off
cls

set PS3SDK=/c/PSDK3v2
set PS3DEV=/c/PSDK3v2/ps3dev2
set WIN_PS3SDK=C:/PSDK3v2
set PATH=%WIN_PS3SDK%/mingw/msys/1.0/bin;%WIN_PS3SDK%/mingw/bin;%PS3DEV%/ppu/bin;%SCETOOL%;
set SCETOOL=C:\PSDK3v2\ps3dev2\bin

cd ps2emu_gen480
make -f Makefile all
cd..
cd ps2emu_stage1_file
make -f Makefile all

if not exist BIN mkdir BIN
if not exist BIN\release mkdir BIN\release
if not exist BIN\debug mkdir BIN\debug

if exist *.self move *.self BIN\release>nul
if exist *.self_DEBUG move *.self_DEBUG BIN\debug>nul

cp -r BIN ../../
rm -rf BIN
pause