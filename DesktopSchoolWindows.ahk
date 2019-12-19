;----------------------------------------------------------
;Apps used
;Task Manager
;Windows Explorer
;Google Chrome
;AutoCad
;Solid Works
;----------------------------------------------------------
;Script defaults
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
;Set key states
SetNumLockState AlwaysOn
SetCapsLockState AlwaysOff
SetScrollLockState AlwaysOff
Menu, Tray, Icon, shell32.dll, 16
Return
;----------------------------------------------------------
;Functions

;Explorer Open
Explorer_Open(){
    IfWinNotExist, ahk_class CabinetWClass
        run, explorer.exe
    GroupAdd, Noah_Explorers, ahk_class CabinetWClass
    if WinActive("ahk_class CabinetWClass")
        GroupActivate, Noah_Explorers, r
    else
        WinActivate ahk_class CabinetWClass
    return
}
;Explorer Close
Explorer_Close(){
    IfWinExist, ahk_class CabinetWClass
        WinClose
    return
}
;Chrome Open
Chrome_Open(){
    IfWinNotExist, ahk_exe chrome.exe
        run, chrome.exe
    If WinActive("ahk_exe chrome.exe")
        send ^{tab}
    else WinActivate ahk_exe chrome.exe
    return
}
;Chrome Close
Chrome_Close(){
    IfWinExist, ahk_exe chrome.exe
        WinClose
    return
}
;Auto Cad Open
Auto_Cad_Open(){
IfWinNotExist, ahk_class AfxMDIFrame140u
	run, C:\Program Files\Autodesk\AutoCAD 2019\acad.exe
	WinMaximize
If WinActive("ahk_class AfxMDIFrame140u")
	send ^{tab}
else WinActivate ahk_class AfxMDIFrame140u
	WinMaximize
return
}
;Auto Cad Close
Auto_Cad_Close(){
IfWinExist, ahk_class AfxMDIFrame140u
    WinClose
return
}

;Solidworks Open
Solidworks_Open(){
IfWinNotExist, ahk_exe SLDWORKS.exe
	run, C:\Program Files\SOLIDWORKS Corp\SOLIDWORKS\SLDWORKS.exe
	WinMaximize
If WinActive("ahk_exe SLDWORKS.exe")
	send ^{tab}
else WinActivate ahk_exe SLDWORKS.exe
	WinMaximize
return
}
;Soildworks Close
Solidworks_Close(){
IfWinExist, ahk_exe SLDWORKS.exe
    WinClose
}
;TaskManager open
TaskManager_Open(){
    IfWinNotExist, ahk_exe Taskmgr.exe
        run, Taskmgr.exe
    WinActivateBottom ahk_class TaskManagerWindow
    return
}
;----------------------------------------------------------
;Hotkeys

;Volume
#WheelUp::Volume_Up
#WheelDown::Volume_Down
#MButton::Media_Play_Pause
#LButton::Media_Prev
#Rbutton::Media_Next

F12::TaskManager_Open()

;F1
F1::Explorer_Open()
CapsLock & F1::Explorer_Close()

;F2
F2::Chrome_Open()
CapsLock & F2::Chrome_Close()

;F3
F3::Auto_Cad_Open()
CapsLock & F3::Auto_Cad_Close()

;F4
F4::Solidworks_Open()
CapsLock & F4::Solidworks_Close()

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