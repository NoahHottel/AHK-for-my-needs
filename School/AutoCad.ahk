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
return
}
;Save funct
Save(){
	;save command
	send QSAVE{Enter}
return
}
;Save As funct
SaveAs(){
	;saveas command
	send SAVEAS{Enter}
return
}
;Left Mouse funct
LeftMouse(){
	;wait for left mouse button
	KeyWait, LButton, D
return
}
;Radius Circle funct
Circle(){
	;circle command
	send CIRCLE{Enter}
return
}
;Diameter Circle funct
DiameterCircle(){
	;call circle
	Circle()
	;wait for lmouse
	LeftMouse()
	;diameter
	send DIAMETER{Enter}
return
}
;Explode funct
Explode(){
	;explode command
	send EXPLODE{Enter}
return
}
;Fillet funct
Fillet(){
	 ;fillet command
	 send FILLET{Enter}
return
}
;Line funct
Line(){
	;line command
	send LINE{Enter}
return
}
;Delete funct
Delete(){
	;Delete command
	send DELETE{Enter}
return
}
;Trim funct
Trim(){
	;Trim command
	send TRIM{Enter}
return
}
;Offset funct
Offset(){
	;Offset command
	send OFFSET{Enter}
}

;HOTKEYS

c::Circle()
!c::DiameterCircle()

d::Delete()

f::Fillet()
^f::Offset()

s::Save()
^s::SaveAs()

t::Trim()

v::Line()

x::Explode()

z::ZoomAll()