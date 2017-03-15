#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

fnTT(msg)
{	
	ttxc := (A_ScreenWidth // 2)
	len := (strlen(msg) * 4)
	ttx := (ttxc - len)
	;listvars
	;pause
	tooltip, %msg%, %ttx%, 0
}

fnTT("Press the middle mouse button inside DCUO window.")
keywait, MButton, D
tooltip
keywait, MButton

MouseGetPos, tx, ty, wid
sleep, 200
wingettitle, wt, ahk_id %wid%
sleep, 200

winactivate, ahk_id %wid%
soundbeep, 750
sleep, 500

loop
{
	Send {e down}
	sleep, 2000
	Send {e up}
}

;------------------------------------------------
; pause script
;------------------------------------------------
!esc::
pause
return