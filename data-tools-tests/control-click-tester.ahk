#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;================================================
; GG's Control Click Test
; v1.0.0
; GirlGamer
; ahk 1.0.48.05 or higher
; 2012 Jul, 20
;================================================
#NoEnv
#SingleInstance, Force
#Persistent
#MaxThreadsPerHotkey 2
SetTitleMatchMode, 2
SetBatchLines, -1
SetKeyDelay, 50,50
DetectHiddenWindows, On
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen

;------------------------------------------------
; control click test
;------------------------------------------------
title := "GG's Control Click Test"

MsgBox,0x1024,%title%,This routine will try to send left and right control clicks every 3 seconds to the window of your choice.`n`n NOTE: Some windows or controls may not respond to a ControlClick. Do not move or alter the window while the test is in progress. Message prompts will appear at the top of the screen.`n`nDo you want to continue?
IfMsgBox, No
     exitapp

soundbeep, 750
fnTT("Use the Middle Mouse button to select the window you want to send control clicks to.")
keywait, MButton, D
tooltip
keywait, MButton

MouseGetPos, wx, wy, wid
sleep 200
wingettitle, wt, ahk_id %wid%
sleep 200
msgbox,0x1020,%title%,The window you selected was %wt%
sleep, 200

winactivate, ahk_id %wid%
soundbeep, 750
fnTT("Use the middle mouse button to select the point in the target window to click on.")
keywait, MButton, D
tooltip
keywait, MButton

coordmode, mouse, relative
mousegetpos, tx, ty, tid
sleep, 200
coordmode, mouse, screen
wingettitle, tt, ahk_id %tid%
sleep 200
msgbox,0x1020,%title%,The position was x%tx% y%ty% on window %tt%
sleep, 200
ccflag = 1
gosub, cctimer
return

;------------------------------------------------
cctimer:
fnTT("Press Alt-Esc to stop this script.")
IfWinNotExist ahk_id %tid%
{	tooltip
	MsgBox,0x1020,%title%,Script Stopped. Target window was closed.
	exitapp	
}
If (tid <> wid)
{	tooltip
	MsgBox,0x1020,%title%,Script Stopped. Original window %wid% was closed and window %tid% opened.
	exitapp	
}
If ((!ccflag) || (Getkeystate("Esc","P")))
{	tooltip
	MsgBox,0x1020,%title%, Script Complete
	exitapp	
}
SetControlDelay -1
controlclick, x%tx% y%ty%, ahk_id %tid%,,left,1
sleep 300
controlclick, x%tx% y%ty%, ahk_id %tid%,,right,1
sleep 300
settimer, cctimer, -3000
return

;------------------------------------------------
fnTT(msg)
{	ttxc := (A_ScreenWidth // 2)
	len := (strlen(msg) * 4)
	ttx := (ttxc - len)
	;listvars
	;pause
	tooltip, %msg%, %ttx%, 0
}

;------------------------------------------------
; end script
;------------------------------------------------
!Esc::
Soundbeep, 440,500
ccflag := 0
return