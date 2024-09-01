@echo off

cd c://
mkdir setup
cd setup

curl -O -s https://raw.githubusercontent.com/FelipeNasci/tools/main/windows/scripts/labs/labinfo01/script.bat
dir

call script.bat

cd c://
rmdir /s /q setup

pause