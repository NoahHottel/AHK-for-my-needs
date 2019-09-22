;----------------------------------------------------------
;Main.ahk
;@Author : Noah Hottel (NoahHottel@gmail.com)
;@Link   : https://github.com/NoahHottel
;@Date   : 6/10/2019, 4:08:49 PM
;----------------------------------------------------------
;----------------------------------------------------------
;Script defaults
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
;Set key states
;SetNumLockState AlwaysOn
SetCapsLockState AlwaysOff
;SetScrollLockState AlwaysOff
;Icon
Menu, Tray, Tip, Windows
Menu, Tray, Icon, shell32.dll, 16 
return
;----------------------------------------------------------
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
;FastStone Open
Fastone_Open(){
    IfWinNotExist, ahk_exe FSViewer.exe
        run, FSViewer.exe
    GroupAdd, Noah_Photos, ahk_exe FSViewer.exe
    if WinActive("ahk_exe FSViewer.exe")
        GroupActivate, Noah_Photos, r
    else
        WinActivate ahk_exe FSViewer.exe
    return
}
;FastStone Close
Fastone_Close(){
    IfWinExist, ahk_exe FSViewer.exe
        WinClose
    return
}
;Firefox Open
Firefox_Open(){
    IfWinNotExist, ahk_exe firefox.exe
        run, firefox.exe
    If WinActive("ahk_exe firefox.exe")
        send ^{tab}
    else WinActivate ahk_exe firefox.exe
    return
}
;Firefox Close
Firefox_Close(){
    IfWinExist, ahk_exe firefox.exe
        WinClose
    return
}
;Go_Back
Go_Back(){
    if WinActive("ahk_exe explorer.exe")
        Send !{left}
    if WinActive("ahk_exe firefox.exe")
        Send ^+{tab}
    if WinActive("ahk_exe Code.exe")
        Send ^{tab}
    Return
}
;Libre Office Open
Libre_Office_Open(){
    IfWinNotExist, ahk_class SALFRAME
        run, soffice.exe
    GroupAdd, Noah_Office, ahk_class SALFRAME
    if WinActive("ahk_class SALFRAME")
        GroupActivate, Noah_Office, r
    else
        WinActivate ahk_class SALFRAME
    return
}
;Libre Office Close
Libre_Office_Close(){
    IfWinExist, ahk_class SALFRAME
        WinClose
    return
}
;Spotify Open
Spotify_Open(){
    IfWinNotExist, ahk_exe Spotify.exe
        run, C:\Users\noahh\AppData\Roaming\Spotify\Spotify.exe
    If WinActive("ahk_exe Spotify.exe")
        send {Media_Next}
    else WinActivate ahk_exe Spotify.exe
    return
}
;Spotify Close
Spotify_Close(){
    IfWinExist, ahk_exe Spotify.exe
        WinClose
    return
}
;TaskManager open
TaskManager_Open(){
    IfWinNotExist, ahk_exe Taskmgr.exe
        run, Taskmgr.exe
    WinActivateBottom ahk_class TaskManagerWindow
    return
}
;Vlc Open
Vlc_Open(){
    IfWinNotExist, ahk_exe vlc.exe
            run, vlc.exe
        GroupAdd, Noah_Videos, ahk_exe vlc.exe
        if WinActive("ahk_exe vlc.exe")
            GroupActivate, Noah_Videos, r
        else
            WinActivate ahk_exe vlc.exe
        return
}
;Vlc Close
Vlc_Close(){
    IfWinExist, ahk_exe vlc.exe
            WinClose
        return
}
;VSCode Open
VSCode_Open(){
    IfWinNotExist, ahk_exe Code.exe
        run, C:\Users\noahh\AppData\Local\Programs\Microsoft VS Code\Code.exe
    If WinActive("ahk_exe Code.exe")
        send ^+{tab}
    else WinActivate ahk_exe Code.exe
    return
}
;VSCode Close
VSCode_Close(){
    IfWinExist, ahk_exe Code.exe
        WinClose
    return
}
;----------------------------------------------------------
;----------------------------------------------------------
;Hot Keys

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

F1::Go_Back()

F2::Explorer_Open()
CapsLock & F2::Explorer_Close()

F3::Firefox_Open()
CapsLock & F3::Firefox_Close()

F4::VSCode_Open()
CapsLock & F4::VSCode_Close()

F5::Libre_Office_Open()
CapsLock & F5::Libre_Office_Close()

F6::Spotify_Open()
CapsLock & F6::Spotify_Close()

F7::Fastone_Open()
CapsLock & F7::Fastone_Close()

F8::Vlc_Open()
CapsLock & F8::Vlc_Close()



F11:: run, Mailto:

F12::TaskManager_Open()

;Script Properties

+F1::Edit
+F2::Reload

;Need Direct Execution

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