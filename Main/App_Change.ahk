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
GroupAdd, Win_Exception, Minecraft
GroupAdd, Win_Exception, ahk_exe starwarsbattlefrontii.exe
;----------------------------------------------------------
; #IfWinActive, Minecraft
;----------------------------------------------------------
#IfWinNotActive, ahk_group Win_Exception
;----------------------------------------------------------
;Explorer Start
Explorer_Start(){
    run, explorer.exe
    GroupAdd, Noah_Explorers, ahk_class CabinetWClass
    Return
}
;Explorer Open
Explorer_Open(){
    IfWinNotExist, ahk_class CabinetWClass
        run, explorer.exe
        GroupAdd, Noah_Explorers, ahk_class CabinetWClass
    If WinActive("ahk_class CabinetWClass")
        GroupActivate, Noah_Explorers, r
    Else
        WinActivate ahk_class CabinetWClass
    Return
}
;Explorer Close
Explorer_Close(){
    IfWinExist, ahk_class CabinetWClass
        WinClose
    Return
}
;----------------------------------------------------------
;FastStone Start
FastStone_Start(){
    run, FSViewer.exe
    GroupAdd, Noah_FastStone, ahk_exe FSViewer.exe
    Return
}
;FastStone Open
FastStone_Open(){
    IfWinNotExist, ahk_exe FSViewer.exe
        run, FSViewer.exe
        GroupAdd, Noah_FastStone, ahk_exe FSViewer.exe
    If WinActive("ahk_exe FSViewer.exe")
        GroupActivate, Noah_FastStone, r
    Else
        WinActivate ahk_exe FSViewer.exe
    Return
}
;FastStone Close
FastStone_Close(){
    IfWinExist, ahk_exe FSViewer.exe
        WinClose
    Return
}
;----------------------------------------------------------
;Firefox Open
Firefox_Open(){
    IfWinNotExist, ahk_exe firefox.exe
        run, firefox.exe
    If WinActive("ahk_exe firefox.exe")
        send ^{tab}
    Else WinActivate ahk_exe firefox.exe
    Return
}
;Firefox Close
Firefox_Close(){
    IfWinExist, ahk_exe firefox.exe
        WinClose
    Return
}
;----------------------------------------------------------
;GMail
GMail_Open(){
    Run "https://mail.google.com/mail/u/0/#inbox"
}
;----------------------------------------------------------
;Gnu_Cash Open
Gnu_Cash_Open(){
    IfWinNotExist, ahk_exe gnucash.exe
        run, C:\Program Files (x86)\gnucash\bin\gnucash.exe
    If WinActive("ahk_exe gnucash.exe")
        send ^!{PgDn}
    Else WinActivate ahk_exe gnucash.exe
    Return
}
;Gnu_Cash Close
Gnu_Cash_Close(){
    IfWinExist, ahk_exe gnucash.exe
        WinClose
    Return
}
;----------------------------------------------------------
;Go_Back
Go_Back(){
    If WinActive("ahk_exe Code.exe")
        Send ^{tab}
    If WinActive("ahk_exe explorer.exe")
        Send !{left}
    If WinActive("ahk_exe firefox.exe")
        Send ^+{tab}
    If WinActive("ahk_exe gnucash.exe")
        send ^!{PgUp}
    If WinActive("ahk_exe WindowsTerminal.exe")
        Send ^+{tab}
    If WinActive("ahk_exe thunderbird.exe")
        Send ^+{tab}
    Return
}
;----------------------------------------------------------
;Libre Office Start
Libre_Office_Start(){
    run, soffice.exe
    GroupAdd, Noah_Office, ahk_class SALFRAME
    Return
}
;Libre Office Open
Libre_Office_Open(){
    IfWinNotExist, ahk_class SALFRAME
        run, soffice.exe
        GroupAdd, Noah_Office, ahk_class SALFRAME
    If WinActive("ahk_class SALFRAME")
        GroupActivate, Noah_Office, r
    Else
        WinActivate ahk_class SALFRAME
    Return
}
;Libre Office Close
Libre_Office_Close(){
    IfWinExist, ahk_class SALFRAME
        WinClose
    Return
}
;----------------------------------------------------------
;Spotify Open
Spotify_Open(){
    IfWinNotExist, ahk_exe Spotify.exe
        run, %APPDATA%\Roaming\Spotify\Spotify.exe
    If WinActive("ahk_exe Spotify.exe")
        send {Media_Next}
    Else WinActivate ahk_exe Spotify.exe
    Return
}
;Spotify Close
Spotify_Close(){
    IfWinExist, ahk_exe Spotify.exe
        WinClose
    Return
}
;----------------------------------------------------------
;Steam Open
Steam_Open(){
    IfWinNotExist, ahk_exe Steam.exe
        Run, C:\Program Files (x86)\Steam\steam.exe
    WinActivateBottom ahk_exe Steam.exe
    Return
}
;Steam Close
Steam_Close(){
    IfWinExist, ahk_exe Steam.exe
        WinClose
    Return
}
;----------------------------------------------------------
;TaskManager Open
TaskManager_Open(){
    IfWinNotExist, ahk_exe Taskmgr.exe
        run, Taskmgr.exe
    WinActivateBottom ahk_class TaskManagerWindow
    Return
}
;----------------------------------------------------------
Terminal_Open(){
    IfWinNotExist, ahk_exe WindowsTerminal.exe
        Run, C:\Users\noahh\Links\Windows Terminal
    If WinActive("ahk_exe WindowsTerminal.exe")
        send ^{tab}
    Else WinActivate ahk_exe WindowsTerminal.exe
    Return
}

