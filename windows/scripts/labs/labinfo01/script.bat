:: chcp 65001

curl -O -s https://raw.githubusercontent.com/FelipeNasci/tools/feat-add-script-to-enable-ps2-devices/windows/scripts/labs/labinfo01/get-info.bat
curl -O -s https://raw.githubusercontent.com/FelipeNasci/tools/feat-add-script-to-enable-ps2-devices/windows/scripts/labs/labinfo01/register-host.bat

call get-info.bat
call register-host.bat

