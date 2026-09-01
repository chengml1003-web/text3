@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo 本机内网地址（其他电脑请用这些，不要用 127.0.0.1）：
echo.
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /c:"IPv4"') do echo   http://%%i:5173/
echo.
echo 正在启动页面服务（已在运行时会提示端口占用，可忽略）...
start /b python -m http.server 5173 --bind 0.0.0.0
echo.
echo 请用管理员身份运行下面命令放行防火墙（只需一次）：
echo   netsh advfirewall firewall add rule name="QA Assistant 5173" dir=in action=allow protocol=TCP localport=5173 profile=any
echo.
pause
