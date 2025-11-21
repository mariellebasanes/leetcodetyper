@echo off
REM =====================================================
REM  Python Code Typer - Automatic Setup (Windows)
REM  This script will automatically install Python and 
REM  all required dependencies for non-programmers
REM =====================================================

TITLE Python Code Typer - Setup
COLOR 0A

echo.
echo =====================================================
echo  Python Code Typer - Automatic Setup
echo =====================================================
echo.
echo This will automatically:
echo  1. Check if Python is installed
echo  2. Install Python if needed (latest version)
echo  3. Install required Python packages
echo.
echo Please wait...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] Python is already installed!
    python --version
    echo.
    goto :install_packages
)

echo [!] Python is not installed. Installing Python...
echo.

REM Download and run Python installer using PowerShell
echo Downloading Python installer...
powershell -ExecutionPolicy Bypass -File "%~dp0install_python.ps1"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Failed to install Python automatically.
    echo.
    echo Please install Python manually from: https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation!
    echo.
    pause
    exit /b 1
)

echo.
echo [OK] Python installed successfully!
python --version
echo.

:install_packages
echo =====================================================
echo  Installing Required Packages...
echo =====================================================
echo.

REM Upgrade pip first
echo Upgrading pip...
python -m pip install --upgrade pip --quiet

REM Install requirements
echo Installing pyperclip and pyautogui...
python -m pip install -r requirements.txt --quiet

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Failed to install required packages.
    echo.
    echo Please try running this command manually:
    echo python -m pip install -r requirements.txt
    echo.
    pause
    exit /b 1
)

echo.
echo [OK] All packages installed successfully!
echo.

:success
echo =====================================================
echo  Setup Complete!
echo =====================================================
echo.
echo You can now run the Python Code Typer by:
echo  1. Double-clicking 'run_windows.bat'
echo  2. Or running: python pythonleecodetyper_windows.py
echo.
echo =====================================================
echo.
pause

