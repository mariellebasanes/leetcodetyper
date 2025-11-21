#!/bin/bash
#######################################################
# Python Code Typer - Automatic Setup (macOS)
# This script will automatically install Python and 
# all required dependencies for non-programmers
#######################################################

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo ""
echo "====================================================="
echo " Python Code Typer - Automatic Setup (macOS)"
echo "====================================================="
echo ""
echo "This will automatically:"
echo " 1. Check if Python is installed"
echo " 2. Install Python if needed (via Homebrew)"
echo " 3. Install required Python packages"
echo ""
echo "Please wait..."
echo ""

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Python 3 is installed
if command_exists python3; then
    echo -e "${GREEN}[OK]${NC} Python is already installed!"
    python3 --version
    echo ""
    PYTHON_CMD="python3"
else
    echo -e "${YELLOW}[!]${NC} Python is not installed. Installing Python..."
    echo ""
    
    # Check if Homebrew is installed
    if ! command_exists brew; then
        echo -e "${CYAN}Installing Homebrew first...${NC}"
        echo "You may be prompted for your password."
        echo ""
        
        # Install Homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        if [ $? -ne 0 ]; then
            echo ""
            echo -e "${RED}[ERROR]${NC} Failed to install Homebrew."
            echo ""
            echo "Please install Homebrew manually from: https://brew.sh"
            echo "Then run this script again."
            echo ""
            read -p "Press any key to exit..."
            exit 1
        fi
        
        # Add Homebrew to PATH for Apple Silicon Macs
        if [ -f /opt/homebrew/bin/brew ]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    fi
    
    echo -e "${CYAN}Installing Python via Homebrew...${NC}"
    brew install python3
    
    if [ $? -ne 0 ]; then
        echo ""
        echo -e "${RED}[ERROR]${NC} Failed to install Python automatically."
        echo ""
        echo "Please install Python manually from: https://www.python.org/downloads/"
        echo "Or install Homebrew and run: brew install python3"
        echo ""
        read -p "Press any key to exit..."
        exit 1
    fi
    
    echo ""
    echo -e "${GREEN}[OK]${NC} Python installed successfully!"
    python3 --version
    echo ""
    PYTHON_CMD="python3"
fi

# Install packages
echo "====================================================="
echo " Installing Required Packages..."
echo "====================================================="
echo ""

# Upgrade pip first
echo "Upgrading pip..."
$PYTHON_CMD -m pip install --upgrade pip --quiet

# Install requirements
echo "Installing pyperclip and pyautogui..."
$PYTHON_CMD -m pip install -r "$(dirname "$0")/requirements.txt" --quiet

if [ $? -ne 0 ]; then
    echo ""
    echo -e "${RED}[ERROR]${NC} Failed to install required packages."
    echo ""
    echo "Please try running this command manually:"
    echo "$PYTHON_CMD -m pip install -r requirements.txt"
    echo ""
    read -p "Press any key to exit..."
    exit 1
fi

echo ""
echo -e "${GREEN}[OK]${NC} All packages installed successfully!"
echo ""

# Check for accessibility permissions
echo "====================================================="
echo " Important: Accessibility Permissions"
echo "====================================================="
echo ""
echo -e "${YELLOW}NOTE:${NC} macOS requires accessibility permissions for automated typing."
echo ""
echo "When you first run the app, macOS will prompt you to grant"
echo "permissions. You must allow this for the app to work."
echo ""
echo "If you don't see the prompt:"
echo " 1. Go to System Preferences → Security & Privacy"
echo " 2. Click 'Privacy' tab"
echo " 3. Select 'Accessibility' from the left"
echo " 4. Add Terminal (or your terminal app) to the list"
echo ""

# Success
echo "====================================================="
echo " Setup Complete!"
echo "====================================================="
echo ""
echo "You can now run the Python Code Typer by:"
echo " 1. Running: ./run_macos.sh"
echo " 2. Or: python3 pythonleecodetyper_macos.py"
echo ""
echo "====================================================="
echo ""
read -p "Press any key to exit..."

