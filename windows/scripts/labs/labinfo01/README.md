## Setup Agent

### Add Agent to Windows startup
1. Download Agent

2. Copy Agent to startup
- press `win + R`
- type: shell:startup

3. Paste Agent to startup folder


### Add Agent by CMD

```bat
@echo off
setlocal


cd c://
mkdir setup
cd setup

:: Download Agent
curl -O -s https://raw.githubusercontent.com/FelipeNasci/tools/main/windows/scripts/labs/labinfo01/agent.bat

:: Defina o caminho do script que você deseja copiar
set "source=%~d0\agent.bat"

:: Defina o caminho da pasta de inicialização
set "destination=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\agent.bat"

:: Copie o script para a pasta de inicialização
copy "%source%" "%destination%"

cd c://
rmdir /s /q setup

:: Mensagem de confirmação
echo Script copiado para a pasta de inicialização com sucesso.

pause

endlocal

:: Reinicie o computador
echo Reiniciando o computador em 5 segundos...

shutdown -r -t 0

```