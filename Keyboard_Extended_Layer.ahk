; Extend keyboard layer with windows manupulation
; 
;  The goal of this script is to easily access arrow keys and move/resize windows :
;   - Remap the arrow keys to keyboard  letters for a better accessibility.
;       - Disable permanently CapsLock.
;       - Use CapsLock for accessing Up Down Left Right Home and End keys.
;   - Allow quick windows move and redimensioning.
; 
; The remap part code is based on the "Worly script" : 
;   https://www.autohotkey.com/boards/viewtopic.php?t=67202
; and layers from :
;   https://colemakmods.github.io/ergonomic-mods/extend.html
; The windows manupulation part code is based on the Easy Window Dragging (KDE style) :
;   https://www.autohotkey.com/docs/v2/scripts/index.htm#EasyWindowDrag_(KDE)
;

; Shortcuts (modify them if needed in "key mapping" section)
; UP Arrow      = Capslock + i
; DOWN Arrow    = Capslock + k
; LEFT Arrow    = Capslock + j
; RIGHT Arrow   = Capslock + l
; HOME Key      = Capslock + u
; END Key       = Capslock + o
; BACKSPACE Key = Capslock + p
; DEL Key       = Capslock + ;

; Windows management
; Win key + left clic drag    = move active windows
; Win key + right clic drag   = resize active windows

#Requires AutoHotkey  >=2.0 64-bit ; 
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability

; Arrow key map part 
; --------------------------------------------------
SetCapsLockState "AlwaysOff" ; permanently Disable CapsLock


; Key combination definition
MoveCursor(key) {
    shift := GetKeyState("Shift", "P")
    control := GetKeyState("Control", "P")
    alt := GetKeyState("Alt", "P")
    controlShift := control && shift
    controlAlt := control && alt
    shiftAlt := shift && alt

    if controlShift {
        Send("^+{" key "}")
    }
    else if controlAlt {
        Send("^!{" key "}")
    }
    else if shiftAlt {
        Send("+!{" key "}")
    }
    else if shift {
        Send("+{" key "}")
    }
    else if control {
        Send("^{" key "}")
    }
    else if alt {
        Send("!{" key "}")
    }
    else {
        Send("{" key "}")
    }
}



; Key mapping
; modify modifier key (Capslock) or key here
; modifier & key::MoveCursor("key")
CapsLock & i::MoveCursor("Up")
CapsLock & j::MoveCursor("Left")
CapsLock & k::MoveCursor("Down")
CapsLock & l::MoveCursor("Right")
CapsLock & u::MoveCursor("Home")
CapsLock & o::MoveCursor("End")
CapsLock & p::MoveCursor("Backspace")
CapsLock & SC027::MoveCursor("Del") ; the "sc027" code replace the semicolon in key mapping 
    ; a list of keys can be fount at https://forum.colemak.com/topic/1467-dreymars-big-bag-of-keyboard-tricks-pklwindows-edition/p5/

SetWinDelay(2)
CoordMode("Mouse")
return

