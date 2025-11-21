#!/usr/bin/env python3
"""
Python Code Typer - macOS Edition
Simulates human typing from clipboard
Perfectly preserves Python indentation for LeetCode content
Optimized for macOS operating system
"""

import pyperclip
import pyautogui
import time
import random
import sys
from typing import Optional

# Safety: Add a small delay between actions
pyautogui.PAUSE = 0.01

# Configuration
TYPING_SPEED_MIN = 0.05  # Minimum delay between characters (seconds)
TYPING_SPEED_MAX = 0.15  # Maximum delay between characters (seconds)
LINE_BREAK_DELAY = 0.1   # Additional delay for line breaks
INDENT_DELAY = 0.05      # Delay for indentation


def get_clipboard_content() -> str:
    """Get content from clipboard."""
    try:
        content = pyperclip.paste()
        if not content:
            print("Clipboard is empty!")
            sys.exit(1)
        return content
    except Exception as e:
        print(f"Error reading clipboard: {e}")
        sys.exit(1)


def normalize_indentation(text: str) -> str:
    """
    Normalize indentation to spaces (Python standard).
    Converts tabs to 4 spaces and preserves relative indentation.
    """
    lines = text.split('\n')
    normalized_lines = []
    
    for line in lines:
        # Count leading whitespace (both spaces and tabs)
        stripped = line.lstrip()
        leading = line[:len(line) - len(stripped)]
        
        # Convert tabs to 4 spaces
        leading_normalized = leading.replace('\t', '    ')
        
        # Reconstruct line with normalized indentation
        normalized_lines.append(leading_normalized + stripped)
    
    return '\n'.join(normalized_lines)


def human_type_char(char: str, prev_char: Optional[str] = None):
    """
    Type a single character with human-like variation.
    Handles special characters and indentation properly.
    """
    # Random delay to simulate human typing
    delay = random.uniform(TYPING_SPEED_MIN, TYPING_SPEED_MAX)
    
    # Longer delay after punctuation
    if prev_char and prev_char in '.,;:!?':
        delay += random.uniform(0.1, 0.3)
    
    time.sleep(delay)
    
    # Handle special characters
    if char == '\n':
        pyautogui.press('enter')
        time.sleep(LINE_BREAK_DELAY)
    elif char == '\t':
        # Use spaces instead of tab for Python
        pyautogui.write('    ', interval=INDENT_DELAY)
    elif char == ' ':
        pyautogui.press('space')
    else:
        # Type the character
        pyautogui.write(char, interval=0)


def type_with_indentation(text: str):
    """
    Type text while preserving Python indentation.
    Handles indentation by typing exact number of spaces.
    Accounts for LeetCode's auto-indentation on Enter (macOS optimized).
    """
    lines = text.split('\n')
    prev_char = None
    
    for i, line in enumerate(lines):
        # Calculate exact indentation (count leading spaces)
        stripped = line.lstrip()
        leading_spaces = len(line) - len(stripped)
        
        # If this is not the first line, LeetCode auto-indents on Enter
        # We need to clear auto-indentation and type correct indentation
        if i > 0:
            # Small delay after Enter to let auto-indent happen
            time.sleep(0.1)
            
            # macOS: Use Cmd+Left to go to start of line
            pyautogui.hotkey('command', 'left')
            time.sleep(0.05)
            
            # Delete any existing indentation (LeetCode auto-indents)
            # macOS: Use fn+Delete for forward delete (or use Delete key)
            # Delete up to 20 spaces (5 levels of indentation max)
            for _ in range(20):
                # On macOS, fn+delete is forward delete
                pyautogui.press('delete')
                time.sleep(0.01)
            time.sleep(0.05)
            
            # Type the correct indentation
            if leading_spaces > 0:
                pyautogui.write(' ' * leading_spaces, interval=INDENT_DELAY / 4)
        elif leading_spaces > 0:
            # First line - just type spaces
            pyautogui.write(' ' * leading_spaces, interval=INDENT_DELAY / 4)
        
        # Type the rest of the line (content after indentation)
        for char in stripped:
            human_type_char(char, prev_char)
            prev_char = char
        
        # Add newline if not the last line
        if i < len(lines) - 1:
            human_type_char('\n', prev_char)
            prev_char = '\n'


def countdown(seconds: int = 3):
    """Countdown before starting to type."""
    print(f"Starting in {seconds} seconds...")
    for i in range(seconds, 0, -1):
        print(f"{i}...", end=' ', flush=True)
        time.sleep(1)
    print("\nTyping started! Switch to your target window now.")


def main():
    """Main function."""
    print("Python Code Typer - macOS Edition (LeetCode)")
    print("=" * 50)
    
    # Check if running on macOS
    import platform
    if platform.system() != 'Darwin':
        print("WARNING: This script is optimized for macOS.")
        print(f"Detected OS: {platform.system()}")
        response = input("Continue anyway? (y/n): ").strip().lower()
        if response != 'y':
            print("Cancelled. Use pythonleecodetyper_windows.py for Windows.")
            sys.exit(0)
    
    # Get content from clipboard
    print("Reading from clipboard...")
    content = get_clipboard_content()
    
    # Normalize indentation
    content = normalize_indentation(content)
    
    print(f"Content length: {len(content)} characters")
    print(f"Number of lines: {content.count(chr(10)) + 1}")
    print("\nPreview (first 200 chars):")
    print("-" * 50)
    print(content[:200] + ("..." if len(content) > 200 else ""))
    print("-" * 50)
    
    # Ask for confirmation
    response = input("\nProceed with typing? (y/n): ").strip().lower()
    if response != 'y':
        print("Cancelled.")
        sys.exit(0)
    
    # Countdown
    countdown(3)
    
    # Type the content
    try:
        type_with_indentation(content)
        print("\n✓ Typing completed!")
    except KeyboardInterrupt:
        print("\n\nTyping interrupted by user.")
        sys.exit(1)
    except Exception as e:
        print(f"\n\nError during typing: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()

