;; declare variables
tmp_path=d:\tmp    ;;; autohotkey 可以事先定义一些变量
polyworks_path=C:\Program Files\InnovMetric\PolyWorks MS 2020\bin\polyworks.exe
emacs_path=C:\Users\Aqua\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Gnu Emacs\Emacs
home_path=c:\home\
appdata=C:\Users\Aqua\AppData\Roaming
ahk_path=D:\dev_tools\AutoHotKey\emacs.ahk

#n::Run Notepad

;#g::Run "D:\Dev_Tools\emacs-28.0.50\bin\runemacs.exe"


;;;  start emacs
#g::   ;; 
    ifWinExist,ahk_class emacs::MainFrame_0   ;;;判断xshell 进程是否启动
        winActivate   ;;; 激活窗口
    else
        run %emacs_path%
   return


;; 通过Alt+c 启动命令窗口，打开指定应用
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
            run %emacs_path%    ;;快速打开emacs
		else if (command=="pws")
		    run %polyworks_path% ;;打开PolyWorks软件
		else if (command=="rime")
		    run %appdata%\rime ;;打开Rime config path
		else if (command=="ahk")
		    run %ahk_path% ;;打开ahk路径
        else if (command=="home")
		    run %home_path% ;;打开home路径
		else if (command=="lazy")
		    run %home_path%\lazycat-emacs\site-lisp ;;打开lazycat-emacs config路径
		else if (command=="aqua")
		    run %home_path%\Aquaemacs ;;打开my emacs config路径
		else if (command=="soft")
		    run d:/软件 ;;打开软件目录路径
		else if (command=="work")
		    run d:/work ;;打开work目录路径
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

