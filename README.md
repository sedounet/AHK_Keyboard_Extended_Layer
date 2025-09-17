# AHK_Keyboard_Extended_Layer

*Extend your keyboard with home-row navigation and KDE-style window management.*

## Features

### Keyboard Remapping
- **CapsLock is permanently disabled** and repurposed as a modifier key.
- **Arrow keys on home row** for faster access:
  - `CapsLock + i` → Up Arrow  
  - `CapsLock + k` → Down Arrow  
  - `CapsLock + j` → Left Arrow  
  - `CapsLock + l` → Right Arrow  
- Extra keys:  
  - `CapsLock + u` → Home  
  - `CapsLock + o` → End  
  - `CapsLock + p` → Backspace  
  - `CapsLock + ;` → Delete  

Modifier keys (`Shift`, `Ctrl`, `Alt`) are preserved when combined.

### Window Management
- **Move windows**: `Win + Left Mouse Drag`
- **Resize windows**: `Win + Right Mouse Drag`

## Installation

1. Install [AutoHotkey v2 (64-bit)](https://www.autohotkey.com/download/).
2. Download this repository or copy the script file (`.ahk`) to your computer.
3. Double-click the script file to run it.
4. To start it automatically with Windows:
   - Press `Win + R`, type `shell:startup`, and press Enter.
   - Place a shortcut of the script file in the opened folder.

## Customization

You can edit the script to fit your needs:

- **Change the modifier key**:  
  By default, `CapsLock` is used. You can replace it in the *key mapping* section, for example:  
  ```ahk
  CapsLock & i::MoveCursor("Up")
→ Replace CapsLock with another key (e.g., RAlt, RCtrl).

Change the mapped keys:
Modify the letters used to trigger arrow keys and other functions. Example:

ahk
Copier le code
CapsLock & h::MoveCursor("Left")
Add or remove mappings:
Follow the same format to create additional combinations for other keys (see AutoHotkey key list).

Adjust window move/resize behavior:
The LWin & LButton and LWin & RButton hotkeys control window dragging and resizing.
You can assign them to different modifier keys if needed.

References
Based on the Worly script and Colemak Extend layers.

Window management adapted from Easy Window Dragging (KDE style).
