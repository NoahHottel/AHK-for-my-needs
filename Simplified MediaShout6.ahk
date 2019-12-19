;----------------------------------------------------------
;Simplified MediaShout6.ahk
;@Author : Noah Hottel (NoahHottel@gmail.com)
;@Link   : https://github.com/NoahHottel
;@Date   : 9/23/2019, 4:58:53 PM
;----------------------------------------------------------
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
Menu, Tray, Icon, C:\Program Files (x86)\MediaComplete\MediaShout 6\MediaShout 6.exe
#IfWinActive ahk_exe MediaShout 6.exe
;This script is made to be used with MediaShout6
;Left to F7 and Right to F9 for powerpoint controls
Left::F7
Right::F9