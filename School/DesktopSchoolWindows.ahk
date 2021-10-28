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

F1::Explorer_Open()
CapsLock & F1::Explorer_Close()

F2::Chrome_Open()
CapsLock & F2::Chrome_Close()

F3::Auto_Cad_Open()
CapsLock & F3::Auto_Cad_Close()

F4::Solidworks_Open()
CapsLock & F4::Solidworks_Close()