@echo off
REM Python Code Typer - Windows Launcher
REM This batch file runs the Windows-optimized version of the code typer

TITLE Python Code Typer

REM Check if Python is installed
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Python is not installed!
    echo.
    echo Please run 'setup_windows.bat' first to install Python and dependencies.
    echo.
    pause
    exit /b 1
)

REM Check if required packages are installed
python -c "import pyperclip, pyautogui" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [WARNING] Required packages are not installed!
    echo.
    echo Installing packages now...
    echo.
    python -m pip install -r requirements.txt --quiet
    
    if %ERRORLEVEL% NEQ 0 (
        echo.
        echo [ERROR] Failed to install packages.
        echo Please run 'setup_windows.bat' to complete setup.
        echo.
        pause
        exit /b 1
    )
    
    echo [OK] Packages installed successfully!
    echo.
)

REM Run the application
python pythonleecodetyper_windows.py

pause

