﻿;----------------------------------------------------------
;Main.ahk
;@Author : Noah Hottel
;@Date   : 4/22/2019, 3:34:33 PM
;----------------------------------------------------------
#SingleInstance, force
SetWorkingDir %A_ScriptDir%

SetNumLockState AlwaysOn
SetCapsLockState AlwaysOff
SetScrollLockState AlwaysOff
;----------------------------------------------------------
;^=ctrl
;!=alt
;#=win
;for windows itself
;
;for applications where "tabs" are used
;
;IfWinNotExist, ahk_class x
;	run, x.exe
;If WinActive("ahk_class x")
;	send ^{tab}
;else WinActivate ahk_class x
;
;for apps with no tabs
;IfWinNotExist, ahk_class x
;	run, x.exe
;GroupAdd, userx, ahk_class x
;if WinActive("ahk_class x")
;	GroupActivate, userx, r
;else
;	WinActivate ahk_class x
;
;for killing apps
;IfWinExist, ahk_class x
;    WinClose
;----------------------------------------------------------

;----------------------------------------------------------
;Apps used in order
;Task Manager
;Windows Explorer
;Google Chrome
;Notepad++
;Libre Office
;Spotify
;FastStone
;
;Others
;Volume by mouse wheel with win key
;Caps WinDrag by CapsLock & LButton on any placement of the window
;Back one with CapsLock and F1
;----------------------------------------------------------

;----------------------------------------------------------
;Change Icon and tooltip
Menu, Tray, Tip, Windows
Menu, Tray, Icon, shell32.dll, 16 
return
;----------------------------------------------------------

;----------------------------------------------------------

/***
 *     __     __    _                      
 *     \ \   / /__ | |_   _ _ __ ___   ___ 
 *      \ \ / / _ \| | | | | '_ ` _ \ / _ \
 *       \ V / (_) | | |_| | | | | | |  __/
 *        \_/ \___/|_|\__,_|_| |_| |_|\___|
 *                                         
 */

#WheelUp::Volume_Up
#WheelDown::Volume_Down
#MButton::Media_Play_Pause
#LButton::Media_Prev
#Rbutton::Media_Next
;----------------------------------------------------------

;----------------------------------------------------------

/***
 *       ____                 __        ___       ____                  
 *      / ___|__ _ _ __  ___  \ \      / (_)_ __ |  _ \ _ __ __ _  __ _ 
 *     | |   / _` | '_ \/ __|  \ \ /\ / /| | '_ \| | | | '__/ _` |/ _` |
 *     | |__| (_| | |_) \__ \   \ V  V / | | | | | |_| | | | (_| | (_| |
 *      \____\__,_| .__/|___/    \_/\_/  |_|_| |_|____/|_|  \__,_|\__, |
 *                |_|                                             |___/ 
 */

CapsLock & Lbutton::
coordmode,mouse,screen
MouseGetPos,Xm,Ym,IDwin
WinGetPos,WinXm,WinYm,WinW,WinH,ahk_id %IDwin%
WinActivate, ahk_id %IDwin%

Loop
{
    GetKeyState,LB_,LButton,P 
     
    If (LB_ = "U")
        break
    MouseGetPos,XMnew,YMnew
    
    XMnew -= Xm 
    YMnew -= Ym
    WinGotoX:=(WinXm + XMnew)
    WinGotoY:= (WinYm + YMnew)
   
    WinMove,ahk_id %IDwin%,,%WinGotoX%,%WinGotoY% 
}
return
;----------------------------------------------------------
;----------------------------------------------------------

/***
 *       ____         ____             _    
 *      / ___| ___   | __ )  __ _  ___| | __
 *     | |  _ / _ \  |  _ \ / _` |/ __| |/ /
 *     | |_| | (_) | | |_) | (_| | (__|   < 
 *      \____|\___/  |____/ \__,_|\___|_|\_\
 *                                          
 */

CapsLock & F1::
if WinActive("ahk_class CabinetWClass")
	Send !{left}
if WinActive("ahk_exe chrome.exe")
	Send ^+{tab}
if WinActive("ahk_exe Code.exe")
	Send ^{tab}
Return
;----------------------------------------------------------

/***
 *      _____            _      __  __                                         
 *     |_   _|__ _  ___ | | __ |  \/  |  __ _  _ __    __ _   __ _   ___  _ __ 
 *       | | / _` |/ __|| |/ / | |\/| | / _` || '_ \  / _` | / _` | / _ \| '__|
 *       | || (_| |\__ \|   <  | |  | || (_| || | | || (_| || (_| ||  __/| |   
 *       |_| \__,_||___/|_|\_\ |_|  |_| \__,_||_| |_| \__,_| \__, | \___||_|   
 *                                                           |___/             
 */

^Numpad0::
IfWinNotExist, ahk_exe Taskmgr.exe
	run, Taskmgr.exe
WinActivateBottom ahk_class TaskManagerWindow
return

