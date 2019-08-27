;----------------------------------------------------------
;Modded Minecraft.ahk
;@Author : Noah Hottel (NoahHottel@gmail.com)
;@Link   : https://github.com/NoahHottel
;@Date   : 8/12/2019, 8:27:44 PM
;----------------------------------------------------------
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
#IfWinActive ahk_exe javaw.exe 
#maxThreadsPerHotkey, 2
;Icon
Menu, Tray, Tip, Minecraft
Menu, Tray, Icon, C:\Users\noahh\Pictures\Saved Pictures\Netherrack.png 
return

;Auto Shifter
F10::
SHIFTING := !SHIFTING
While (not SHIFTING)
{
    send <+
    sleep 100
}
return
