:: RemoveDupes.cmd ::

@echo off & setlocal EnableDelayedExpansion

copy 4_-_IP4_-_*.txt 5.2_-_IP4_-_complete.txt

set "Datei=5.2_-_IP4_-_complete.txt"
set "Bak=.bak"
set "Duplikate=Duplikate.txt"

move "%Datei%" "%Datei%%Bak%"
copy nul "%Duplikate%">nul
If defined LastLine Set "LastLine="
for /f "delims=" %%A in ('Sort ^<"%Datei%%Bak%" ') do (
  If /i "!LastLine!"=="%%A" (Echo/%%A)>>"%Duplikate%"
  set "LastLine=%%A"
)
findstr /V /G:"%Duplikate%" <"%Datei%%Bak%" >"%Datei%"
del "%Duplikate%"
