# macOS Version - Python Code Typer

## 🚀 Quick Setup (3 Steps)

### Step 1: Open Terminal
- Go to **Applications** → **Utilities** → **Terminal**
- Or press `Cmd + Space` and type "Terminal"

### Step 2: Navigate to This Folder
```bash
cd /path/to/leetcodetyper/macos
```
*(Replace `/path/to/` with the actual path to this folder)*

**Quick Tip:** You can type `cd ` (with a space) and then drag this folder into Terminal!

### Step 3: Run Setup
```bash
chmod +x *.sh && ./SIMPLE_SETUP.sh
```

**That's it!** Wait 2-5 minutes for automatic installation.

---

## 📖 Using the App

After setup is complete:

```bash
./run_macos.sh
```

Then follow the on-screen instructions!

---

## ⚠️ First Time Setup Notes

### You May Be Asked To:
1. **Enter your password** - This is normal! Homebrew needs it to install Python.
2. **Grant accessibility permissions** - Required for the app to simulate typing.

### Granting Accessibility Permissions:
1. Go to **System Preferences** → **Security & Privacy**
2. Click the **Privacy** tab
3. Select **Accessibility** from the left sidebar
4. Click the lock icon 🔒 to make changes (enter your password)
5. Find **Terminal** (or your terminal app) in the list
6. Check the box ☑️ to enable it

---

## 🔧 Troubleshooting

### "Permission denied" error?
Run this command first:
```bash
chmod +x *.sh
```

### Setup fails?
1. Make sure you have internet connection
2. Install Xcode Command Line Tools:
   ```bash
   xcode-select --install
   ```
3. Try again

### App doesn't type?
- Check accessibility permissions (see above)
- Restart Terminal
- Try running the app again

---

## 📚 More Help

- **Quick Start:** See `START_HERE.txt`
- **Quick Reference:** See `QUICK_START.txt`
- **Full Documentation:** See `../README.md`

---

## 💡 Pro Tips

1. **Create an Alias** - Add to your `~/.zshrc` or `~/.bash_profile`:
   ```bash
   alias leetcode="cd /path/to/leetcodetyper/macos && ./run_macos.sh"
   ```
   Then just type `leetcode` from anywhere!

2. **Desktop Shortcut** - Create an Automator workflow to run the script

3. **Quick Window Switch** - Use `Cmd + Tab` during the countdown

---

**Ready? Run:** `chmod +x *.sh && ./SIMPLE_SETUP.sh`

