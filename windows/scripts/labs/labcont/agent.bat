@echo off

cd c://
mkdir setup
cd setup

curl -O -s https://raw.githubusercontent.com/FelipeNasci/tools/refs/heads/main/windows/scripts/labs/labcont/run-scripts.bat

call run-scripts.bat

cd c://
rmdir /s /q setup

::pause