/***
 *      _____               _                         
 *     | ____|__  __ _ __  | |  ___   _ __  ___  _ __ 
 *     |  _|  \ \/ /| '_ \ | | / _ \ | '__|/ _ \| '__|
 *     | |___  >  < | |_) || || (_) || |  |  __/| |   
 *     |_____|/_/\_\| .__/ |_| \___/ |_|   \___||_|   
 *                  |_|                               
 */

^Numpad1::
;run, Explorer.ahk
IfWinNotExist, ahk_class CabinetWClass
	run, explorer.exe
GroupAdd, userexplorers, ahk_class CabinetWClass
if WinActive("ahk_class CabinetWClass")
	GroupActivate, userexplorers, r
else
	WinActivate ahk_class CabinetWClass
return

!Numpad1::
IfWinExist, ahk_class CabinetWClass
    WinClose
return

/***
 *       ____  _                                  
 *      / ___|| |__   _ __  ___   _ __ ___    ___ 
 *     | |    | '_ \ | '__|/ _ \ | '_ ` _ \  / _ \
 *     | |___ | | | || |  | (_) || | | | | ||  __/
 *      \____||_| |_||_|   \___/ |_| |_| |_| \___|
 *                                                
 */
	
^Numpad2::
;run, Chrome.ahk
IfWinNotExist, ahk_exe chrome.exe
	run, chrome.exe
If WinActive("ahk_exe chrome.exe")
	send ^{tab}
else WinActivate ahk_exe chrome.exe
return

!Numpad2::
IfWinExist, ahk_exe chrome.exe
	WinClose
return

/***
 *     __     ______   ____ ___  ____  _____ 
 *     \ \   / / ___| / ___/ _ \|  _ \| ____|
 *      \ \ / /\___ \| |  | | | | | | |  _|  
 *       \ V /  ___) | |__| |_| | |_| | |___ 
 *        \_/  |____/ \____\___/|____/|_____|
 *                                           
 */

^Numpad3::
;run, VSCode.ahk
IfWinNotExist, ahk_exe Code.exe
	run, C:\Users\noahh\AppData\Local\Programs\Microsoft VS Code\Code.exe
If WinActive("ahk_exe Code.exe")
	send ^+{tab}
else WinActivate ahk_exe Code.exe
return

!Numpad3::
IfWinExist, ahk_exe Code.exe
    WinClose
return

/***
 *      _      _  _                   ___    __   __  _            
 *     | |    (_)| |__   _ __  ___   / _ \  / _| / _|(_)  ___  ___ 
 *     | |    | || '_ \ | '__|/ _ \ | | | || |_ | |_ | | / __|/ _ \
 *     | |___ | || |_) || |  |  __/ | |_| ||  _||  _|| || (__|  __/
 *     |_____||_||_.__/ |_|   \___|  \___/ |_|  |_|  |_| \___|\___|
 *                                                                 
 */

^Numpad4::
;run, Libre_Office.ahk
IfWinNotExist, ahk_class SALFRAME
	run, soffice.exe
GroupAdd, useroffice, ahk_class SALFRAME
if WinActive("ahk_class SALFRAME")
	GroupActivate, useroffice, r
else
	WinActivate ahk_class SALFRAME
return

!Numpad4::
IfWinExist, ahk_class SALFRAME
    WinClose
return

/***
 *      ____                 _    _   __        
 *     / ___|  _ __    ___  | |_ (_) / _| _   _ 
 *     \___ \ | '_ \  / _ \ | __|| || |_ | | | |
 *      ___) || |_) || (_) || |_ | ||  _|| |_| |
 *     |____/ | .__/  \___/  \__||_||_|   \__, |
 *            |_|                         |___/ 
 */

^Numpad5::
IfWinNotExist, ahk_exe Spotify.exe
	run, C:\Users\noahh\AppData\Roaming\Spotify\Spotify.exe
If WinActive("ahk_exe Spotify.exe")
	send ^{Right}
else WinActivate ahk_exe Spotify.exe
return

!Numpad5::
IfWinExist, ahk_exe Spotify.exe
    WinClose
return

/***
 *      _____            _    ____   _                      
 *     |  ___|__ _  ___ | |_ / ___| | |_  ___   _ __    ___ 
 *     | |_  / _` |/ __|| __|\___ \ | __|/ _ \ | '_ \  / _ \
 *     |  _|| (_| |\__ \| |_  ___) || |_| (_) || | | ||  __/
 *     |_|   \__,_||___/ \__||____/  \__|\___/ |_| |_| \___|
 *                                                          
 */

^Numpad6::
;run, FastStone.ahk
IfWinNotExist, ahk_exe FSViewer.exe
	run, FSViewer.exe
GroupAdd, userphotos, ahk_exe FSViewer.exe
if WinActive("ahk_exe FSViewer.exe")
	GroupActivate, userphotos, r
else
	WinActivate ahk_exe FSViewer.exe
return

!Numpad6::
IfWinExist, ahk_exe FSViewer.exe
    WinClose
return