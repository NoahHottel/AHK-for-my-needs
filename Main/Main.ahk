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
run, WinDrag.ahk
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