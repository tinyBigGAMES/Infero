@echo off
cd /d "%~dp0"
call polib /machine:x64 /out:"..\lib\Infero.lib" "..\bin\Infero.dll"