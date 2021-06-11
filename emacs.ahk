
;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; turns to be 1 when ctrl-x is pressed
is_pre_x = 0
; turns to be 1 when ctrl-space is pressed
is_pre_spc = 0
; turns to be 1 when Ctrl-z is pressed
is_pre_z = 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1
IfWinActive,ahk_exe Code.exe ;vscode
    Return 1
IfWinActive,ahk_exe devenv.exe ;visual studio
    Return 1    
IfWinActive,ahk_class VMwareUnityHostWndClass ; Avoid VMwareUnity with AutoHotkey
    Return 1
IfWinActive,ahk_class mintty
    Return 1
IfWinActive,ahk_class Window Class
    Return 1
IfWinActive,ahk_class CASCADIA_HOSTING_WINDOW_CLASS ;Windows 10 terminal
    Return 1
IfWinActive,ahk_class Vim ; GVI
    Return 1
IfWinActive,ahk_class Emacs ; NTEmacs
    Return 1
IfWinActive,ahk_class X410_XAppWin
    Return 1
Return 0
}

is_smatraPDF()
{
    IfWinActive,ahk_class SUMATRA_PDF_FRAME ; smatraPDF
        Return 1
Return 0
}

delete_char()
{
    Send {Del}
    global is_pre_spc = 0
    Return
}

delete_word()
{
    Send ^{Del}
    global is_pre_spc = 0
    Return
}

delete_backward_char()
{
    Send {BS}
    global is_pre_spc = 0
    Return
}
kill_line()
{
    Send {ShiftDown}{END}{SHIFTUP}
    Sleep 50 ;[ms] this value depends on your environment
    Send ^x
    global is_pre_spc = 0
    Return
}
open_line()
{
    Send {END}{Enter}{Up}
    global is_pre_spc = 0
    Return
}

open_line_emacs()
{
    Send {Home}{Enter}{Up}
    global is_pre_spc = 0
    Return
}
quit()
{
    Send {ESC}
    global is_pre_spc = 0
    Return
}
newline()
{
    Send {Enter}
    global is_pre_spc = 0
    Return
}

newline_emacs()
{
    Send {END}{Enter}
    global is_pre_spc = 0
    Return
}
indent_for_tab_command()
{
    Send {Tab}
    global is_pre_spc = 0
    Return
}

indent_for_tab_command_invert()
{
    Send +{Tab}
    global is_pre_spc = 0
    Return
}
newline_and_indent()
{
    Send {Enter}{Tab}
    global is_pre_spc = 0
    Return
}
isearch_forward()
{
    Send ^f
    global is_pre_spc = 0
    Return
}
isearch_backward()
{
    Send ^f
    global is_pre_spc = 0
    Return
}
kill_region()
{
    Send ^x
    global is_pre_spc = 0
    Return
}
kill_ring_save()
{
    Send ^c
    global is_pre_spc = 0
    Return
}
yank()
{
    Send ^v
    global is_pre_spc = 0
    Return
}
undo()
{
    Send ^z
    global is_pre_spc = 0
    Return
}

redo()
{
    Send ^y
    global is_pre_spc = 0
    Return
}
find_file()
{
    Send ^o
    global is_pre_x = 0
    Return
}
save_buffer()
{
    Send, ^s
    global is_pre_x = 0
    Return
}
kill_emacs()
{
    Send !{F4}
    global is_pre_x = 0
    Return
}

move_beginning_of_line()
{
    global
    if is_pre_spc
        Send +{HOME}
    Else
        Send {HOME}
        Return
}
move_end_of_line()
{
    global
    if is_pre_spc
        Send +{END}
    Else
        Send {END}
        Return
}
previous_line()
{
    global
    if is_pre_spc
        Send +{Up}
    Else
        Send {Up}
        Return
}
next_line()
{
    global
    if is_pre_spc
        Send +{Down}
    Else
        Send {Down}
        Return
}
forward_char()
{
    global
    if is_pre_spc
        Send +{Right}
    Else
        Send {Right}
        Return
}
backward_char()
{
    global
    if is_pre_spc
        Send +{Left}
    Else
        Send {Left}
        Return
}

forward_word()
{
    global
    if is_pre_spc
        Send ^+{Right}
    Else
        Send ^{Right}
        Return
}

backward_word()
{
    global
    if is_pre_spc
        Send ^+{Left}
    Else
        Send ^{Left}
        Return
}

scroll_up()
{
    global
    if is_pre_spc
        Send +{PgUp}
    Else
        Send {PgUp}
        Return
}
scroll_down()
{
    global
    if is_pre_spc
        Send +{PgDn}
    Else
        Send {PgDn}
        Return
}

beginning_of_buffer()
{
    global
    if is_pre_z
        send ^{Home}
    Return
}

end_of_buffer()
{
    global
    if is_pre_z
        send ^{End}
    Return
}

mark_whole_buffer()
{
    Send ^{End}^+{Home}
    global is_pre_spc = 0
}


