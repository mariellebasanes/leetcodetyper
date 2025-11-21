# Python Code Typer - LeetCode Edition

A Python script that simulates human typing from clipboard content, perfectly preserving Python indentation for LeetCode submissions.

**Now with platform-specific versions optimized for Windows and macOS!**

---

## 🚀 Quick Start

### **Choose Your Platform:**

#### **Windows Users** → Go to the `windows/` folder
- 📄 Read `windows/START_HERE.txt` for complete guide
- 🖱️ Double-click `windows/SIMPLE_SETUP.bat` to install
- 🖱️ Double-click `windows/run_windows.bat` to use

#### **macOS Users** → Go to the `macos/` folder
- 📄 Read `macos/START_HERE.txt` for complete guide
- 🖥️ Run `chmod +x macos/SIMPLE_SETUP.sh && macos/SIMPLE_SETUP.sh` to install
- 🖥️ Run `macos/run_macos.sh` to use

---

## 📁 Project Structure

```
leetcodetyper/
├── README.md                    # This file
├── requirements.txt             # Python dependencies (shared)
│
├── windows/                     # Windows version
│   ├── pythonleecodetyper_windows.py
│   ├── SIMPLE_SETUP.bat        # One-click setup (recommended)
│   ├── setup_windows.bat       # Alternative setup
│   ├── run_windows.bat         # Run the app
│   ├── install_python.ps1      # Python installer script
│   ├── requirements.txt
│   ├── START_HERE.txt          # Windows quick start
│   └── QUICK_START.txt         # Windows quick reference
│
└── macos/                       # macOS version
    ├── pythonleecodetyper_macos.py
    ├── SIMPLE_SETUP.sh         # One-click setup (recommended)
    ├── setup_macos.sh          # Alternative setup
    ├── run_macos.sh            # Run the app
    ├── requirements.txt
    ├── START_HERE.txt          # macOS quick start
    └── QUICK_START.txt         # macOS quick reference
```

---

## ✨ Features

- ✅ Reads code from clipboard
- ✅ Simulates human-like typing with random delays
- ✅ Preserves Python indentation perfectly
- ✅ Handles tabs, spaces, and special characters
- ✅ Safe for LeetCode code formatting
- ✅ Preview before typing
- ✅ Countdown timer before starting
- ✅ Platform-specific optimizations (Windows & macOS)
- ✅ **Automatic Python installation for non-programmers**
- ✅ **One-click setup scripts**

---

## 🔧 Installation

### **For Non-Programmers (Recommended)**

#### Windows:
1. Navigate to the `windows/` folder
2. Double-click `SIMPLE_SETUP.bat` (fastest)
   - OR double-click `setup_windows.bat` (alternative)
3. Wait 2-5 minutes
4. Done! Use `run_windows.bat` to start

#### macOS:
1. Open Terminal (Applications → Utilities → Terminal)
2. Navigate to the `macos/` folder:
   ```bash
   cd /path/to/leetcodetyper/macos
   ```
3. Run the setup:
   ```bash
   chmod +x SIMPLE_SETUP.sh && ./SIMPLE_SETUP.sh
   ```
4. Wait 2-5 minutes (you may be prompted for your password)
5. Grant accessibility permissions when prompted
6. Done! Use `./run_macos.sh` to start

**Both setup scripts automatically:**
- ✅ Check if Python is installed
- ✅ Download and install Python if needed
- ✅ Install all required packages (pyperclip, pyautogui)
- ✅ Set up everything for you

**No technical knowledge required!**

---

### **For Programmers (Manual Installation)**

If you already have Python installed:

```bash
pip install -r requirements.txt
```

Or install packages individually:
```bash
pip install pyperclip pyautogui
```

---

## 📖 Usage

### **Easy Way (Recommended for Non-Programmers)**

#### Windows:
1. Copy your Python code (Ctrl+C)
2. Double-click `windows/run_windows.bat`
3. Follow the prompts!

#### macOS:
1. Copy your Python code (Cmd+C)
2. In Terminal, run: `./macos/run_macos.sh`
3. Follow the prompts!

### **Command Line Way (For Programmers)**

#### Windows:
```bash
cd windows
python pythonleecodetyper_windows.py
```

#### macOS:
```bash
cd macos
python3 pythonleecodetyper_macos.py
```

### **Steps:**
1. Copy your Python code to clipboard (from LeetCode, editor, etc.)
2. Run the appropriate script for your platform
3. Review the preview of your code
4. Type `y` to confirm
5. Wait for the 3-second countdown
6. **Quickly switch to your target window** (LeetCode editor, IDE, etc.)
7. The script will type your code character by character

