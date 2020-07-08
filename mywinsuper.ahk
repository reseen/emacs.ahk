#SingleInstance 
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxHotkeysPerInterval 200
Lwin::

if GetKeyState("Lwin", "P")
  {     
  Send ^x
  Sleep 200
  Send % "@s"
  return
  }
KeyWait, Lwin  
return