^x::
If is_target()
    Send %A_ThisHotkey%
Else
    is_pre_x = 1
Return
^z::
If is_target()
    Send %A_ThisHotkey%
Else
    is_pre_z = 1
Return
j::
If is_target()
    Send %A_ThisHotkey%
Else
{
    If is_pre_z
    {
        end_of_buffer()
        global is_pre_z = 0
    }
    Else
        Send %A_ThisHotkey%
}

Return

k::
If is_target()
    Send %A_ThisHotkey%
Else
{
    If is_pre_z
    {
        beginning_of_buffer()
        global is_pre_z = 0
    }
    Else
        Send %A_ThisHotkey%
}
Return


^f::
If is_target()
    Send %A_ThisHotkey%
Else
{
    If is_pre_x
        find_file()
    Else
        forward_char()
}
Return

!f::
If is_target()
    Send %A_ThisHotkey%
Else
    forward_word()
Return

!b::
If is_target()
    Send %A_ThisHotkey%
Else
    backward_word()
Return

^c::
If is_target()
    Send %A_ThisHotkey%
Else
{
    If is_pre_x
        kill_emacs()
}
Return
^d::
If is_target()
    Send %A_ThisHotkey%
Else If is_smatraPDF()
{
    Send ^b
}

Else
    delete_char()
Return
!d::
If is_target()
    Send %A_ThisHotkey%
Else
    delete_word()
Return

^h::
If is_target()
    Send %A_ThisHotkey%
Else
    delete_backward_char()
Return
^k::
If is_target()
    Send %A_ThisHotkey%
Else
    kill_line()
Return
^o::
If is_target()
    Send %A_ThisHotkey%
Else
    open_line_emacs()
Return
^g::
If is_target()
    Send %A_ThisHotkey%
Else
    quit()
Return
^l::
If (is_target() || is_smatraPDF())
    Send %A_ThisHotkey%
Else
    newline_emacs()
Return

^j::
If is_target()
    Send %A_ThisHotkey%
Else
    newline_and_indent()
Return
^m::
If is_target()
    Send %A_ThisHotkey%
Else
    newline()
Return
^i::
If is_target()
    Send %A_ThisHotkey%
Else
    indent_for_tab_command_invert()
Return

!i::
If is_target()
    Send %A_ThisHotkey%
Else
    indent_for_tab_command()
Return
^s::
If is_target()
    Send %A_ThisHotkey%
Else
{
    If is_pre_x
        save_buffer()
    Else
        isearch_forward()
}
Return
^r::
If is_target()
    Send %A_ThisHotkey%
Else
    isearch_backward()
Return
^w::
If (is_target() || is_smatraPDF())
    Send %A_ThisHotkey%
Else
    kill_region()
Return
!w::
If is_target()
    Send %A_ThisHotkey%
Else
    kill_ring_save()
Return
^y::
If is_target()
    Send %A_ThisHotkey%
Else
    yank()
Return
^/::
If is_target()
    Send %A_ThisHotkey%
Else
    undo()
Return

^+/::
If is_target()
    Send %A_ThisHotkey%
Else
    redo()
Return
;$^{Space}::
;^vk20sc039::
^vk20::
If is_target()
    Send {CtrlDown}{Space}{CtrlUp}
Else
{
    If is_pre_spc
        is_pre_spc = 0
    Else
        is_pre_spc = 1
}
Return
!h::
If is_target()
    Send %A_ThisHotkey%
Else
{
    If is_pre_spc
        is_pre_spc = 0
    Else
        is_pre_spc = 1
}
Return
^a::
If is_target()
    Send %A_ThisHotkey%
Else
    move_beginning_of_line()
Return
^e::
If is_target()
    Send %A_ThisHotkey%
Else
    move_end_of_line()
Return
^p::
If is_target()
    Send %A_ThisHotkey%
Else
    previous_line()
Return
^n::
If is_target()
    Send %A_ThisHotkey%
Else
    next_line()
Return
^b::
If is_target()
    Send %A_ThisHotkey%
Else
    backward_char()
Return
^v::
If is_target()
    Send %A_ThisHotkey%
Else
    scroll_down()
Return
!v::
If is_target()
    Send %A_ThisHotkey%
Else
    scroll_up()
Return
;;text scale increase
#=::
If is_target()
    Send %A_ThisHotkey%
Else
    Send ^{WheelUp}
    Return
;;text scale decrease
#-::
If is_target()
    Send %A_ThisHotkey%
Else
    Send ^{WheelDown}
    Return

;; maximize and restore window
F11::
If is_target()
    Send {F11}
Else
{
    WinGetActiveStats, Title, Width, Height, X, Y
    If  x < -5
        WinRestore,A
    Else
        WinMaximize,A
}
Return


h::
If is_target()
    Send %A_ThisHotkey%
Else
{
    If is_pre_x
    {
        mark_whole_buffer()
        global is_pre_x = 0
    }
    Else
        Send %A_ThisHotkey%
}
Return
