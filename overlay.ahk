#SingleInstance, force

; Launch parameters
; Wind setting
pWindspeed := 00
if(A_Args.Length() >= 1)
{
	pWindspeed := A_Args[1]
}
; White/Black text
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


; Set up screen dimensions
vScreenWidth := A_ScreenWidth
vScreenHeight := A_ScreenHeight

;Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, Overlay
Gui, Show, x0 y0 w%vScreenWidth% h%vScreenHeight%, Overlay
Gui, +AlwaysOnTop

; Overlay
Gui, Add, Picture, x0 y0 w%vScreenWidth% h%vScreenHeight%, overlay.png

; Text color from parameters
vTextColor := cBlack
if(pWhiteText == 1)
{
	vTextColor := cWhite
}

; Lower font size if resolution is smaller than 1080p
vTextSize := 48
if(vScreenHeight < 1080)
{
	vTextSize := 36
}
; Increase font size if resolution is bigger or equal to 1440p
if(vScreenHeight >= 1440)
{
	vTextSize := 60
}

Gui, font, s%vTextSize% q3 c%vTextColor%, Terminal

vLeftAnchor := vScreenWidth / 4
; Top right position needs space for 9 characters and is right justified
vRightAnchor := ((vScreenWidth / 2) + (vScreenWidth / 4) - (vTextSize * 9))

; Date and time
vTextSizeThree := vTextSize * 3
vTextSizeNine := vTextSize * 9
Gui, Add, Text, x%vLeftAnchor% y%vTextSize% vDateText, ##-##-##
Gui, Add, Text, x%vLeftAnchor% y%vTextSizeThree% vTimeText, --:--:--

; Carrier ID and wind speed
vTextSizeSeven := vTextSize * 7
Gui, Add, Text, x%vRightAnchor% y%vTextSize% w%vTextSizeNine% Right, C   %pCarrierNumber%
Gui, Add, Text, x%vRightAnchor% y%vTextSizeThree% w%vTextSizeSeven% Right, %pWindspeed%

; Distance and time to trap (nonfunctional)
vBottomAnchor := vScreenHeight - (vTextSize * 2)
GUi, Add, Text, x%vRightAnchor% y%vBottomAnchor% w%vTextSizeNine% Right, 00000  00

; Unknown lower left quadrant value (nonfunctional)
Gui, Add, Text, x%vLeftAnchor% y%vBottomAnchor%, 000

; Transparency
Gui, Color, 001100
WinSet, TransColor, 001100, A
Gui, -Caption

; Kick off the clock function
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