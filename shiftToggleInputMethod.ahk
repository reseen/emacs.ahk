;;使用Shift切换中/英文

;; 设置软件使用指定的默认输入法
#Persistent
Gui +LastFound
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage")
Return
ShellMessage( wParam,lParam ) {
  If ( wParam = 1 )
  {
    WinGetclass, WinClass, ahk_id %lParam%
    If Winclass in Emacs  ;Emacs是需要开启中文输入的窗口类名，可以有多个程序，之间用‘,’隔开
    {
      winget,WinID,id,ahk_class %WinClass%
      ; 00000409是英语美式键盘的输入法代码，00000804是中文美式键盘的输入法代码，系统内安装的输入法代码可以在
      ; 注册表HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Keyboard Layouts查到
      SetLayout("00000409",WinID)
    }
}
}
SetLayout(Layout,WinID){
DllCall("SendMessage", "UInt", WinID, "UInt", "80", "UInt", "1", "UInt", (DllCall("LoadKeyboardLayout", "Str", Layout, "UInt", "257")))
}

Shift::
        if WinActive("ahk_class Emacs") or WinActive("ahk_class  X410_XAppWin")
	   Send ^{\}
	   ; Send ^{Space}
	; else
        ;    Send ^{f11}
Return
