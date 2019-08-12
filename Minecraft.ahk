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
;AFK Fishing
F8::
FISHING := !FISHING
If not FISHING
    MouseClick, Right, , , , ,D
Else
    MouseClick, Right, , , , ,U
    
return