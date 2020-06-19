;;使用Capslock切换中/英文，长按Capslock锁定/解锁大小写
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
