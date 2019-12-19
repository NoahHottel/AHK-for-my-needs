;----------------------------------------------------------
;My AutoCad Script to fit my needs as an AutoCad User
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
Menu, Tray, Icon, C:\Program Files\Autodesk\AutoCAD 2020\acad.exe
Return
;----------------------------------------------------------
;https://damassets.autodesk.net/content/dam/autodesk/www/shortcuts/autocad/AutoCAD-Shortcuts-Guide-Autodesk.pdf
;----------------------------------------------------------
#IfWinActive ahk_class AfxMDIFrame140u

;FUNCTIONS

;Zoom All funct
ZoomAll(){
	;zoom command
	send ZOOM{Enter}
	;Sleep
	Sleep 10
	;all command
	send ALL{Enter}
}
;Save funct
Save(){
	;save command
	send QSAVE{Enter}
}
;Save As funct
SaveAs(){
	;saveas command
	send SAVEAS{Enter}
}
;Left Mouse funct
LeftMouse(){
	;wait for left mouse button
	KeyWait, LButton, D
}
;Radius Circle funct
Circle(){
	;circle command
	send CIRCLE{Enter}
}
;Diameter Circle funct
DiameterCircle(){
	;call circle
	Circle()
	;wait for lmouse
	LeftMouse()
	;diameter
	send DIAMETER{Enter}
}
;Explode funct
Explode(){
	;explode command
	send EXPLODE{Enter}
}
;Fillet funct
Fillet(){
	 ;fillet command
	 send FILLET{Enter}
}
;Line funct
Line(){
	;line command
	send LINE{Enter}
}
;Delete funct
Delete(){
	;Delete command
	send DELETE{Enter}
}
;Trim funct
Trim(){
	;Trim command
	send TRIM{Enter}
}
;Offset funct
Offset(){
	;Offset command
	send OFFSET{Enter}
}

;HOTKEYSWITCHES

;Ctrl+Alt+Shift+Z
^!+z::ExitApp
;Z
z::
ZoomAll()
return
;S
s::
Save()
return
;Ctrl+S
^s::
SaveAs()
return
;C
c::
Circle()
return
;Alt+C
!c::
DiameterCircle()
return
;X
x::
Explode()
return
;F
f::
Fillet()
return
;V
v::
Line()
return
;D
d::
Delete()
return
;T
t::
Trim()
return
;Ctrl+F
^f::
Offset()
return

;----------------------------------------------------------
;Keys Used
;
;Z
;X
;C
;V
;S
;D
;F
;T
;----------------------------------------------------------

;----------------------------------------------------------
;Timeline
;
;02-18-2019
;added top, alt, and autocad shortcut bars
;added ZoomAll, Save Functs
;added Z, S, HKS
;
;02-20-2019
;fixed zoomall to the words "zoom, all" from "z. a"
;added nonneeded circle, but i wanted to keep things in this script
;put left button wait down for DiameterCircle
;added the save all funct to ctrl+s
;put the three exalters with "z" as exit app
;Added the nonneeded fillet and explode
;added line named "V"ector
;
;02-21-2019
;added delete funct to "d"
;
;02-22-2019
;added + to - for self reasons
;added trim functs to 't'
;
;03-06-2019
;added Alt+f to offset
;got rid off + to - for not working as well as expected.
;----------------------------------------------------------