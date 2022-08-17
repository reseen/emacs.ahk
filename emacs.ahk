;; AHK v2 Script
;;
;; An autohotkey script that provides emacs-like keybinding on Windows Applications
;;
InstallKeybdHook
#UseHook

SetKeyDelay 0

; ----------------------------------------------------------------------------
;  应用按键绑定
; ----------------------------------------------------------------------------
base_keymap()                                   ; 基础按键绑定 所有软件下均生效

editor_keymap("ahk_exe Code.exe")               ; VsCode
editor_keymap("ahk_exe Effidit.exe")            ; Effidit

office_keymap("ahk_exe WINWORD.EXE")            ; Word
office_keymap("ahk_exe Notepad3.exe")           ; Notepad3

explorer_keymap("ahk_exe explorer.exe")         ; 资源管理器
explorer_keymap("ahk_exe XYplorer.exe")         ; Xyplorer

im_keymap("ahk_exe WeChat.exe")
im_keymap("ahk_exe TIM.exe")
im_keymap("ahk_exe CUClient.exe")

regedit_minimize("ahk_exe Wolai.exe", 0)        ; 我来

; ----------------------------------------------------------------------------
;  editor 文本编辑器 按键模式
; ----------------------------------------------------------------------------
editor_keymap(wintext) {
    HotIfWinActive wintext

    Hotkey ">^f", forward_char_and_find_file    ; C-x C-f 打开文件 / 光标右移
    
    Hotkey ">^s", iserach_and_save_buffer       ; C-x s 保存 / 搜索
    Hotkey ">^r", isearch_backward              ; 搜索 反向

    Hotkey ">^+.", tab_switch_forward           ; 切换 Tab 栏
    Hotkey ">^+,", tab_switch_backward          ; 切换 Tab 栏  反向

    Hotkey ">^z", (ThisHotkey) => WinMinimize(wintext)  ; 最小化
}

; ----------------------------------------------------------------------------
;  explorer 资源管理器 按键绑定
; ----------------------------------------------------------------------------
explorer_keymap(wintext) {
    HotIfWinActive wintext

    Hotkey "<!]", dir_forward                   ; 前进
    Hotkey "<![", dir_backward                  ; 后退
    HotKey "<!=", dir_up_level                  ; 上一级
    HotKey "<!\", dir_up_level                  ; 上一级
}

; ----------------------------------------------------------------------------
;  office 按键绑定
; ----------------------------------------------------------------------------
office_keymap(wintext) {
    HotIfWinActive wintext

    Hotkey ">^f", forward_char_and_find_file    ; C-x f 打开文件 / 光标右移

    Hotkey ">^s", iserach_and_save_buffer       ; C-x s 保存 / 搜索
    Hotkey ">^r", isearch_backward              ; 搜索 反向
}


im_keymap(wintext) {
    HotIfWinActive wintext
    Hotkey ">^j", new_line_and_indent_wechat    ; 换行并且缩进
    Hotkey ">^m", new_line_wechat               ; 换行

    Hotkey ">^z", (ThisHotkey) => Send("{Esc}") ; 最小化
}

; ----------------------------------------------------------------------------
;  通用按键绑定，所有应用均生效
; ----------------------------------------------------------------------------
base_keymap(){
    Hotkey ">^c", hotkey_c_c                    ; C-c 基础组合键
    Hotkey ">^x", hotkey_c_x                    ; C-x 基础组合键
    Hotkey "<!vk20", mark                       ; M-Space Mark
    Hotkey ">^g", quit_wechat                   ; quit

    Hotkey ">^a", move_beginning_of_line        ; 基础光标移动
    Hotkey ">^e", move_end_of_line
    Hotkey ">^n", next_line
    Hotkey ">^p", previous_line
    Hotkey ">^f", forward_char
    Hotkey ">^b", backward_char
    Hotkey "<!f", forward_word
    Hotkey "<!b", backward_word

    Hotkey ">^v", scroll_down                   ; 向下滚动
    Hotkey "<!v", scroll_up                     ; 向上滚动

    Hotkey "a", move_beginning_of_buffer        ; C-x a 光标移动到最前
    Hotkey "e", move_end_of_buffer              ; C-x e 光标移动到最后
    Hotkey "h", mark_whole_buffer               ; C-x h 全选

    Hotkey ">^+a", mark_and_beginning_of_line   ; 快速选择
    Hotkey ">^+e", mark_and_end_of_line
    Hotkey ">^+n", mark_and_next_line
    Hotkey ">^+p", mark_and_previous_line
    Hotkey ">^+f", mark_and_forward_char
    Hotkey ">^+b", mark_and_backward_char

    Hotkey ">^w", kill_region                   ; 剪切
    Hotkey "<!w", kill_ring_save                ; 复制
    Hotkey ">^y", yank                          ; 粘贴

    Hotkey ">^/", undo                          ; 撤销
    Hotkey ">^+/", redo                         ; 重做

    Hotkey ">^d", delete_char                   ; 删除
    Hotkey "<!d", delete_word                   ; 删除 单词
    Hotkey ">^k", kill_line                     ; 删除到行尾
    Hotkey ">^o", open_line_up_wechat           ; 在上方新增一行
    Hotkey ">^l", open_line_down_wechat         ; 在下方新增一行
    Hotkey ">^j", new_line_and_indent           ; 换行并且缩进
    Hotkey ">^m", new_line                      ; 换行
}