Terminal_Close(){
    IfWinExist, ahk_exe WindowsTerminal.exe
        WinClose
    Return
}
;----------------------------------------------------------
;Thunderbird Open
Thunderbird_Open(){
    IfWinNotExist, ahk_exe thunderbird.exe
        run, thunderbird.exe
    If WinActive("ahk_exe thunderbird.exe")
        send ^{tab}
    Else WinActivate ahk_exe thunderbird.exe
    Return
}
;Thunderbird Close
Thunderbird_Close(){
    IfWinExist, ahk_exe thunderbird.exe
        WinMinimize, ahk_exe thunderbird.exe
    Return
}
;----------------------------------------------------------
;VLC Start
VLC_Start(){
    run, vlc.exe
    GroupAdd, Noah_VLC, ahk_exe vlc.exe
    Return
}
;VLC Open
VLC_Open(){
    IfWinNotExist, ahk_exe vlc.exe
        run, vlc.exe
        GroupAdd, Noah_VLC, ahk_exe vlc.exe
    If WinActive("ahk_exe vlc.exe")
        GroupActivate, Noah_VLC, r
    Else
        WinActivate ahk_exe vlc.exe
    Return
}
;VLC Close
VLC_Close(){
    IfWinExist, ahk_exe vlc.exe
        WinClose
    Return
}
;----------------------------------------------------------
;VSCode Open
VSCode_Open(){
    IfWinNotExist, ahk_exe Code.exe
        run, C:\Program Files\Microsoft VS Code\Code.exe
    If WinActive("ahk_exe Code.exe")
        send ^+{tab}
    Else WinActivate ahk_exe Code.exe
    Return
}
;VSCode Close
VSCode_Close(){
    IfWinExist, ahk_exe Code.exe
        WinClose
    Return
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

^F8::FastStone_Start()
F8::FastStone_Open()
!F8::FastStone_Close()
 

F9::Gnu_Cash_Open()
!F9::Gnu_Cash_Close()

F10::Terminal_Open()
!F10::Terminal_Close()

F11::ThunderBird_Open()
!F11::ThunderBird_Close()

F12::TaskManager_Open()

;----------------------------------------------------------
;Script Properties
; +F1::Suspend
; +F2::Reload
; +F3::Edit
;----------------------------------------------------------