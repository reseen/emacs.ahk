;;使用Capslock切换中/英文，长按Capslock锁定/解锁大小写

Shift::
        if WinActive("ahk_class Emacs") or WinActive("ahk_class  X410_XAppWin")
	   Send ^{\}
	   ; Send ^{Space}
	else
           Send #{Space}
Return
