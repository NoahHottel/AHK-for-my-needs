;----------------------------------------------------------
;App Change.ahk
;@Author : Noah Hottel (NoahHottel@gmail.com)
;@Link   : https://github.com/NoahHottel
;@Date   : 10/11/2019, 7:43:53 PM
;----------------------------------------------------------
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
;Icon
Menu, Tray, Tip, Windows
Menu, Tray, Icon, shell32.dll, 16 
;----------------------------------------------------------
;Functions
;----------------------------------------------------------
;Exceptions
#IfWinActive Minecraft
    F3::Send, +F3
#IfWinActive
;----------------------------------------------------------
;Explorer Start
Explorer_Start(){
    run, explorer.exe
    GroupAdd, Noah_Explorers, ahk_class CabinetWClass
    return
}
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
;----------------------------------------------------------
;FastStone Start
FastStone_Start(){
    run, FSViewer.exe
    GroupAdd, Noah_FastStone, ahk_exe FSViewer.exe
    return
}
;FastStone Open
FastStone_Open(){
    IfWinNotExist, ahk_exe FSViewer.exe
        run, FSViewer.exe
    GroupAdd, Noah_FastStone, ahk_exe FSViewer.exe
    if WinActive("ahk_exe FSViewer.exe")
        GroupActivate, Noah_FastStone, r
    else
        WinActivate ahk_exe FSViewer.exe
    return
}
;FastStone Close
FastStone_Close(){
    IfWinExist, ahk_exe FSViewer.exe
        WinClose
    return
}
;----------------------------------------------------------
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
;----------------------------------------------------------
;Go_Back
Go_Back(){
    if WinActive("ahk_exe explorer.exe")
        Send !{left}
    if WinActive("ahk_exe firefox.exe")
        Send ^+{tab}
    if WinActive("ahk_exe Code.exe")
        Send ^{tab}
    if WinActive("ahk_exe thunderbird.exe")
        Send ^+{tab}
    return
}
;----------------------------------------------------------
;Libre Office Start
Libre_Office_Start(){
    run, soffice.exe
    GroupAdd, Noah_Office, ahk_class SALFRAME
    return
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
;----------------------------------------------------------
;GMail
GMail_Open(){
    Run "https://mail.google.com/mail/u/0/#inbox"
}
;----------------------------------------------------------
;Spotify Open
Spotify_Open(){
    IfWinNotExist, ahk_exe Spotify.exe
        run, %APPDATA%\Roaming\Spotify\Spotify.exe
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
;----------------------------------------------------------
;Steam Open
Steam_Open(){
    IfWinNotExist, ahk_exe Steam.exe
        Run, C:\Program Files (x86)\Steam\steam.exe
    WinActivateBottom ahk_exe Steam.exe
    return
}
;Steam Close
Steam_Close(){
    IfWinExist, ahk_exe Steam.exe
        WinClose
    return
}
;----------------------------------------------------------
;TaskManager Open
TaskManager_Open(){
    IfWinNotExist, ahk_exe Taskmgr.exe
        run, Taskmgr.exe
    WinActivateBottom ahk_class TaskManagerWindow
    return
}
;----------------------------------------------------------
;Thunderbird Open
Thunderbird_Open(){
    IfWinNotExist, ahk_exe thunderbird.exe
        run, thunderbird.exe
    If WinActive("ahk_exe thunderbird.exe")
        send ^{tab}
    else WinActivate ahk_exe thunderbird.exe
    return
}
;Thunderbird Close
Thunderbird_Close(){
    IfWinExist, ahk_exe thunderbird.exe
        WinMinimize, ahk_exe thunderbird.exe
    return
}
;----------------------------------------------------------
;VLC Start
VLC_Start(){
    run, vlc.exe
    GroupAdd, Noah_VLC, ahk_exe vlc.exe
    return
}
;VLC Open
VLC_Open(){
    IfWinNotExist, ahk_exe vlc.exe
        run, vlc.exe
    GroupAdd, Noah_VLC, ahk_exe vlc.exe
    if WinActive("ahk_exe vlc.exe")
        GroupActivate, Noah_VLC, r
    else
        WinActivate ahk_exe vlc.exe
    return
}
;VLC Close
VLC_Close(){
    IfWinExist, ahk_exe vlc.exe
        WinClose
    return
}
;----------------------------------------------------------
;VSCode Open
VSCode_Open(){
    IfWinNotExist, ahk_exe Code.exe
        run, C:\Program Files\Microsoft VS Code\Code.exe
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

F1::Go_Back()

^F2::Explorer_Start()
F2::Explorer_Open()
!F2::Explorer_Close()

F3::Firefox_Open()
!F3::Firefox_Close()

F4::VSCode_Open()
!F4::VSCode_Close()

^F5::Libre_Office_Start()
F5::Libre_Office_Open()
!F5::Libre_Office_Close()

F6::Steam_Open()
!F6::Steam_Close()

^F7::VLC_Start()
F7::VLC_Open()
!F7::VLC_Close()

#^F8::FastStone_Start()
#F8::FastStone_Open()
#!F8::FastStone_Close()
 

;F9

;F10

F11::ThunderBird_Open()
!F11::ThunderBird_Close()

F12::TaskManager_Open()

;Non-Function Hotkeys
;https://stackoverflow.com/questions/1794258/detect-a-double-key-press-in-autohotkey By: user2599522
~Ctrl::
keywait,Ctrl
keywait,Ctrl,d t0.5 ; Increase the "t" value for a longer timeout.
if errorlevel
return
WinMaximize, A
return
;----------------------------------------------------------
;Script Properties
; +F1::Suspend
; +F2::Reload
; +F3::Edit
;----------------------------------------------------------