---

## ⚙️ Configuration

You can adjust typing speed and delays by modifying these constants in the Python script:

- `TYPING_SPEED_MIN`: Minimum delay between characters (default: 0.05s)
- `TYPING_SPEED_MAX`: Maximum delay between characters (default: 0.15s)
- `LINE_BREAK_DELAY`: Additional delay for line breaks (default: 0.1s)
- `INDENT_DELAY`: Delay for indentation spaces (default: 0.05s)

---

## 🛡️ Safety

- The script includes a 3-second countdown to give you time to switch windows
- You can interrupt typing at any time with `Ctrl+C` (Windows) or `Cmd+C` (macOS)
- Preview is shown before typing starts
- All typing is simulated through your keyboard, so it's safe and undetectable

---

## 🖥️ Platform-Specific Notes

### **Windows Version:**
- Uses `pythonleecodetyper_windows.py`
- Optimized for Windows keyboard shortcuts
- Uses Home key for line navigation
- Uses Delete key for forward delete
- Can be run via `run_windows.bat` for convenience
- Automatic Python installation via PowerShell script

### **macOS Version:**
- Uses `pythonleecodetyper_macos.py`
- Optimized for macOS keyboard shortcuts
- Uses Cmd+Left for line navigation
- Uses Delete key (equivalent to fn+Delete)
- Requires accessibility permissions (you'll be prompted)
- Automatic Python installation via Homebrew

---

## ⚠️ Troubleshooting

### **Windows:**

**Setup fails?**
- Right-click setup file → "Run as Administrator"
- Or manually install Python from: https://www.python.org/downloads/
  (Check "Add Python to PATH" during install)

**"Python not found" error?**
- Restart your computer after setup
- Run the setup again

### **macOS:**

**Setup fails?**
- Make sure you have an internet connection
- Install Xcode Command Line Tools: `xcode-select --install`
- Or manually install Homebrew: https://brew.sh
- Then run `./setup_macos.sh`

**App doesn't type anything?**
- Grant accessibility permissions:
  1. Go to System Preferences → Security & Privacy
  2. Click 'Privacy' tab
  3. Select 'Accessibility' from the left
  4. Add Terminal (or your terminal app) to the list
  5. Check the box to enable it

**"Permission denied" error?**
- Make the scripts executable: `chmod +x macos/*.sh`

---

## 📝 Requirements

- **Python 3.7+** (automatically installed by setup scripts)
- **pyperclip** (automatically installed)
- **pyautogui** (automatically installed)

**Windows:**
- Windows 10 or 11
- PowerShell (pre-installed)

**macOS:**
- macOS 10.13 or later
- Terminal (pre-installed)
- Accessibility permissions (you'll be prompted)

---

## 🤝 Contributing

Feel free to open issues or submit pull requests for improvements!

---

## 📄 License

MIT License - feel free to use and modify as needed.

---

## 💡 Tips

### **For Windows Users:**
- Keep the `windows/` folder handy for quick access
- Create a desktop shortcut to `run_windows.bat` for even faster access
- Use Alt+Tab to quickly switch windows during the countdown

### **For macOS Users:**
- Keep Terminal open in the background for easy access
- Create an alias in your shell config for quick access:
  ```bash
  alias leetcode="cd /path/to/leetcodetyper/macos && ./run_macos.sh"
  ```
- Use Cmd+Tab to quickly switch windows during the countdown
- You can add the script to your Dock for quick access

### **For Everyone:**
- Make sure to click in the target text field before the countdown ends
- The script works with any text editor, not just LeetCode
- Perfect for copying code between environments without losing formatting
- Use the preview feature to verify your code before typing

---

## 🎯 Use Cases

- ✅ Submitting code to LeetCode without formatting issues
- ✅ Copying code between different environments
- ✅ Demonstrating code in presentations with realistic typing
- ✅ Bypassing paste restrictions in certain editors
- ✅ Preserving exact indentation when moving code

---

## 🌟 Why Use This?

LeetCode and other coding platforms sometimes have issues with:
- Copy-paste formatting
- Indentation being lost or mangled
- Tab vs. space inconsistencies

This tool simulates human typing, so:
- ✅ Your code looks natural
- ✅ Indentation is perfectly preserved
- ✅ No paste detection or formatting issues
- ✅ Works reliably every time

---

**Ready to get started?**
- **Windows:** Open `windows/START_HERE.txt`
- **macOS:** Open `macos/START_HERE.txt`

**Happy coding! 🚀**
