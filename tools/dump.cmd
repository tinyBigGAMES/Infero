@echo off
cd /d "%~dp0"
call tdump "..\bin\Infero.dll" > Infero.dll.txt
call Infero.dll.txt
