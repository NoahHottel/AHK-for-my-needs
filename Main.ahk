;----------------------------------------------------------
;Main.ahk
;@Author : Noah Hottel (NoahHottel@gmail.com)
;@Link   : https://github.com/NoahHottel
;@Date   : 6/10/2019, 4:08:49 PM
;----------------------------------------------------------
;Script defaults
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
run, App_Change.ahk
;----------------------------------------------------------
#NoTrayIcon
;Set key states
SetNumLockState AlwaysOn
SetCapsLockState AlwaysOff
;SetScrollLockState AlwaysOff
return
;----------------------------------------------------------
;Volume
#WheelUp::Volume_Up
#WheelDown::Volume_Down
#MButton::Media_Play_Pause
#LButton::Media_Prev
#Rbutton::Media_Next

#Up::Volume_Up
#Down::Volume_Down
#Space::Media_Play_Pause
#Left::Media_Prev
#Right::Media_Next
;----------------------------------------------------------
;Win Controls

;WinDrag
CapsLock & LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, Off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, EWD_WatchMouse, Off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, 0   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return
;----------------------------------------------------------