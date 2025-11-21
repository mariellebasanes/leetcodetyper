#!/bin/bash
#######################################################
# Python Code Typer - macOS Launcher
# This script runs the macOS-optimized version of the code typer
#######################################################

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Determine Python command
if command_exists python3; then
    PYTHON_CMD="python3"
elif command_exists python; then
    PYTHON_CMD="python"
else
    echo -e "${RED}[ERROR]${NC} Python is not installed!"
    echo ""
    echo "Please run './setup_macos.sh' first to install Python and dependencies."
    echo ""
    read -p "Press any key to exit..."
    exit 1
fi

# Check if required packages are installed
$PYTHON_CMD -c "import pyperclip, pyautogui" 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}[WARNING]${NC} Required packages are not installed!"
    echo ""
    echo "Installing packages now..."
    echo ""
    $PYTHON_CMD -m pip install -r "$(dirname "$0")/requirements.txt" --quiet
    
    if [ $? -ne 0 ]; then
        echo ""
        echo -e "${RED}[ERROR]${NC} Failed to install packages."
        echo "Please run './setup_macos.sh' to complete setup."
        echo ""
        read -p "Press any key to exit..."
        exit 1
    fi
    
    echo -e "${GREEN}[OK]${NC} Packages installed successfully!"
    echo ""
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Run the application
$PYTHON_CMD "$SCRIPT_DIR/pythonleecodetyper_macos.py"

echo ""
read -p "Press any key to exit..."

