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

F11::Mail_Open()

F12::TaskManager_Open()

;Script Properties
+F1::Suspend
+F2::Reload
+F3::Edit
;----------------------------------------------------------