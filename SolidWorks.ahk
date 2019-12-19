;----------------------------------------------------------
;SolidWorks.ahk
;@Author : Noah Hottel (NoahHottel@gmail.com)
;@Link   : https://github.com/NoahHottel
;@Date   : 10/18/2019, 3:47:52 PM
;----------------------------------------------------------
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
Menu, Tray, Icon, C:\Program Files\SOLIDWORKS Corp\SOLIDWORKS\SLDWORKS.exe
Return
;----------------------------------------------------------
#IfWinActive ahk_exe SLDWORKS.exe


;----------------------------------------------------------
;Test
;c::
;send w
;sleep 60
;send CIRCLE
;return
;----------------------------------------------------------
;Functions
Command(){
    send w
    Command_Sleep()
}
Command_Sleep(){
    sleep 60
}
Double_Enter(){
    Send {Enter}
    Send {Enter}
}
Sketch(){
    Command()
    Send SKETCH
}
Smart_dimension(){
    Command()
    Send SMART DIMENSION
    Double_Enter()
}
Line(){
    Command()
    Send LINE
    Double_Enter()
}
Centerline(){
    Command()
    Send CENTERLINE
    Double_Enter()
}
Midpoint_Line(){
    Command()
    Send MIDPOINT LINE
    Double_Enter()
}
Circle(){
    Command()
    Send CIRCLE
    Double_Enter()
}
Perimeter_Circle(){
    Command()
    Send PERIMETER CIRCLE
    Double_Enter()
}
Spline(){
    Command()
    Send SPLINE
    Double_Enter()
}
Style_Spline(){
    Command()
    Send STYLE SPLINE
    Double_Enter()
}
Spline_On_Surface(){
    Command()
    Send SPLINE ON SURFACE
    Double_Enter()
}
Equation_Driven_Curve(){
    Command()
    Send EQUATION DRIVEN CURVE
    Double_Enter()
}
Corner_Rectangle(){
    Command()
    Send CORNER RECTANGLE
    Double_Enter()
}
Center_Rectangle(){
    Command()
    Send CENTER RECTANGLE
    Double_Enter()
}
3_Point_Corner_Rectangle(){
    Command()
    Send 3 POINT CORNER RECTANGLE
    Double_Enter()
}
3_Point_Center_Rectangle(){
    Command()
    Send 3 POINT CENTER RECTGANGLE
    Double_Enter()
}
Parallelogram(){
    Command()
    Send PARALLELOGRAM
    Double_Enter()
}
Centerpoint_Arc(){
    Command()
    Send CENTERPOINT ARC
    Double_Enter()
}
Tangent_Arc(){
    Command()
    Send TANGENT ARC
    Double_Enter()
}
3_Point_Arc(){
    Command()
    Send 3 POINT ARC
    Double_Enter()
}
Ellipse(){
    Command()
    Send ELLIPSE
    Double_Enter()
}
Partial_Ellipse(){
    Command()
    Send PARTIAL ELLIPSE
    Double_Enter()
}
Parabola(){
    Command()
    Send PARABOLA
    Double_Enter()
}
Conic(){
    Command()
    Send CONIC
    Double_Enter()
}
Straight_Slot(){
    Command()
    Send STRAIGHT SLOT
    Double_Enter()
}
Centerpoint_Straight_Slot(){
    Command()
    Send CENTERPOINT STRAIGHT SLOT
    Double_Enter()
}
3_Point_Arc_Slot(){
    Command()
    Send 3 POINT ARC SLOT
    Double_Enter()
}
Centerpoint_Arc_Slot(){
    Command()
    Send CENTERPOOINT ARC SLOT
    Double_Enter()
}
Polygon(){
    Command()
    Send POLYGON
    Double_Enter()
}
Sketch_Fillet(){
    Command()
    Send SKETCH FILLET
    Double_Enter()
}
Sketch_Chamfer(){
    Command()
    Send SKETCH CHAMFER
    Double_Enter()
}
Save(){
    Command()
    Send SAVE
    Double_Enter()
}
Save_As(){
    Command()
    Send SAVE AS
    Double_Enter()
}
Extrude_Boss_Base(){
    Command()
    Send EXTRUDE BOSS/BASE
    Double_Enter()
}
Revolved_Boss_Base(){
    Command()
    Send EXTRUDE BOSS/BASE
    Double_Enter()
}
Extrude_Cut(){
    Command()
    Send EXTRUDE CUT
    Double_Enter()
}
Revolved_Cut(){
    Command()
    Send REVOLVED CUT
    Double_Enter()
}
;----------------------------------------------------------
;HotKeys
;^=CTRL, !=ALT, +=SHIFT

a::Centerpoint_Arc()
^a::Tangent_Arc()
!a::3_Point_Arc()

c::Circle()
!c::Perimeter_Circle()
^!c::Equation_Driven_Curve()
^+c::conic()

d::Smart_dimension()

e::Ellipse()
^e::Partial_Ellipse()

l::Line()
^l::Centerline()
!l::Midpoint_Line()

p::Parallelogram()
^p::Parabola()

r::Corner_Rectangle()
^r::Center_Rectangle()
!r::3_Point_Corner_Rectangle()
^!r::3_Point_Center_Rectangle()

s::Save()
^s::Save_As()
!s::Sketch()
^!s::Spline()
^+s::Style_Spline()
!+s::Spline_On_Surface()


;----------------------------------------------------------
;Keys Used
;
;----------------------------------------------------------
;Timeline
;2019-10-21
;Added all function skeletons
;Found test fit
;
;2019-10-22
;Created Command and Command_Sleep for command line
;Added Command to every Function that is needed
;Added specified command to all
;
;2019-11-08
;Found that double enteris direct execution
;Implemented to all functions
;----------------------------------------------------------