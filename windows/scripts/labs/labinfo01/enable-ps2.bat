
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
