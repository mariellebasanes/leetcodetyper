@echo off
REM =====================================================
REM  ULTRA-SIMPLE ONE-CLICK SETUP
REM  For Windows 10/11 Users
REM =====================================================

TITLE Simple Setup - Python Code Typer
COLOR 0B

echo.
echo =====================================================
echo    PYTHON CODE TYPER - ONE-CLICK SETUP
echo =====================================================
echo.
echo This will set up everything automatically!
echo Just wait a few minutes...
echo.

REM Try to use winget (Windows Package Manager) first - faster!
winget --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [*] Using Windows Package Manager for faster installation...
    echo.
    
    REM Check if Python is installed
    python --version >nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        echo Installing Python via winget...
        winget install Python.Python.3.11 --silent --accept-package-agreements --accept-source-agreements
        
        REM Refresh PATH
        call refreshenv >nul 2>&1
        
        REM Wait a moment for installation to complete
        timeout /t 5 /nobreak >nul
    )
    
    goto :install_packages
)

REM Fallback to traditional installer
echo [*] Windows Package Manager not available, using traditional installer...
echo.
call "%~dp0setup_windows.bat"
exit /b

:install_packages
echo.
echo =====================================================
echo  Installing Python Packages...
echo =====================================================
echo.

REM Refresh environment to get Python in PATH
setlocal enabledelayedexpansion
for /f "tokens=2*" %%a in ('reg query "HKCU\Environment" /v PATH 2^>nul') do set "userpath=%%b"
for /f "tokens=2*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH 2^>nul') do set "systempath=%%b"
set "PATH=%systempath%;%userpath%"

python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [!] Python installation needs a system restart to complete.
    echo.
    echo Please:
    echo  1. Close this window
    echo  2. Restart your computer
    echo  3. Run this setup again
    echo.
    pause
    exit /b 1
)

python -m pip install --upgrade pip --quiet
python -m pip install -r "%~dp0requirements.txt" --quiet

if %ERRORLEVEL% EQU 0 (
    echo.
    echo =====================================================
    echo   SETUP COMPLETE! 
    echo =====================================================
    echo.
    echo  Ready to use! Double-click: run_windows.bat
    echo.
    echo =====================================================
    echo.
) else (
    echo.
    echo [!] Package installation had issues.
    echo Please run setup_windows.bat instead.
    echo.
)

pause

