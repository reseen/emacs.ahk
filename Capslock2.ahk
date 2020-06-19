SetStoreCapslockMode, off
Capslock::
	KeyWait, CapsLock
	If (A_TimeSinceThisHotkey > 300)
		SetTimer, mainp, -1
	Else
		Send #{Space}
Return

mainp:
	Send, {CapsLock}
Return
