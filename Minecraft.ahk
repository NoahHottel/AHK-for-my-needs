;----------------------------------------------------------
;Minecraft.ahk
;@Author : Noah Hottel (NoahHottel@gmail.com)
;@Link   : https://github.com/NoahHottel
;@Date   : 8/12/2019, 1:28:46 PM
;----------------------------------------------------------
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
#IfWinActive ahk_exe javaw.exe
;CHANGE IF / WHEN ADDING MORE HOTKEYS 
#maxThreadsPerHotkey, 2
;Icon
Menu, Tray, Tip, Minecraft
Menu, Tray, Icon, C:\Program Files (x86)\Minecraft Launcher\MinecraftLauncher.exe 
return
;----------------------------------------------------------
;Open Keys
;F8 \\
;F9 \\
;F10
;F12
;PrtSc
;ScrLk
;Pause
;Insert
;Delete
;Home
;End
;PgUp
;PgDn
;Up
;Down
;Left
;Right
;Grave
;O
;-
;=
;Backspace
;Caps Lock
;R
;Y
;U
;I
;O
;P
;[]
;]
;\
;G
;H
;J
;K
;'
;Enter
;Z
;V
;BN
;M
;,
;.
;LWin
;LAlt
;RWin
;RAlt
;RCtrl
;Menu
;NumLock
;Num/
;Num*
;Num-
;Num+
;Num.
;NumEnter
;NumPad0
;NumPad1
;NumPad2
;NumPad3
;NumPad4
;NumPad5
;NumPad6
;NumPad7
;NumPad8
;NumPad9
;----------------------------------------------------------

;AFK Fishing
F9::
FISHING := !FISHING
If not FISHING
    MouseClick, Right, , , , ,D
Else
    MouseClick, Right, , , , ,U
    
return

;AFK Mining
F8::
MINING := !MINING
If not MINING
    MouseClick, Left,,,,,D
Else
    MouseClick, Left,,,,,U
    
return

;Numpad Hotbar
NumPad8::
NumPad6::
    MouseClick, WheelDown,,,1
return
Numpad2::
Numpad4::
    MouseClick, WheelUp,,,1
return