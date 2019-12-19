;----------------------------------------------------------
;Apps used
;Windows Explorer
;Google Chrome
;Visual Studio
;Task Manager
;VLC
;----------------------------------------------------------
;Script defaults
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
;Set key states
SetCapsLockState AlwaysOff
SetScrollLockState AlwaysOff
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


;Visual Studio open
Visual_Studio_Open(){
IfWinNotExist, ahk_exe devenv.exe
	run, C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe
	WinMaximize
If WinActive("ahk_exe devenv.exe")
	send ^{tab}
else WinActivate ahk_exe devenv.exe 
	WinMaximize
return
}
;Visual Studio Close
Visual_Studio_Close(){
IfWinExist, ahk_exe devenv.exe
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
;----------------------------------------------------------
;Hotkeys

^1::Explorer_Open()
!1::Explorer_Close()
^2::Chrome_Open()
!2::Chrome_Close()
^3::Visual_Studio_Open()
!3::Visual_Studio_Close()
^0::TaskManager_Open()

^4::Vlc_Open()
!4::Vlc_Close()