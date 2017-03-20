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

idWindow(ByRef tx, ByRef ty, ByRef wid)
{
	fnTT("Use the Middle Mouse button to select the window you want to send keys to.")
	keywait, MButton, D
	tooltip
	keywait, MButton

	MouseGetPos, tx, ty, wid
	sleep, 200
	wingettitle, wt, ahk_id %wid%
	sleep, 200

	return
}

dcuoRAND(min, max)
{
	Random, result, min, max
	return result
}

idWindow(tx, ty, wid)
winactivate, ahk_id %wid%

loop{
	rng := dcuoRAND(1, 14)
	sleep, 200
		
	send, {LButton down}
	sleep, 200
	send, {LButton up}
	sleep, 100

	; Melee hold
	if (rng = 2 or rng = 6 or rng = 10 or rng = 12)
	{
		send, {LButton down}
		sleep, 500
		send, {LButton up}
		sleep, 600
	}

	; Ranged tap
	if (rng = 3)
	{
		send, {RButton down}
		sleep, 200
		send, {RButton up}
		sleep, 200
	}

	; Blockbreak
	if (rng = 4 or rng = 7)
	{
		send, {RButton down}
		sleep, 400
		send, {RButton up}
		sleep, 200
		send, {Space down}
		sleep, 200
		send, {Space up}
	}

	; Block
	if (rng = 5 or eng = 9 or rng = 11 or rng = 1)
	{
		send, {Shift down}
		sleep, 400
		send, {Shift up}
		rollRNG := dcuoRAND(1, 3)
		if (rollRNG = 2)
		{
			send, {s down}
			sleep, 400
			send, {s up}
		}
		sleep, 500
	}
}

;------------------------------------------------
; pause script
;------------------------------------------------
!Esc::
Soundbeep, 440,500
Pause
return