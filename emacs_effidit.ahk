;; AHK v2 Script
;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; turns to be 1 when ctrl-x is pressed
is_pre_x := 0
; turns to be 1 when ctrl-space is pressed
is_pre_spc := 0
; turns to be 1 when Ctrl-c is pressed
is_pre_c := 0


delete_char() {
    Send "{Del}"
    global is_pre_spc := 0
}

delete_word() {
    Send "^{Del}"
    global is_pre_spc := 0
}

delete_backward_char() {
    Send "{BS}"
    global is_pre_spc := 0
}

kill_line() {
    Send "{ShiftDown}{END}{SHIFTUP}"
    Sleep 50 ;[ms] this value depends on your environment
    Send "^x"
    global is_pre_spc := 0
}

open_line() {
    Send "{END}{Enter}{Up}"
    global is_pre_spc := 0
}

open_line_emacs() {
    Send "{Home}{Enter}{Up}"
    global is_pre_spc := 0
}

quit() {
    Send "{ESC}"
    global is_pre_spc := 0
    global is_pre_x := 0
    global is_pre_c := 0
}

newline() {
    Send "{Enter}"
    global is_pre_spc := 0
}

duplicate_line() {
    Send "^d"
    global is_pre_spc := 0
}

newline_emacs() {
    Send "{END}{Enter}"
    global is_pre_spc := 0
}

indent_for_tab_command() {
    Send "{Tab}"
    global is_pre_spc := 0
}

indent_for_tab_command_invert() {
    Send "+{Tab}"
    global is_pre_spc := 0
}

newline_and_indent() {
    Send "{Enter}{Tab}"
    global is_pre_spc := 0
}

isearch_forward() {
    Send "^f"
    global is_pre_spc := 0
}

isearch_backward() {
    Send "^f"
    global is_pre_spc := 0
}

kill_region() {
    Send "^x"
    global is_pre_spc := 0
}

kill_ring_save() {
    Send "^c{Left}{Right}"
    global is_pre_spc := 0
}

yank() {
    Send "^v"
    global is_pre_spc := 0
}

undo() {
    Send "^z"
    global is_pre_spc := 0
}

redo() {
    Send "^y"
    global is_pre_spc := 0
}

find_file() {
    Send "^o"
    global is_pre_x := 0
}

save_buffer() {
    Send "^s"
    global is_pre_x := 0
}

kill_emacs()
{
    Send "!{F4}"
    global is_pre_x := 0
}

move_beginning_of_line() {
    if is_pre_spc
        Send "+{HOME}"
    Else
        Send "{HOME}"
}

move_beginning_of_buffer(){
    Send "^{HOME}"
}

move_end_of_line() {
    if is_pre_spc
        Send "+{END}"
    Else
        Send "{END}"
}

move_end_of_buffer() {
    Send "^{END}"
}

previous_line() {
    if is_pre_spc
        Send "+{Up}"
    Else
        Send "{Up}"
}

next_line() {
    if is_pre_spc
        Send "+{Down}"
    Else
        Send "{Down}"
}

forward_char() {
    if is_pre_spc
        Send "+{Right}"
    Else
        Send "{Right}"
}

backward_char() {
    if is_pre_spc
        Send "+{Left}"
    Else
        Send "{Left}"
}

forward_word() {
    if is_pre_spc
        Send "^+{Right}"
    Else
        Send "^{Right}"
}

backward_word() {
    if is_pre_spc
        Send "^+{Left}"
    Else
        Send "^{Left}"
}

scroll_up() {
    if is_pre_spc
        Send "+{PgUp}"
    Else
        Send "{PgUp}"
}

scroll_down() {
    if is_pre_spc
        Send "+{PgDn}"
    Else
        Send "{PgDn}"
}

mark_whole_buffer() {
    Send "^{End}^+{Home}"
    global is_pre_spc := 0
}

tab_switch_forward() {
    Send "^{Tab}"
}

tab_switch_backward() {
    Send "^+{Tab}"
}

; Effidit 按键绑定
HotIfWinActive "ahk_exe Effidit.exe"
Hotkey "^x", hotkey_c_x
Hotkey "^c", hotkey_c_c
Hotkey "^f", hotkey_c_f
Hotkey "!f", hotkey_m_f
Hotkey "^b", hotkey_c_b
Hotkey "!b", hotkey_m_b
Hotkey "^a", hotkey_c_a
Hotkey "^e", hotkey_c_e
Hotkey "^n", hotkey_c_n
Hotkey "^p", hotkey_c_p
Hotkey "^+a", hotkey_cs_a
Hotkey "^+e", hotkey_cs_e
Hotkey "^+n", hotkey_cs_n
Hotkey "^+p", hotkey_cs_p
Hotkey "^+f", hotkey_cs_f
Hotkey "^+b", hotkey_cs_b
Hotkey "^d", hotkey_c_d
Hotkey "!d", hotkey_m_d
; Hotkey "^h", hotkey_c_h
Hotkey "^k", hotkey_c_k
Hotkey "^o", hotkey_c_o
Hotkey "^g", hotkey_c_g
Hotkey "^l", hotkey_c_l
Hotkey "^j", hotkey_c_j
;Hotkey "^m", hotkey_c_m
Hotkey "^i", hotkey_c_i
Hotkey "!i", hotkey_m_i
Hotkey "^s", hotkey_c_s
Hotkey "^r", hotkey_c_r
Hotkey "^w", hotkey_c_w
Hotkey "!w", hotkey_m_w
Hotkey "^v", hotkey_c_v
Hotkey "!v", hotkey_m_v
Hotkey "^y", hotkey_c_y
Hotkey "^/", hotkey_undo
Hotkey "^+/", hotkey_redo
Hotkey "!vk20", hotkey_mark
Hotkey "h", hotkey_h
Hotkey "d", hotkey_d
Hotkey "a", hotkey_a
Hotkey "e", hotkey_e
Hotkey "^+.", hotkey_c_tab
Hotkey "^+,", hotkey_cs_tab
Hotkey "^z", hotkey_c_z

