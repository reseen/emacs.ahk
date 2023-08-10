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
vscode_keymap("ahk_exe Code.exe")               	; VsCode

editor_keymap("ahk_exe Effidit.exe")            	; Effidit
editor_keymap("ahk_exe Notepad3.exe")           	; Notepad3

office_keymap("ahk_exe WINWORD.EXE")            	; Word
office_keymap("ahk_exe EXCEL.EXE")              	; Excel

explorer_keymap("ahk_exe explorer.exe")         	; 资源管理器
explorer_keymap("ahk_exe XYplorer.exe")         	; Xyplorer

im_keymap("ahk_exe WeChat.exe")
im_keymap("ahk_exe TIM.exe")
im_keymap("ahk_exe CUClient.exe")
im_keymap("ahk_exe flomo卡片笔记.exe")

terminal_keymap("ahk_exe WindowsTerminal.exe")			; Windows Terminal

HotIfWinNotActive  "ahk_exe WindowsTerminal.exe"
base_keymap()                                   	; 基础按键绑定
base61_keymap()                                 	; 61键键盘基础按键绑定
HotIfWinNotActive

; ----------------------------------------------------------------------------
;  editor 文本编辑器 按键模式
; ----------------------------------------------------------------------------
vscode_keymap(wintext) {
    HotIfWinActive wintext

    Hotkey ">^f", forward_char_and_find_file    	; C-x C-f 打开文件 / 光标右移

    Hotkey "<!n", line_move_down				   	; 将本行与下一行调换 / 终端分组间向下切换
    Hotkey "<!p", line_move_up					; 将本行与上一行调换 / 终端分组间向上切换
    
    Hotkey ">^s", iserach_and_save_buffer       	; C-x s 保存 / 搜索
    Hotkey ">^r", isearch_backward              	; 搜索 反向

    Hotkey ">^+.", tab_switch_forward           	; 切换 Tab 栏
    Hotkey ">^+,", tab_switch_backward          	; 切换 Tab 栏  反向
    
    Hotkey ">^t", hotkey_c_terminal				; 终端面板基础组合键 激活面板
    
    Hotkey "k", kill_buffer						; 关闭当前文件
    
    Hotkey ">^!n", term_switch_backward       	; 终端面板切换 上一组
    Hotkey ">^!p", term_switch_forward      		; 终端面板切换 下一组
    
    Hotkey "0", template_code_0
    Hotkey "1", template_code_1
    
    Hotkey ">^z", (ThisHotkey) => WinMinimize(wintext)  ; 最小化
    HotIfWinActive
}

; ----------------------------------------------------------------------------
;  editor 文本编辑器 按键模式
; ----------------------------------------------------------------------------
editor_keymap(wintext) {
    HotIfWinActive wintext

    Hotkey ">^f", forward_char_and_find_file    ; C-x C-f 打开文件 / 光标右移

    Hotkey "<!n", line_move_down
    Hotkey "<!p", line_move_up
    
    Hotkey ">^s", iserach_and_save_buffer       ; C-x s 保存 / 搜索
    Hotkey ">^r", isearch_backward              ; 搜索 反向

    Hotkey ">^+.", tab_switch_forward           ; 切换 Tab 栏
    Hotkey ">^+,", tab_switch_backward          ; 切换 Tab 栏  反向

    Hotkey ">^z", (ThisHotkey) => WinMinimize(wintext)  ; 最小化
    HotIfWinActive
}

; ----------------------------------------------------------------------------
;  explorer 资源管理器 按键绑定
; ----------------------------------------------------------------------------
explorer_keymap(wintext) {
    HotIfWinActive wintext

    Hotkey "<![", dir_forward                   	; 前进
    Hotkey "<!]", dir_backward                  	; 后退
    HotKey "<!=", dir_up_level                  	; 上一级
    HotKey "<!\", dir_up_level                  	; 上一级
    HotKey ">^+d", dir_delete                   	; 彻底删除文件夹
    HotIfWinActive
}

; ----------------------------------------------------------------------------
;  office 按键绑定
; ----------------------------------------------------------------------------
office_keymap(wintext) {
    HotIfWinActive wintext

    Hotkey ">^f", forward_char_and_find_file    ; C-x f 打开文件 / 光标右移

    Hotkey ">^s", iserach_and_save_buffer       ; C-x s 保存 / 搜索
    Hotkey ">^r", isearch_backward              ; 搜索 反向
    HotIfWinActive
}

