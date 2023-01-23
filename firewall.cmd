::GTA:Online Firewall Manager
::Updated by plumbwicked
@ECHO OFF
:: Setting DOS Character Code Page to English
chcp 437 >nul

:: Setting DOS Window Color
color 0A

:: Setting DOS Windows Title
set "TK_TITLE= GTA:Online Firewall Manager"
set "TK_VERSION=1.0"
title NewbieH4X GTA:Online Firewall Manager v%TK_VERSION%
:: Setting DOS Window and Screen Buffer Size to 80 x 25
reg add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "ScreenBufferSize" /t REG_DWORD /d "0x23290050" /f >nul
reg add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "WindowSize" /t REG_DWORD /d "0x190050" /f >nul

:: Elevating UAC for Administrator Privileges
set "params=%*"
::cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && ""%~0"" %params%", "", "runas", 1 > "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

setlocal EnableExtensions
setlocal EnableDelayedExpansion

:menu
echo GTA:Online Firewall Manager Options:
echo ------------------------------------
echo.
echo 1) Add rule
echo 2) Show rule
echo 3) Enable rule
echo 4) Disable rule
echo 5) Remove rule
echo 6) Quit
echo.
choice /C:123456 /N /M "Enter Your Choice : "
if errorlevel 6 goto :EOF
if errorlevel 5 goto :RemoveRule
if errorlevel 4 goto :DisableRule
if errorlevel 3 goto :EnableRule
if errorlevel 2 goto :ShowRule
if errorlevel 1 goto :AddRule

:AddRule
echo.
Netsh AdvFirewall Firewall add rule name="Block GTA ONLINE player ports" dir=out action=block description="Block GTA ONLINE player ports" profile=any localport=6672 remoteport=any protocol=UDP
::echo Rule Added.
echo Press any key to go back...
pause>nul
cls
goto :menu

:ShowRule
cls
Netsh AdvFirewall firewall show rule name="Block GTA ONLINE player ports"
echo.
echo Press any key to go back...
pause>nul
cls
goto :menu

:EnableRule
echo.
Netsh AdvFirewall Firewall set rule name="Block GTA ONLINE player ports" new enable=yes
::echo Rule enabled.
echo Press any key to go back...
pause>nul
cls
goto :menu

:DisableRule
echo.
Netsh AdvFirewall Firewall set rule name="Block GTA ONLINE player ports" new enable=no
::echo Rule disabled.
echo Press any key to go back...
pause>nul
cls
goto :menu

:RemoveRule
echo.
Netsh AdvFirewall Firewall delete rule name="Block GTA ONLINE player ports"
::echo Rule deleted.
echo Press any key to go back...
pause>nul
cls
goto :menu
