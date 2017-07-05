@echo off & setlocal

copy 4_-_IP4_-_*.txt 5_-_IP4_-_complete.txt
@echo.

set "Datei=5_-_IP4_-_complete.txt"
set "Bak=.bak"
set /a LineNo=0

move "%Datei%" "%Datei%%Bak%"
copy nul "%Datei%">nul
for /f "usebackq delims=" %%i in ("%Datei%%Bak%") do set "Zeile=%%i" & call :ProcessLine
del "%Datei%%Bak%"
copy 5_-_IP4_-_complete.txt 5_-_IP6_-_help.txt
goto :eof

:ProcessLine
set /a LineNo+=1
echo Validiere Zeile %LineNo% ...
findstr /b /c:"%Zeile:~,8%" "%Datei%">nul || >>"%Datei%" echo %Zeile%
goto :eof

:eof
