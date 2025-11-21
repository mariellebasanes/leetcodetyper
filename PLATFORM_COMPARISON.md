# Platform Comparison - Windows vs macOS

## Quick Reference: What's Different?

Both versions do the same thing - type your code automatically! But they're optimized for their respective operating systems.

---

## 🪟 Windows Version

### Location:
```
windows/
```

### Key Features:
- ✅ Double-click setup - no command line needed
- ✅ Batch files (.bat) for easy execution
- ✅ PowerShell installer for Python
- ✅ Windows-optimized keyboard shortcuts:
  - `Home` key for line start
  - `Delete` key for forward delete
- ✅ Works with Windows 10/11
- ✅ Optional Windows Package Manager (winget) support

### Setup:
```
1. Double-click: SIMPLE_SETUP.bat
2. Wait 2-5 minutes
3. Done!
```

### Run:
```
Double-click: run_windows.bat
```

### File Types:
- `.bat` - Batch files (double-click to run)
- `.ps1` - PowerShell scripts
- `.py` - Python scripts

---

## 🍎 macOS Version

### Location:
```
macos/
```

### Key Features:
- ✅ Shell scripts (.sh) with Terminal
- ✅ Homebrew installer for Python
- ✅ macOS-optimized keyboard shortcuts:
  - `Cmd+Left` for line start
  - `Delete` key (fn+Delete equivalent)
- ✅ Works with macOS 10.13+
- ✅ Requires accessibility permissions (prompted automatically)

### Setup:
```bash
cd macos
chmod +x *.sh && ./SIMPLE_SETUP.sh
# Wait 2-5 minutes
```

### Run:
```bash
./run_macos.sh
```

### File Types:
- `.sh` - Shell scripts (run in Terminal)
- `.py` - Python scripts

---

## Feature Comparison Table

| Feature | Windows | macOS |
|---------|---------|-------|
| **One-Click Setup** | ✅ Yes (double-click) | ✅ Yes (Terminal command) |
| **Auto Python Install** | ✅ Via installer | ✅ Via Homebrew |
| **Easy to Use** | ✅ Double-click files | ✅ Terminal commands |
| **Keyboard Shortcuts** | Windows-specific | macOS-specific |
| **Permissions Needed** | None (usually) | Accessibility |
| **Package Manager** | Optional (winget) | Homebrew |
| **Typical Setup Time** | 2-5 minutes | 2-5 minutes |

---

## Similarities (What's the Same)

Both versions:
- ✅ Read code from clipboard
- ✅ Simulate human-like typing
- ✅ Preserve Python indentation perfectly
- ✅ Show preview before typing
- ✅ 3-second countdown
- ✅ Can be interrupted anytime (Ctrl+C / Cmd+C)
- ✅ Work with LeetCode and all text editors
- ✅ Use same Python packages (pyperclip, pyautogui)
- ✅ Same configuration options
- ✅ Same typing speed settings

---

## Technical Differences

### Windows:
```python
# Uses Windows-specific key combinations
pyautogui.press('home')      # Go to line start
pyautogui.press('delete')    # Forward delete
```

### macOS:
```python
# Uses macOS-specific key combinations
pyautogui.hotkey('command', 'left')  # Go to line start
pyautogui.press('delete')            # Forward delete
```

---

## Which Version Should I Use?

### Use Windows Version If:
- ✅ You're on Windows 10 or 11
- ✅ You prefer double-clicking files
- ✅ You want to avoid Terminal/Command Prompt

### Use macOS Version If:
- ✅ You're on macOS (10.13+)
- ✅ You're comfortable with Terminal
- ✅ You have Homebrew or are willing to install it

---

## Can I Have Both?

**Yes!** Both versions can coexist in this project structure. This is useful if:
- You work on multiple computers
- You share this project with others
- You want to test on different platforms

---

## Installation Methods Comparison

### Windows Methods:

#### Method 1: SIMPLE_SETUP.bat (Recommended)
- Fastest method
- Uses Windows Package Manager if available
- Falls back to traditional installer
- One double-click

#### Method 2: setup_windows.bat
- Traditional method
- Downloads Python installer
- Installs packages
- One double-click

### macOS Methods:

#### Method 1: SIMPLE_SETUP.sh (Recommended)
- Fastest method
- Installs Homebrew if needed
- Installs Python via Homebrew
- One Terminal command

#### Method 2: setup_macos.sh
- Detailed method
- More verbose output
- Same functionality
- One Terminal command

---

## Documentation Comparison

Both platforms have the same documentation structure:

```
Platform Folder/
├── README_FIRST.md      # Quick overview
├── START_HERE.txt       # Detailed beginner guide
├── QUICK_START.txt      # Quick reference
├── SIMPLE_SETUP.*       # One-click setup (recommended)
├── setup_*.*            # Alternative setup
└── run_*.*              # Run the application
```

---

## User Experience

### Windows Experience:
```
1. Open windows/ folder in File Explorer
2. Double-click SIMPLE_SETUP.bat
3. Wait for installation
4. Double-click run_windows.bat
5. Copy code and follow prompts
```

### macOS Experience:
```
1. Open Terminal
2. cd to macos/ folder
3. chmod +x *.sh && ./SIMPLE_SETUP.sh
4. Wait for installation (grant permissions if asked)
5. ./run_macos.sh
6. Copy code and follow prompts
```

---

## Support & Troubleshooting

### Windows Common Issues:
- **"Python not found"** → Restart computer, run setup again
- **Setup fails** → Run as Administrator
- **Antivirus blocks** → Temporarily disable during setup

### macOS Common Issues:
- **"Permission denied"** → Run `chmod +x *.sh`
- **App doesn't type** → Grant accessibility permissions
- **Setup fails** → Install Xcode Command Line Tools

---

## Performance

Both versions:
- ⚡ Type at the same speed (configurable)
- ⚡ Use the same algorithms
- ⚡ Have the same accuracy
- ⚡ Process clipboard content identically

---

## Future Compatibility

### Windows:
- ✅ Windows 10 (tested)
- ✅ Windows 11 (tested)
- ✅ Future Windows versions (should work)

### macOS:
- ✅ macOS 10.13+ (tested)
- ✅ Intel Macs (tested)
- ✅ Apple Silicon (M1/M2/M3) (tested)
- ✅ Future macOS versions (should work)

---

## Conclusion

**Both versions are equally powerful!** Choose based on your operating system.

- **Windows Users** → Use `windows/` version
- **macOS Users** → Use `macos/` version

Both will give you the same excellent code-typing experience! 🚀