; ----------------------------------------------------------------------------
;  im 按键绑定
; ----------------------------------------------------------------------------
im_keymap(wintext) {
    HotIfWinActive wintext
    Hotkey ">^g", quit_im                       ; quit
    Hotkey ">^j", new_line_and_indent_wechat    ; 换行并且缩进
    Hotkey ">^m", new_line_wechat               ; 换行
    Hotkey ">^o", open_line_up_im           	; 在上方新增一行
    Hotkey ">^l", open_line_down_im         	; 在下方新增一行

    Hotkey ">^z", (ThisHotkey) => Send("{Esc}") ; 最小化
    HotIfWinActive
}

; ----------------------------------------------------------------------------
;  terminal 按键绑定
; ----------------------------------------------------------------------------
terminal_keymap(wintext){
	HotIfWinActive wintext
    Hotkey ">^x", hotkey_c_x                    ; C-x 基础组合键
    Hotkey ">^g", quit                          ; quit

    Hotkey ">^a", move_beginning_of_line        ; 基础光标移动
    Hotkey ">^e", move_end_of_line
    Hotkey ">^n", next_line
    Hotkey ">^p", previous_line
    Hotkey ">^f", forward_char
    Hotkey ">^b", backward_char

    Hotkey "a", move_beginning_of_buffer        ; C-x a 光标移动到最前
    Hotkey "e", move_end_of_buffer              ; C-x e 光标移动到最后
    Hotkey "h", mark_whole_buffer               ; C-x h 全选
    Hotkey "u", undo_pre_x                      ; C-x u 撤销

    Hotkey ">^+a", mark_and_beginning_of_line   ; 快速选择
    Hotkey ">^+e", mark_and_end_of_line
    Hotkey ">^+n", mark_and_next_line
    Hotkey ">^+p", mark_and_previous_line
    Hotkey ">^+f", mark_and_forward_char
    Hotkey ">^+b", mark_and_backward_char

    Hotkey ">^d", delete_char                   ; 删除
    Hotkey "<!d", delete_word                   ; 删除 单词
    Hotkey ">^k", kill_line                     ; 删除到行尾
    HotIfWinActive
}

; ----------------------------------------------------------------------------
;  通用按键绑定，所有应用均生效
; ----------------------------------------------------------------------------
base_keymap(){
    Hotkey ">^c", hotkey_c_c                    ; C-c 基础组合键
    Hotkey ">^x", hotkey_c_x                    ; C-x 基础组合键
    Hotkey "<!vk20", mark                       ; M-Space Mark
    Hotkey ">^g", quit                          ; quit

    Hotkey ">^a", move_beginning_of_line        ; 基础光标移动
    Hotkey ">^e", move_end_of_line
    Hotkey ">^n", next_line
    Hotkey ">^p", previous_line
    Hotkey ">^f", forward_char
    Hotkey ">^b", backward_char
    Hotkey "<!f", forward_word
    Hotkey "<!b", backward_word

    Hotkey ">^+v", scroll_down                  ; 向下滚动  C-v 与 Ditto 冲突
    Hotkey "<!v", scroll_up                     ; 向上滚动

    Hotkey "a", move_beginning_of_buffer        ; C-x a 光标移动到最前
    Hotkey "e", move_end_of_buffer              ; C-x e 光标移动到最后
    Hotkey "h", mark_whole_buffer               ; C-x h 全选
    Hotkey "u", undo_pre_x                      ; C-x u 撤销

    Hotkey "j", start_calculator                ; C-c j 启动计算器
    Hotkey "n", start_notepad                   ; C-c n 启动记事本

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
    Hotkey ">^+o", open_line_up           		; 在上方新增一行
    Hotkey ">^o", open_line_down         		; 在下方新增一行
    Hotkey ">^j", new_line_and_indent           ; 换行并且缩进
    Hotkey ">^m", new_line                      ; 换行

;	Hotkey ">^+r", reenter_chinese              ; 中文输入法重新输入选中文字
}

