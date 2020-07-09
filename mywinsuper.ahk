;;#SingleInstance 
;;#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Lwin::
  IfWinActive,ahk_class Emacs
  {  
    Send ^x
    Sleep 100
    Send % "@s"
    KeyWait, Lwin  
  } 
  else
  {
  Send {Lwin down}
  KeyWait, Lwin 
  send {Lwin up}
  }
Return
 