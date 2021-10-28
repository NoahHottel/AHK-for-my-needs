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
;Functions
Command(command,double){
    send w
    sleep 60
    send %command%
    send %double%
    one = 1
    if one = %double%
    {
        Send {Enter}
        Send {Enter}
    }
    
}
Sketch(){
    Command("SKETCH",0)
}
Smart_dimension(){
    Command("SMART DIMENSION",1)
}
Line(){
    Command("LINE",1)
}
Centerline(){
    Command("CENTERLINE",1)
}
Midpoint_Line(){
    Command("MIDPOINT LINE",1)
}
Circle(){
    Command("CIRCLE",1)
}
Perimeter_Circle(){
    Command("PERIMETER CIRCLE",1)
}
Spline(){
    Command("SPLINE",1)
}
Style_Spline(){
    Command("STYLE SPLINE",1)
}
Spline_On_Surface(){
    Command("SPLINE ON SURFACE",1)
}
Equation_Driven_Curve(){
    Command("EQUATION DRIVEN CURVE",1)
}
Corner_Rectangle(){
    Command("CORNER RECTANGLE",1)
}
Center_Rectangle(){
    Command("CENTER RECTANGLE",1)
}
3_Point_Corner_Rectangle(){
    Command("3 POINT CORNER RECTANGLE",1)
}
3_Point_Center_Rectangle(){
    Command("3 POINT CENTER RECTGANGLE",1)
}
Parallelogram(){
    Command("PARALLELOGRAM",1)
}
Centerpoint_Arc(){
    Command("CENTERPOINT ARC",1)
}
Tangent_Arc(){
    Command("TANGENT ARC",1)
}
3_Point_Arc(){
    Command("3 POINT ARC",1)
}
Ellipse(){
    Command("ELLIPSE",1)
}
Partial_Ellipse(){
    Command("PARTIAL ELLIPSE",1)
}
Parabola(){
    Command("PARABOLA",1)
}
Conic(){
    Command("CONIC",1)
}
Straight_Slot(){
    Command("STRAIGHT SLOT",1)
}
Centerpoint_Straight_Slot(){
    Command("CENTERPOINT STRAIGHT SLOT",1)
}
3_Point_Arc_Slot(){
    Command("3 POINT ARC SLOT",1)
}
Centerpoint_Arc_Slot(){
    Command("CENTERPOOINT ARC SLOT",1)
}
Polygon(){
    Command("POLYGON",1)
}
Sketch_Fillet(){
    Command("SKETCH FILLET",1)
}
Sketch_Chamfer(){
    Command("SKETCH CHAMFER",1)
}
Save(){
    Command("SAVE",1)
}
Save_As(){
    Command("SAVE AS",1)
}
Extrude_Boss_Base(){
    Command("EXTRUDE BOSS/BASE",1)
}
Revolved_Boss_Base(){
    Command("rEVOLVED BOSS/BASE",1)
}
Extrude_Cut(){
    Command("EXTRUDE CUT",1)
}
Revolved_Cut(){
    Command("REVOLVED CUT",1)
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