;;使用Capslock切换中/英文，长按Capslock锁定/解锁大小写
SetStoreCapslockMode, off
Capslock::
	KeyWait, CapsLock
	If (A_TimeSinceThisHotkey > 200)
		SetTimer, mainp, -1
	Else
	{
	   IfWinActive,ahk_class Emacs ; NTEmacs
	     Send ^{\}
	   Else
		 Send #{Space}
	}
Return

mainp:
	Send, {CapsLock}
Return
