# AHK_Keyboard_Extended_Layer

Extend keyboard layer with windows manipulation.

## Goal
The goal of this script is to easily access arrow keys and move/resize windows:
- Remap the arrow keys to keyboard letters for better accessibility.
  - Disable permanently CapsLock.
  - Use CapsLock for accessing Up, Down, Left, Right, Home and End keys.
- Allow quick window move and resizing.

## References
- Remap part code is based on the ["Worly script"](https://www.autohotkey.com/boards/viewtopic.php?t=67202).
- Layers from [Colemak Extend](https://colemakmods.github.io/ergonomic-mods/extend.html).
- Windows manipulation code is based on [Easy Window Dragging (KDE style)](https://www.autohotkey.com/docs/v2/scripts/index.htm#EasyWindowDrag_(KDE)).

## Shortcuts
- **Up Arrow** → CapsLock + i  
- **Down Arrow** → CapsLock + k  
- **Left Arrow** → CapsLock + j  
- **Right Arrow** → CapsLock + l  
- **Home** → CapsLock + u  
- **End** → CapsLock + o  
- **Backspace** → CapsLock + p  
- **Delete** → CapsLock + ;  

## Window Management
- **Move window**: Win key + Left click drag  
- **Resize window**: Win key + Right click drag  


## Installation

1. Install [AutoHotkey v2 (64-bit)](https://www.autohotkey.com/download/).
2. Download this repository or copy the script file (`.ahk`) to your computer.
3. Double-click the script file to run it.
4. To start it automatically with Windows:
   - Press `Win + R`, type `shell:startup`, and press Enter.
   - Place a shortcut of the script file in the opened folder.
