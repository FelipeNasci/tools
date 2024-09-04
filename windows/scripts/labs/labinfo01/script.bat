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

:: Envia os dados para o servidor de eventos
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"power-on\", \"unit\": \"MME\", \"place\": \"LABINFO-01\", \"hostName\": \"%HOST_NAME%\", \"meta\": {\"ram\": \"%TOTAL_RAM%\", \"storage\": \"%STORAGE%\", \"cpu\": \"%CPU_NAME%\"}}" https://catch-events.vercel.app/api/host/power-on

:: Script para ativar PS/2 alterando o registro do Windows

:: Verifica se o script está sendo executado como administrador
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    :: Se não estiver sendo executado como administrador, reexecuta o script com privilégios elevados
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\elevate.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0""", "", "runas", 1 >> "%temp%\elevate.vbs"
    "%temp%\elevate.vbs"
    del "%temp%\elevate.vbs"
)

:: Altera o valor da chave 'start' para '1'
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt" /v Start /t REG_DWORD /d 1 /f

:: Verifica se a alteração foi bem-sucedida
if %errorlevel% EQU 0 (
    echo A chave do registro foi alterada com sucesso.
) else (
    echo Falha ao alterar a chave do registro.
)

:: pause