; ----------------------------------------------------------------------------
;  注册最小化快捷键
; ----------------------------------------------------------------------------
regedit_minimize(wintext, mode) {
    HotIfWinActive wintext

    if (mode == 0) {
        Hotkey ">^z", (ThisHotkey) => WinMinimize(wintext)  ; 最小化
    }
    else {
        ; 个别软件的最小化是 esc 按键
        Hotkey ">^z", (ThisHotkey) => Send("{Esc}") 
    }
}

; ----------------------------------------------------------------------------
; Emacs 快捷键功能实现
; ----------------------------------------------------------------------------

; turns to be 1 when ctrl-x is pressed
is_pre_x := 0
; turns to be 1 when Ctrl-c is pressed
is_pre_c := 0
; turns to be 1 when ctrl-space is pressed
is_pre_spc := 0

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

quit(ThisHotKey) {
    Send "{ESC}"
    global is_pre_spc := 0
    global is_pre_x := 0
    global is_pre_c := 0
}

quit_wechat(ThisHotKey) {
    Send "{Right}{Left}"
    global is_pre_spc := 0
    global is_pre_x := 0
    global is_pre_c := 0
}

mark(ThisHotKey) {
    If is_pre_spc {
        global is_pre_spc := 0
    }
    Else {
        global is_pre_spc := 1
    }
}

delete_char(ThisHotKey) {
    Send "{Del}"
    global is_pre_spc := 0
}

delete_word(ThisHotKey) {
    Send "^{Del}"
    global is_pre_spc := 0
}

delete_backward_char() {
    Send "{BS}"
    global is_pre_spc := 0
}

kill_line(ThisHotKey) {
    Send "{ShiftDown}{END}{SHIFTUP}"
    Sleep 50
    Send "^x"
    global is_pre_spc := 0
}

new_line(ThisHotKey) {
    Send "{Enter}"
    global is_pre_spc := 0
}

new_line_wechat(ThisHotKey) {
    Send "{Ctrl down}{Enter}{Ctrl up}"
    global is_pre_spc := 0
}

new_line_and_indent(ThisHotKey) {
    Send "{Enter}"
    Sleep 50
    Send "{Tab}"
    global is_pre_spc := 0
    Return
}

new_line_and_indent_wechat(ThisHotKey) {
    Send "{Ctrl down}{Enter}{Ctrl up}"
    Sleep 50
    Send "    "
    global is_pre_spc := 0
}

open_line_up(ThisHotKey) {
    Send "{Home}{Enter}{Up}"
    global is_pre_spc := 0
}

open_line_down(ThisHotKey) {
    Send "{END}{Enter}"
    global is_pre_spc := 0
}

open_line_up_wechat(ThisHotKey) {
    Send "{Home}"
    Sleep 50
    Send "{Ctrl down}{Enter}{Ctrl up}"
    Sleep 50
    Send "{Up}"
    global is_pre_spc := 0
}

