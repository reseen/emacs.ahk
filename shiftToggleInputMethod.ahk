;;使用Capslock切换中/英文，长按Capslock锁定/解锁大小写

Shift::
	   IfWinActive,ahk_class Emacs ; NTEmacs
	     Send ^{\}
	     ;;Send ^{Space}
	   Else
		 Send #{Space}
Return
