#!/bin/bash
#######################################################
# ULTRA-SIMPLE ONE-CLICK SETUP
# For macOS Users
#######################################################

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

clear
echo ""
echo "====================================================="
echo "   PYTHON CODE TYPER - ONE-CLICK SETUP (macOS)"
echo "====================================================="
echo ""
echo "This will set up everything automatically!"
echo "Just wait a few minutes..."
echo ""

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Python 3 is installed
if command_exists python3; then
    echo -e "${GREEN}[✓]${NC} Python is already installed!"
    python3 --version
    PYTHON_CMD="python3"
else
    echo -e "${CYAN}[*]${NC} Python not found. Installing via Homebrew..."
    echo ""
    
    # Check if Homebrew is installed
    if ! command_exists brew; then
        echo -e "${CYAN}[*]${NC} Installing Homebrew (package manager for macOS)..."
        echo -e "${YELLOW}    You may be prompted for your password.${NC}"
        echo ""
        
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        if [ $? -ne 0 ]; then
            echo ""
            echo -e "${RED}[✗] Homebrew installation failed.${NC}"
            echo ""
            echo "Please install manually from: https://brew.sh"
            echo ""
            read -p "Press any key to exit..."
            exit 1
        fi
        
        # Add Homebrew to PATH for Apple Silicon Macs
        if [ -f /opt/homebrew/bin/brew ]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        
        echo ""
        echo -e "${GREEN}[✓]${NC} Homebrew installed!"
        echo ""
    fi
    
    # Install Python
    echo -e "${CYAN}[*]${NC} Installing Python..."
    brew install python3
    
    if [ $? -ne 0 ]; then
        echo ""
        echo -e "${RED}[✗] Python installation failed.${NC}"
        echo ""
        echo "Please try running './setup_macos.sh' instead."
        echo ""
        read -p "Press any key to exit..."
        exit 1
    fi
    
    PYTHON_CMD="python3"
    echo ""
    echo -e "${GREEN}[✓]${NC} Python installed!"
    python3 --version
fi

echo ""
echo "====================================================="
echo " Installing Python Packages..."
echo "====================================================="
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Upgrade pip
$PYTHON_CMD -m pip install --upgrade pip --quiet

# Install requirements
$PYTHON_CMD -m pip install -r "$SCRIPT_DIR/requirements.txt" --quiet

if [ $? -eq 0 ]; then
    echo ""
    echo "====================================================="
    echo -e "${GREEN}  SETUP COMPLETE! ${NC}"
    echo "====================================================="
    echo ""
    echo -e "${CYAN}Ready to use!${NC} Run: ${GREEN}./run_macos.sh${NC}"
    echo ""
    echo -e "${YELLOW}IMPORTANT:${NC} macOS requires accessibility permissions."
    echo "When prompted, allow Terminal to control your computer."
    echo ""
    echo "If not prompted, go to:"
    echo " System Preferences → Security & Privacy → Accessibility"
    echo ""
    echo "====================================================="
    echo ""
else
    echo ""
    echo -e "${YELLOW}[!]${NC} Package installation had issues."
    echo "Please run './setup_macos.sh' instead."
    echo ""
fi

read -p "Press any key to exit..."

