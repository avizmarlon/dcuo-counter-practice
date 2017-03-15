#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

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

fnTT(msg)
{	
	ttxc := (A_ScreenWidth // 2)
	len := (strlen(msg) * 4)
	ttx := (ttxc - len)
	;listvars
	;pause
	tooltip, %msg%, %ttx%, 0
}

idWindow(ByRef tx, ByRef ty, ByRef wid)
{
	fnTT("Use the Middle Mouse button to select the window you want to send control clicks to.")
	keywait, MButton, D
	tooltip
	keywait, MButton

	MouseGetPos, tx, ty, wid
	sleep 200
	wingettitle, wt, ahk_id %wid%
	sleep 200
	msgbox,0x1020,%title%,The window you selected was %wt%
	sleep, 200

	return
}

dcuoRAND(min, max)
{
	Random, result, min, max
	return result
}

idWindow(tx, ty, wid)

loop{
	rng := dcuoRAND(1, 2)
	; msgbox % rng
	sleep, 200

	if (rng = 1)
	{
		; melee tap
		controlclick, x%tx% y%ty%, ahk_id %wid%,,left,1
	}
	else if (rng = 2)
	{
		; ranged tap
		controlclick, x%tx% y%ty%, ahk_id %wid%,,right,1
	}
}







;------------------------------------------------
; end script
;------------------------------------------------
!Esc::
Soundbeep, 440,500
Pause
return