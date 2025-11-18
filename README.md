# Python Code Typer - LeetCode Edition

A Python script that simulates human typing from clipboard content, perfectly preserving Python indentation for LeetCode submissions.

## 🚀 For Non-Programmers: Ultra-Simple Setup

**Never installed Python before? No problem!**

1. 📁 Open the `START_HERE.txt` file for a visual guide
2. 🖱️ Double-click `SIMPLE_SETUP.bat` (or `setup_windows.bat`)
3. ⏳ Wait 2-5 minutes for automatic installation
4. ✅ Done! Use `run_windows.bat` to start the app

**Everything installs automatically - no technical knowledge needed!**

---

## Features

- ✅ Reads code from clipboard
- ✅ Simulates human-like typing with random delays
- ✅ Preserves Python indentation perfectly
- ✅ Handles tabs, spaces, and special characters
- ✅ Safe for LeetCode code formatting
- ✅ Preview before typing
- ✅ Countdown timer before starting
- ✅ Platform-specific versions (Mac/Linux and Windows)
- ✅ **NEW: Automatic Python installation for non-programmers**

## Installation

### Automatic Setup (For Non-Programmers) - Windows

**Just run ONE file and everything will be set up automatically:**

#### Option 1: Simple Setup (Recommended - Fastest)
1. Double-click `SIMPLE_SETUP.bat`
2. Wait for installation (2-5 minutes)
3. Done! Use `run_windows.bat`

#### Option 2: Traditional Setup
1. Double-click `setup_windows.bat`
2. Wait for installation (2-5 minutes)
3. Done! Use `run_windows.bat`

Both setup scripts will automatically:
- ✅ Check if Python is installed
- ✅ Download and install Python if needed (latest stable version)
- ✅ Install all required packages (pyperclip, pyautogui)
- ✅ Set up everything for you

**No technical knowledge required!** See `START_HERE.txt` for a beginner-friendly guide.

---

### Manual Installation (For Programmers)

If you already have Python installed, you can install dependencies manually:

```bash
pip install -r requirements.txt
```

Or install packages individually:
```bash
pip install pyperclip pyautogui
```

## Usage

### Mac/Linux:
1. Copy your Python code to clipboard (from LeetCode, editor, etc.)
2. Run the script:
```bash
python pythonleecodetyper.py
```

### Windows:
1. Copy your Python code to clipboard (from LeetCode, editor, etc.)
2. Run the Windows-optimized version:
```bash
python pythonleecodetyper_windows.py
```
Or double-click `run_windows.bat` for easy execution.

3. Review the preview of your code
4. Type `y` to confirm
5. Wait for the 3-second countdown
6. **Quickly switch to your target window** (LeetCode editor, IDE, etc.)
7. The script will type your code character by character

## Configuration

You can adjust typing speed and delays by modifying these constants in the script:

- `TYPING_SPEED_MIN`: Minimum delay between characters (default: 0.05s)
- `TYPING_SPEED_MAX`: Maximum delay between characters (default: 0.15s)
- `LINE_BREAK_DELAY`: Additional delay for line breaks (default: 0.1s)
- `INDENT_DELAY`: Delay for indentation spaces (default: 0.05s)

## Safety

- The script includes a 3-second countdown to give you time to switch windows
- You can interrupt typing at any time with `Ctrl+C`
- Preview is shown before typing starts

## Platform-Specific Notes

### Mac/Linux:
- Uses `pythonleecodetyper.py`
- Uses Cmd+Left (Mac) or Home key for line navigation
- Uses fn+Delete (Mac) for forward delete

### Windows:
- Uses `pythonleecodetyper_windows.py` (optimized for Windows)
- Uses Home key for line navigation
- Uses Delete key for forward delete
- Can be run via `run_windows.bat` for convenience

## General Notes

- Make sure to switch to your target window during the countdown
- The script normalizes tabs to 4 spaces (Python standard)
- Indentation is preserved exactly as in your clipboard content
- On Windows, you may need to grant accessibility permissions if prompted

