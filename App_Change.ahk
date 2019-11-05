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
;Mail
Mail_Open(){
    Run "https://mail.google.com/mail/u/0/#inbox"
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
;Steam Open
/*
Steam_Open(){
    IfWinNotExist, ahk_exe Steam.exe
        Run, C:\Program Files (x86)\Steam\Steam.exe‪
    WinActivateBottom ahk_exe Steam.exe
    return
}
;Steam Close
Steam_Close(){
    IfWinExist, ahk_exe Steam.exe
        WinClose
    return
}
*/
;TaskManager open
TaskManager_Open(){
    IfWinNotExist, ahk_exe Taskmgr.exe
        run, Taskmgr.exe
    WinActivateBottom ahk_class TaskManagerWindow
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
F1::Go_Back()

F2::Explorer_Open()
CapsLock & F2::Explorer_Close()

F3::Firefox_Open()
CapsLock & F3::Firefox_Close()

F4::VSCode_Open()
CapsLock & F4::VSCode_Close()

F5::Spotify_Open()
CapsLock & F5::Spotify_Close()

F6::Libre_Office_Open()
CapsLock & F6::Libre_Office_Close()
/*
F7::Steam_Open()
CapsLock & F7::Steam_Close()
*/
F11::Mail_Open()

F12::TaskManager_Open()

;Script Properties
+F1::Suspend
+F2::Reload
+F3::Edit
;----------------------------------------------------------