; 按键定义

hotkey_c_x(ThisHotkey) {
    global is_pre_x := 1
}

hotkey_c_c(ThisHotKey) {
    If is_pre_x {
        kill_emacs()
    } 
    Else {
        global is_pre_c := 1
    } 
}

hotkey_c_f(ThisHotKey) {
    If is_pre_x {
        find_file()
    }
    Else {
        forward_char()
    }
}

hotkey_cs_f(ThisHotKey) {
    global is_pre_spc := 1
    forward_char()
    global is_pre_spc := 0
}

hotkey_m_f(ThisHotKey) {
    forward_word()
}

hotkey_c_b(ThisHotKey) {
    backward_char()
}

hotkey_cs_b(ThisHotKey) {
    global is_pre_spc := 1
    backward_char()
    global is_pre_spc := 0
}

hotkey_m_b(ThisHotKey) {
    backward_word()
}

hotkey_c_d(ThisHotKey) {
    delete_char()
}

hotkey_m_d(ThisHotKey) {
    delete_word()
}

hotkey_c_h(ThisHotKey) {
    delete_backward_char()
}

hotkey_c_k(ThisHotKey) {
    kill_line()
}

hotkey_c_o(ThisHotKey) {
    open_line_emacs()
}

hotkey_c_g(ThisHotKey) {
    quit()
}

hotkey_c_l(ThisHotKey) {
    newline_emacs()
}

hotkey_c_j(ThisHotKey) {
    newline_and_indent()
}

hotkey_c_m(ThisHotKey) {
    newline()
}

hotkey_c_i(ThisHotKey) {
    indent_for_tab_command_invert()
}

hotkey_m_i(ThisHotKey) {
    indent_for_tab_command()
}

hotkey_c_s(ThisHotKey) {
    If is_pre_x {
        save_buffer()
    } 
    Else {
        isearch_forward()
    }
}

hotkey_c_r(ThisHotKey) {
    isearch_backward()
}

hotkey_c_w(ThisHotKey) {
    kill_region()
}

hotkey_m_w(ThisHotKey) {
    kill_ring_save()
}

hotkey_c_y(ThisHotKey) {
    yank()
}

hotkey_undo(ThisHotKey) {
    undo()
}

hotkey_redo(ThisHotKey) {
    redo()
}

hotkey_mark(ThisHotKey) {
    If is_pre_spc {
        global is_pre_spc := 0
    }
    Else {
        global is_pre_spc := 1
    }
}

hotkey_c_a(ThisHotKey) {
    move_beginning_of_line()
}

hotkey_cs_a(ThisHotKey) {
    global is_pre_spc := 1
    move_beginning_of_line()
    global is_pre_spc := 0
}

hotkey_c_e(ThisHotKey) {
    move_end_of_line()
}

hotkey_cs_e(ThisHotKey) {
    global is_pre_spc := 1
    move_end_of_line()
    global is_pre_spc := 0
}

hotkey_c_n(ThisHotKey) {
    next_line()
}

hotkey_cs_n(ThisHotKey) {
    global is_pre_spc := 1
    next_line()
    global is_pre_spc := 0
}

hotkey_c_p(ThisHotKey) {
    previous_line()
}

hotkey_cs_p(ThisHotKey) {
    global is_pre_spc := 1
    previous_line()
    global is_pre_spc := 0
}

hotkey_c_v(ThisHotKey) {
    scroll_down()
}

hotkey_m_v(ThisHotKey) {
    scroll_up()
}

hotkey_h(ThisHotKey) {
    If is_pre_x {
        mark_whole_buffer()
        global is_pre_x := 0
    }
    Else{
        Send ThisHotKey
    }
}

hotkey_d(ThisHotKey) {
    If is_pre_c {
        duplicate_line()
        next_line()
        global is_pre_c := 0
    }
    Else {
        Send ThisHotKey
    }
}

hotkey_a(ThisHotKey) {
    If is_pre_x {
        move_beginning_of_buffer()
        global is_pre_x := 0
    }
    Else {
        Send ThisHotKey
    }
}

hotkey_e(ThisHotKey) {
    If is_pre_x {
        move_end_of_buffer()
        global is_pre_x := 0
    }
    Else {
        Send ThisHotKey
    }
}

hotkey_c_tab(ThisHotKey) {
    tab_switch_forward()
}

hotkey_cs_tab(ThisHotKey) {
    tab_switch_backward()
}

hotkey_c_z(ThisHotKey) {
    WinMinimize("ahk_exe Effidit.exe")
}
