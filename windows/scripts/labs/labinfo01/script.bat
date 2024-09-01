@echo off

:: get storage
for /f "tokens=2 delims==" %%i in ('wmic diskdrive get size /value') do set "STORAGE=%%i"

:: get OS info
for /f "tokens=2 delims==" %%i in ('wmic os get Caption /value') do set "OS_NAME=%%i"
for /f "tokens=2 delims==" %%i in ('wmic os get Version /value') do set "OS_VERSION=%%i"
for /f "tokens=2 delims==" %%i in ('wmic os get OSArchitecture /value') do set "OS_ARCH=%%i"

:: get HOST_NAME
for /f "tokens=2 delims==" %%i in ('wmic computersystem get name /value') do set "HOST_NAME=%%i"

:: get CPU_NAME
for /f "tokens=2 delims==" %%i in ('wmic cpu get name /value') do set "CPU_NAME=%%i"

:: get RAM info
:: Usa PowerShell para capturar e somar as capacidades de RAM
for /f %%i in ('powershell -command "Get-WmiObject -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum | Select-Object -ExpandProperty Sum"') do set "TOTAL_RAM=%%i"


echo HOST_NAME: %OS_NAME%
echo CPU: %CPU_NAME%
echo Total RAM: %TOTAL_RAM%
echo STORAGE: %STORAGE%

pause