open_line_down_wechat(ThisHotKey) {
    Send "{END}"
    Sleep 50
    Send "{Ctrl down}{Enter}{Ctrl up}"
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

isearch_forward() {
    Send "^f"
    global is_pre_spc := 0
}

isearch_backward(ThisHotKey) {
    Send "^f"
    global is_pre_spc := 0
}

iserach_and_save_buffer(ThisHotKey) {
    If is_pre_x {
        save_buffer()
    } 
    Else {
        isearch_forward()
    }
}

kill_region(ThisHotKey) {
    Send "^x"
    global is_pre_spc := 0
}

kill_ring_save(ThisHotKey) {
    Send "^c"
    Send "{Right}"    ; 复制完成后 取消选择
    global is_pre_spc := 0
}

yank(ThisHotKey) {
    Send "^v"
    global is_pre_spc := 0
}

undo(ThisHotKey) {
    Send "^z"
    global is_pre_spc := 0
}

redo(ThisHotKey) {
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

move_beginning_of_buffer(ThisHotKey) {
    If is_pre_x {
        Send "^{HOME}"
        global is_pre_x := 0
    }
    Else {
        if GetKeyState("CapsLock", "T") == 0 {
            Send ThisHotKey
        }
        else{
            Send StrUpper(ThisHotKey)
        }
    }
}

move_end_of_buffer(ThisHotKey) {
    If is_pre_x {
        Send "^{END}"
        global is_pre_x := 0
    }
    Else {
        if GetKeyState("CapsLock", "T") == 0 {
            Send ThisHotKey
        }
        else{
            Send StrUpper(ThisHotKey)
        }
    }
}

move_beginning_of_line(ThisHotKey) {
    if is_pre_spc
        Send "+{HOME}"
    Else
        Send "{HOME}"
}

move_end_of_line(ThisHotKey) {
    if is_pre_spc
        Send "+{END}"
    Else
        Send "{END}"
}

next_line(ThisHotKey) {
    if is_pre_spc
        Send "+{Down}"
    Else
        Send "{Down}"
}

previous_line(ThisHotKey) {
    if is_pre_spc
        Send "+{Up}"
    Else
        Send "{Up}"
}

forward_char(ThisHotKey) {
    if is_pre_spc
        Send "+{Right}"
    Else
        Send "{Right}"
}

backward_char(ThisHotKey) {
    if is_pre_spc
        Send "+{Left}"
    Else
        Send "{Left}"
}

forward_word(ThisHotKey) {
    if is_pre_spc
        Send "^+{Right}"
    Else
        Send "^{Right}"
}

backward_word(ThisHotKey) {
    if is_pre_spc
        Send "^+{Left}"
    Else
        Send "^{Left}"
}

forward_char_and_find_file(ThisHotKey) {
    If is_pre_x {
        find_file()
    }
    Else {
        forward_char(ThisHotKey)
    }
}

mark_and_beginning_of_line(ThisHotKey) {
    global is_pre_spc := 1
    move_beginning_of_line(ThisHotKey)
    global is_pre_spc := 0
}

mark_and_end_of_line(ThisHotKey) {
    global is_pre_spc := 1
    move_end_of_line(ThisHotKey)
    global is_pre_spc := 0
}

mark_and_next_line(ThisHotKey) {
    global is_pre_spc := 1
    next_line(ThisHotKey)
    global is_pre_spc := 0
}

mark_and_previous_line(ThisHotKey) {
    global is_pre_spc := 1
    previous_line(ThisHotKey)
    global is_pre_spc := 0
}

mark_and_forward_char(ThisHotKey) {
    global is_pre_spc := 1
    forward_char(ThisHotKey)
    global is_pre_spc := 0
}

mark_and_backward_char(ThisHotKey) {
    global is_pre_spc := 1
    backward_char(ThisHotKey)
    global is_pre_spc := 0
}

mark_whole_buffer(ThisHotKey) {
    If is_pre_x {
        Send "^{End}^+{Home}"
        global is_pre_spc := 0
        global is_pre_x := 0
    }
    Else{
        if GetKeyState("CapsLock", "T") == 0 {
            Send ThisHotKey
        }
        else{
            Send StrUpper(ThisHotKey)
        }
    }
}

scroll_up(ThisHotKey) {
    if is_pre_spc
        Send "+{PgUp}"
    Else
        Send "{PgUp}"
}

scroll_down(ThisHotKey) {
    if is_pre_spc
        Send "+{PgDn}"
    Else
        Send "{PgDn}"
}

tab_switch_forward(ThisHotKey) {
    Send "^{Tab}"
}

tab_switch_backward(ThisHotKey) {
    Send "^+{Tab}"
}

dir_forward(ThisHotkey) {
    Send "!{Right}"
}

dir_backward(ThisHotKey) {
    Send "!{Left}"
}

dir_up_level(ThisHotKey) {
    Send "!{Up}"
}
