# Extend Keyboard Layer with Windows Manipulation

This **AutoHotkey v2** script improves keyboard accessibility and makes window management easier.

---

## Features

### Keyboard remapping
- **CapsLock permanently disabled**.
- Use **CapsLock as a modifier key** to access arrow keys and specials.

Default shortcuts:

| Shortcut            | Action         |
|---------------------|----------------|
| CapsLock + **i**    | Arrow ↑        |
| CapsLock + **k**    | Arrow ↓        |
| CapsLock + **j**    | Arrow ←        |
| CapsLock + **l**    | Arrow →        |
| CapsLock + **u**    | Home           |
| CapsLock + **o**    | End            |
| CapsLock + **p**    | Backspace      |
| CapsLock + **;**    | Delete         |

Combinations with **Shift / Ctrl / Alt** are supported (example: `CapsLock + Ctrl + i` ⇒ `Ctrl + ↑`).

---

### Window manipulation
- **Win + left click drag** → move active window (KDE style).  
- **Win + right click drag** → resize active window.
- **Win + middle click (wheel)** => stick windows on top

If the window is maximized, left drag with Win will restore it automatically before moving.

---

## References
- [Worly script (remap)](https://www.autohotkey.com/boards/viewtopic.php?t=67202)  
- [Colemak Extend layers](https://colemakmods.github.io/ergonomic-mods/extend.html)  
- [Easy Window Dragging (KDE style)](https://www.autohotkey.com/docs/v2/scripts/index.htm#EasyWindowDrag_(KDE))  

---

## Installation & usage
1. Install **[AutoHotkey v2](https://www.autohotkey.com/)** (64-bit recommended).  
2. Save this script as `extend-layer.ahk`.  
3. Double-click the file to run it.  
4. The script runs in the background (tray icon). Exit from tray menu when not needed.  

---

## Notes
- Written for **AutoHotkey v2.0+ 64-bit**.  
- Extra key scancodes can be found [here](https://forum.colemak.com/topic/1467-dreymars-big-bag-of-keyboard-tricks-pklwindows-edition/p5/).
