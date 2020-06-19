;; declare variables
tmp_path=d:\tmp    ;;; autohotkey 可以事先定义一些变量
polyworks_path=C:\Program Files\InnovMetric\PolyWorks MS 2020\bin\polyworks.exe
eamcs_path=D:\Dev_Tools\emacs-28.0.50\bin\runemacs.exe
home=c:\home
appdata=C:\Users\Aqua\AppData\Roaming

#n::Run Notepad

;#g::Run "D:\Dev_Tools\emacs-28.0.50\bin\runemacs.exe"

#w::WinMaximize,A

;;;  start emacs
#g::   ;; 
    ifWinExist,ahk_class emacs::MainFrame_0   ;;;判断xshell 进程是否启动
        winActivate   ;;; 激活窗口
    else
        run %eamcs_path%
return

::/rime::
	run  %appdata%\Rime
return

::/home::
run %home% 
return


;; 通过Ctrl+c 启动命令窗口，打开指定应用
!c::
    inputBox,command,enter command
    if ErrorLevel
        return
    else
        if (command=="tmp")
            run %tmp_path%   ;;;打开指定文件夹 用两个百分号%%包围说明这是一个变量
        else if (command=="baidu")
            run https://www.baidu.com  ;;; 快速打开百度
        else if (command=="c" || command=="d")
            run %command%:/   ;;快速打开这些盘
        else if (command=="emacs")
            run %emacs_path%     ;;快速打开emacs
				else if (command=="pws")
				    run %polyworks_path% ;;打开PolyWorks软件
    return

;; 获取鼠标位置的颜色值
^!c::
    MouseGetPos, mouseX, mouseY
    ; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
    PixelGetColor, color, %mouseX%, %mouseY%, RGB
    ; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
    StringRight color,color,6
    ; 截取 color（第二个 color）右边的6个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
    clipboard = %color%
    ; 把 color 的值发送到剪贴板
return


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

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1 
  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1 
  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1
  IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
    Return 1
  ; Avoid VMwareUnity with AutoHotkey
  IfWinActive,ahk_class VMwareUnityHostWndClass
    Return 1
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
;  IfWinActive,ahk_class SWT_Window0 ; Eclipse
;    Return 1
;   IfWinActive,ahk_class Xming X
;     Return 1
;   IfWinActive,ahk_class SunAwtFrame
;     Return 1
   IfWinActive,ahk_class Emacs ; NTEmacs
     Return 1  
;   IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
;     Return 1
  Return 0
}

delete_char()
{
  Send {Del}
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


^x::
  If is_target()
    Send %A_ThisHotkey%
  Else
    is_pre_x = 1
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
  Else
    delete_char()
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
   If is_target()
     Send %A_ThisHotkey%
   Else
     newline_emacs()
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
  If is_target()
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