; Mouse Gesture
; --------------------------------------------------
LWin & LButton:: {
    MouseGetPos(, , &KDE_id) ; Get the window id
    ; Abort if it's the desktop.
    ClassWin := WinGetClass("ahk_id " KDE_id)
    if (ClassWin = "WorkerW")
        return
    ; If the window is maximized, restore the initial position
    ; and size of the window and center the mouse.
    KDE_Win := WinGetMinMax("ahk_id " KDE_id)
    If KDE_Win {
        WinRestore("ahk_id " KDE_id)
        WinGetPos(&KDE_WinX1, &KDE_WinY1, &KDE_WinW, &KDE_WinH, "ahk_id " KDE_id)
        MouseMove((KDE_WinX1 + (KDE_WinW / 2)), (KDE_WinY1 + (KDE_WinH / 2)), 0)
    }

    ; Move the window.
    MouseGetPos(&KDE_X1, &KDE_Y1)
    WinGetPos(&KDE_WinX1, &KDE_WinY1, , , "ahk_id " KDE_id)
    Loop {
        KDE_Button := GetKeyState("LButton", "P") ? "D" : "U" ; Break if button has been released.
        if (KDE_Button = "U")
            break
        MouseGetPos(&KDE_X2, &KDE_Y2) ; Get the current mouse position.
        KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
        KDE_Y2 -= KDE_Y1
        KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
        KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
        WinMove(KDE_WinX2, KDE_WinY2, , , "ahk_id " KDE_id) ; Move the window to the new position.
    }
    return
}
LWin & RButton:: {
    ; Get the mouse position and window id,
    MouseGetPos(&KDE_X1, &KDE_Y1, &KDE_id)
    ; Abort if it's the desktop.
    ClassWin := WinGetClass("ahk_id " KDE_id)
    if (ClassWin = "WorkerW")
        return
    ; Abort if the window is maximized.
    KDE_Win := WinGetMinMax("ahk_id " KDE_id)
    If KDE_Win
        return
    ; Get the initial window position and size.
    WinGetPos(&KDE_WinX1, &KDE_WinY1, &KDE_WinW, &KDE_WinH, "ahk_id " KDE_id)
    ; Define the window region the mouse is currently in.
    ; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
    If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
        KDE_WinLeft := 1
    Else
        KDE_WinLeft := -1
    If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
        KDE_WinUp := 1
    Else
        KDE_WinUp := -1
    Loop {
        KDE_Button := GetKeyState("RButton", "P") ? "D" : "U" ; Break if button has been released.
        if (KDE_Button = "U")
            break
        MouseGetPos(&KDE_X2, &KDE_Y2) ; Get the current mouse position.
        ; Get the current window position and size.
        WinGetPos(&KDE_WinX1, &KDE_WinY1, &KDE_WinW, &KDE_WinH, "ahk_id " KDE_id)
        KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
        KDE_Y2 -= KDE_Y1
        ; Then, act according to the defined region.
        WinMove(KDE_WinX1 + (KDE_WinLeft + 1) / 2 * KDE_X2, KDE_WinY1 + (KDE_WinUp + 1) / 2 * KDE_Y2, KDE_WinW - KDE_WinLeft * KDE_X2, KDE_WinH - KDE_WinUp * KDE_Y2, "ahk_id " KDE_id)  ; X of resized window
        KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
        KDE_Y1 := (KDE_Y2 + KDE_Y1)
    }
    return
}
LWin & MButton:: {
    MouseGetPos(&origX, &origY, &hwnd)
    if !hwnd
        return

    ; Récupère la position de la fenêtre
    WinGetPos(&winX, &winY, &winW, &winH, "ahk_id " hwnd)

    ; Calcule une position fiable sur la barre de titre (centre horizontal, 10px sous le haut)
    titleBarX := winX + winW // 2
    titleBarY := winY + 10

    ; Déplace la souris sur la barre de titre
    MouseMove(titleBarX, titleBarY, 0)
    Sleep(50)

    ; Simule un clic gauche
    Send("{LButton down}")
    Sleep(50)
    Send("{LButton up}")
    Sleep(50)

    ; Remet la souris à sa position initiale
    MouseMove(origX, origY, 0)

    ; Bascule Always on Top
    isTop := false
    try {
        ex := DllCall("GetWindowLongPtr", "Ptr", hwnd, "Int", -20, "Ptr")
        isTop := (ex & 0x8) ? true : false
    } catch {
        isTop := false
    }

    hInsert := isTop ? -2 : -1  ; HWND_NOTOPMOST / HWND_TOPMOST
    SWP_NOSIZE := 0x1
    SWP_NOMOVE := 0x2
    SWP_NOACTIVATE := 0x10
    flags := SWP_NOSIZE | SWP_NOMOVE | SWP_NOACTIVATE
    try {
        DllCall("SetWindowPos", "Ptr", hwnd, "Ptr", hInsert, "Int", 0, "Int", 0, "Int", 0, "Int", 0, "UInt", flags)
    } catch {
    }
    return
}
