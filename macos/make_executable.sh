#!/bin/bash
#######################################################
# Make all shell scripts executable
# Run this if you get "Permission denied" errors
#######################################################

echo "Making all shell scripts executable..."
chmod +x "$(dirname "$0")"/*.sh
echo "Done! All .sh files are now executable."
echo ""
echo "You can now run:"
echo "  ./SIMPLE_SETUP.sh  (for first-time setup)"
echo "  ./run_macos.sh     (to use the app)"

