#SingleInstance, force

; Options
; Wind setting
pWindspeed := 00
if(A_Args.Length() >= 1)
{
	pWindspeed := A_Args[1]
}
; White/Black
pWhiteText := false
if(A_Args.Length() >= 2)
{
	pWhiteText := A_Args[2]
}
; Carrier number
pCarrierNumber := 74
if(A_Args.Length() >= 3)
{
	pCarrierNumber := A_Args[3]
}

Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, Overlay
Gui, +AlwaysOnTop

; Text color
vTextCol := cFFFFFF

; Overlay
Gui, Add, Picture, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, overlay.png

; Time and date
if(pWhiteText == 1)
{
	GUi,Font, s48 q3 cWhite, Terminal
}
else
{
	Gui, Font, s48 q3, Terminal
}

Gui, Add, Text, x480 y48 vDateText, ##-##-##
Gui, Add, Text, x480 y120 vTimeText, --:--:--

; Carrier ID and wind speed
Gui, Add, Text, x1008 y48 w432 Right, C   %pCarrierNumber%
Gui, Add, Text, x1008 y120 w336 Right, %pWindspeed%

; Distance and time to trap (nonfunctional)
GUi, Add, Text, x1008 y960, 00000  00

; Unknown lower left quadrant value (nonfunctional)
Gui, Add, Text, x480 y960, 000

; Transparency
Gui, Color, 001100
WinSet, TransColor, 001100, A
Gui, -Caption

SetTimer, Time_Tick, 1000
return

Time_Tick:
tYear := 0
FormatTime, tYear, , yy
GuiControl, , DateText, %tYear%-%A_Mon%-%A_MDay%
GuiControl, , TimeText, %A_Hour%:%A_Min%:%A_Sec%
return

GuiClose:
ExitApp, 0