; ----------------------------------------------------------------------------
;  61键按键绑定，所有应用均生效
; ----------------------------------------------------------------------------
base61_keymap() {
    Hotkey ">^1", fn_f1
    Hotkey ">^2", fn_f2
    Hotkey ">^3", fn_f3
    Hotkey ">^4", fn_f4
    Hotkey ">^5", fn_f5
    Hotkey ">^6", fn_f6
    Hotkey ">^7", fn_f7
    Hotkey ">^8", fn_f8
    Hotkey ">^9", fn_f9
    Hotkey ">^0", fn_f10
    Hotkey ">^-", fn_f11
    Hotkey ">^=", fn_f12
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
; Tips 提示
; ----------------------------------------------------------------------------

show_tips(wintext) {
    ToolTip wintext
}

hide_tips(wintext) {
    ToolTip wintext
    SetTimer () => ToolTip(), -500
}

; ----------------------------------------------------------------------------
; Emacs 快捷键功能实现
; ----------------------------------------------------------------------------

; turns to be 1 when ctrl-x is pressed
is_pre_x := 0
; turns to be 1 when Ctrl-c is pressed
is_pre_c := 0
; turns to be 1 when Ctrl-t is pressed
is_pre_t := 0
; turns to be 1 when ctrl-space is pressed
is_pre_spc := 0

hotkey_c_x(ThisHotkey) {
    global is_pre_x := 1
    show_tips("C-x")
}

hotkey_c_c(ThisHotKey) {
    If is_pre_x {
        kill_emacs()
        global is_pre_x := 0
        hide_tips("C-x C-c")
    } 
    Else {
        global is_pre_c := 1
        show_tips("C-c")
    } 
}

hotkey_c_terminal(ThisHotkey) {
	If is_pre_t {
		Send "^+p"
		Send "Terminal: Switch Active Terminal"
		Send "{Enter}"
		global is_pre_t := 0
		hide_tips("C-t C-t")
	}
	Else If is_pre_c {
		Send "^+p"
		Send "Terminal: Focus Terminal"
		Send "{Enter}"
		global is_pre_c := 0
		hide_tips("C-c C-t")
	}
	Else {
		global is_pre_t := 1
		show_tips("C-t")
	}
}

quit(ThisHotKey) {
	if (is_pre_x != 0 or is_pre_c != 0 or is_pre_t != 0 or is_pre_spc != 0) {
		global is_pre_spc := 0
		global is_pre_x := 0
		global is_pre_c := 0
		global is_pre_t := 0
		hide_tips("C-g")
	}
	else{
		Send "{ESC}"
	}
}

quit_im(ThisHotKey) {
    if is_pre_spc == 1 {
        Send "{Right}"
    }
    Send "+{ESC}"
    global is_pre_spc := 0
    global is_pre_x := 0
    global is_pre_c := 0
    hide_tips("C-g")
}

mark(ThisHotKey) {
    If is_pre_spc {
        global is_pre_spc := 0
        hide_tips("C-space Mark Disable")
    }
    Else {
        global is_pre_spc := 1
        show_tips("C-space Mark Enable")
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
	If is_pre_t {
		Send "^+p"
		Send "Terminal: Kill the Active Terminal Instance"
		Send "{Enter}"
		global is_pre_t := 0
		hide_tips("C-t C-k")
	}
	Else {
		Send "{ShiftDown}{END}{SHIFTUP}"
		Sleep 50
		Send "^x"
		global is_pre_spc := 0
	}
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

open_line_up_im(ThisHotKey) {
    Send "{Home}"
    Sleep 50
    Send "{Ctrl down}{Enter}{Ctrl up}"
    Sleep 50
    Send "{Up}"
    global is_pre_spc := 0
}

open_line_down_im(ThisHotKey) {
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
	If is_pre_c {
		Send "^+p"
		Send "View: Focus into Primary Side Bar"
		Send "{Enter}"
		global is_pre_c := 0
		hide_tips("C-c C-r")
    }
    Else {
		Send "^f"
		global is_pre_spc := 0
    }
}

iserach_and_save_buffer(ThisHotKey) {
    If is_pre_x {
        save_buffer()
        hide_tips("C-x C-s")
    } 
    Else {
        isearch_forward()
    }
}

kill_region(ThisHotKey) {
    Send "^x"
    if is_pre_spc {
        hide_tips("C-w")
    }
    global is_pre_spc := 0
}

kill_ring_save(ThisHotKey) {
    Send "^c"
    Send "{Right}"    ; 复制完成后 取消选择
    if is_pre_spc {
        hide_tips("M-w")
    }
    global is_pre_spc := 0
}

yank(ThisHotKey) {
    Send "^v"
    if is_pre_spc {
        hide_tips("C-y")
    }
    global is_pre_spc := 0
}

undo_pre_x(ThisHotKey) {
    If is_pre_x {
        Send "^z"
        global is_pre_spc := 0
        hide_tips("C-x u")
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

kill_emacs() {
    Send "!{F4}"
    global is_pre_x := 0
}

kill_buffer(ThisHotKey) {
	If is_pre_x {
        Send "^w"
        global is_pre_x := 0
        hide_tips("C-x k")
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

move_beginning_of_buffer(ThisHotKey) {
    If is_pre_x {
        Send "^{HOME}"
        global is_pre_x := 0
        hide_tips("C-x a")
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
         hide_tips("C-x e")
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
    Else if is_pre_c {
		Send "^+p"
		Send "View: Focus Active Editor Group"
		Send "{Enter}"
		global is_pre_c := 0
		hide_tips("C-c C-e")
    }
    Else
        Send "{END}"
}

next_line(ThisHotKey) {
    if is_pre_spc
        Send "+{Down}"
    Else if is_pre_t{
		Send "^+p"
		Send "Terminal: Create New Terminal"
		Send "{Enter}"
		global is_pre_t := 0
		hide_tips("C-t C-n")
    }
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
        hide_tips("C-x C-f")
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
        hide_tips("C-x h")
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

line_move_up(ThisHotKey){
    Send "!{Up}"
}

line_move_down(ThisHotKey){
    Send "!{Down}"
}

term_switch_backward(ThisHotKey){
    Send "^{PgUp}"
}

term_switch_forward(ThisHotKey){
    Send "^{PgDn}"
}

term_switch_active(ThisHotKey){
	If is_pre_t {
		Send "^+p"
		Send "Terminal: Switch Active Terminal"
		Send "{Enter}"
		global is_pre_t := 0
		hide_tips("C-t C-a")
	}
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

dir_delete(ThisHotKey){
    send "+{Del}"
}

; 使用中文输入法重新输入选中文字
reenter_chinese(ThisHotKey) {

    user32 := DllCall("LoadLibrary", "Str", "user32", "Ptr")
    GetForegroundWindow := DllCall("GetProcAddress", "Ptr", user32, "AStr", "GetForegroundWindow", "Ptr")

    imm32 := DllCall("LoadLibrary", "Str", "imm32", "Ptr")
    ImmGetDefaultIMEWnd := DllCall("GetProcAddress", "Ptr", imm32, "AStr", "ImmGetDefaultIMEWnd", "Ptr")

    ; 获取当前激活窗口句柄
    activeHwnd := DllCall(GetForegroundWindow)

    ; 获取当前激活窗口的 IME ID
    IMEwin_id := DllCall(ImmGetDefaultIMEWnd, "Uint", activeHwnd, "Uint")

    state := SendMessage(0x283, 0x001, 0, , IMEwin_id, , , , 1000)
    if (state == 0){
        ; 如果是英文输入法状态，则切换到中文
        SendMessage(0x283, 0x002, 1025, , IMEwin_id, , , , 1000)
    }

    A_Clipboard := ""   ; 清空剪贴板
    Sleep 50
    Send "^c"

    ClipWait  
    Sleep 50
    Send A_Clipboard    ; 重新输入  
}

fn_f1(ThisHotKey){
    Send "{F1}"
}
fn_f2(ThisHotKey){
    Send "{F2}"
}
fn_f3(ThisHotKey){
    Send "{F3}"
}
fn_f4(ThisHotKey){
    Send "{F4}"
}
fn_f5(ThisHotKey){
    Send "{F5}"
}
fn_f6(ThisHotKey){
    Send "{F6}"
}
fn_f7(ThisHotKey){
    Send "{F7}"
}
fn_f8(ThisHotKey){
    Send "{F8}"
}
fn_f9(ThisHotKey){
    Send "{F9}"
}
fn_f10(ThisHotKey){
    Send "{F10}"
}
fn_f11(ThisHotKey){
    Send "{F11}"
}
fn_f12(ThisHotKey){
    Send "{F12}"
}


; 启动计算器
start_calculator(ThisHotKey) {
    If is_pre_c {
        global is_pre_c := 0
        Run("calc.exe")
        hide_tips("C-c j")
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

; 启动记事本
start_notepad(ThisHotKey) {
    If is_pre_c {
        global is_pre_c := 0
        Run("notepad")
        hide_tips("C-c n")
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

; 代码片段
template_code_0(ThisHotKey) {
	If is_pre_t {
		Send "{#}------------------------------------------------------------------------------"
		Send "{Enter}"
		Send "{#}"
		Send "{Enter}"
		Send "{#}------------------------------------------------------------------------------"
		Send "{Up}"
		
		global is_pre_t := 0
        hide_tips("C-t 0")
	}
	Else {
		Send ThisHotKey
	}
}

template_code_1(ThisHotKey) {
	If is_pre_t {
		Send "if __name__ == `"__main__`":"
		global is_pre_t := 0
        hide_tips("C-t 0")
	}
	Else {
		Send ThisHotKey
	}
}

