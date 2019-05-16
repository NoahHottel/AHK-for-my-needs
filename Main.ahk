;----------------------------------------------------------
;Main.ahk
;@Author : Noah Hottel
;@Date   : 4/22/2019, 3:34:33 PM
;----------------------------------------------------------
#SingleInstance, force
SetWorkingDir %A_ScriptDir%

SetNumLockState AlwaysOn
SetCapsLockState AlwaysOff
SetScrollLockState AlwaysOff
;----------------------------------------------------------
;start at opening
;run application_switcher.ahk
;----------------------------------------------------------

;----------------------------------------------------------
;^=ctrl
;!=alt
;#=win
;for windows itself
;
;for applications where "tabs" are used
;
;IfWinNotExist, ahk_class x
;	run, x.exe
;If WinActive("ahk_class x")
;	send ^{tab}
;else WinActivate ahk_class x
;
;for apps with no tabs
;IfWinNotExist, ahk_class x
;	run, x.exe
;GroupAdd, userx, ahk_class x
;if WinActive("ahk_class x")
;	GroupActivate, userx, r
;else
;	WinActivate ahk_class x
;
;for killing apps
;IfWinExist, ahk_class x
;    WinClose
;----------------------------------------------------------

;----------------------------------------------------------
;Apps used in order
;Task Manager
;Windows Explorer
;Google Chrome
;Notepad++
;Libre Office
;Spotify
;FastStone
;
;Others
;Volume by mouse wheel with win key
;Caps WinDrag by CapsLock & LButton on any placement of the window
;Back one with CapsLock and F1
;----------------------------------------------------------

;----------------------------------------------------------
;Change Icon and tooltip
Menu, Tray, Tip, Windows
Menu, Tray, Icon, shell32.dll, 16 
return
;----------------------------------------------------------

;----------------------------------------------------------

/***
 *     __     __    _                      
 *     \ \   / /__ | |_   _ _ __ ___   ___ 
 *      \ \ / / _ \| | | | | '_ ` _ \ / _ \
 *       \ V / (_) | | |_| | | | | | |  __/
 *        \_/ \___/|_|\__,_|_| |_| |_|\___|
 *                                         
 */

#WheelUp::Volume_Up
#WheelDown::Volume_Down
#MButton::Media_Play_Pause
#LButton::Media_Prev
#Rbutton::Media_Next
;----------------------------------------------------------

;----------------------------------------------------------

/***
 *       ____                 __        ___       ____                  
 *      / ___|__ _ _ __  ___  \ \      / (_)_ __ |  _ \ _ __ __ _  __ _ 
 *     | |   / _` | '_ \/ __|  \ \ /\ / /| | '_ \| | | | '__/ _` |/ _` |
 *     | |__| (_| | |_) \__ \   \ V  V / | | | | | |_| | | | (_| | (_| |
 *      \____\__,_| .__/|___/    \_/\_/  |_|_| |_|____/|_|  \__,_|\__, |
 *                |_|                                             |___/ 
 */

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
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return
;----------------------------------------------------------

;----------------------------------------------------------

/***
 *       ____         ____             _    
 *      / ___| ___   | __ )  __ _  ___| | __
 *     | |  _ / _ \  |  _ \ / _` |/ __| |/ /
 *     | |_| | (_) | | |_) | (_| | (__|   < 
 *      \____|\___/  |____/ \__,_|\___|_|\_\
 *                                          
 */

CapsLock & F1::
if WinActive("ahk_class CabinetWClass")
	Send !{left}
if WinActive("ahk_exe chrome.exe")
	Send ^+{tab}
if WinActive("ahk_exe Code.exe")
	Send ^{tab}
Return
;----------------------------------------------------------
