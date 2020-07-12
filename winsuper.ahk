*Lwin::
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

*Rwin::
IfWinActive,ahk_class Emacs
{
    Send ^x
    Sleep 100
    Send % "@s"
    KeyWait, Rwin
}
else
{
    Send {Rwin down}
    KeyWait, Rwin
    send {Rwin up}
}
Return

