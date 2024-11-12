@echo off

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

:: get STORAGE info 
for /f "tokens=2 delims==" %%i in ('wmic diskdrive get size /value') do set "STORAGE=%%i"

:: echo HOST_NAME: %HOST_NAME%
:: echo CPU: %CPU_NAME%
:: echo Total RAM: %TOTAL_RAM%
:: echo STORAGE: %STORAGE%

:: move this to other space
start chrome "https://www.youtube.com/watch?v=1ZYbU82GVz4&t=5578s&ab_channel=SoothingRelaxation"


:: Envia os dados para o servidor de eventos
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"power-on\", \"unit\": \"MME\", \"place\": \"LABINFO-01\", \"hostName\": \"%HOST_NAME%\", \"meta\": {\"ram\": \"%TOTAL_RAM%\", \"storage\": \"%STORAGE%\", \"cpu\": \"%CPU_NAME%\"}}" https://catch-events.vercel.app/api/host/power-on

:: pause