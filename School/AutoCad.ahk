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