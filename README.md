# emacs.ahk
该脚本为 Windows 应用程序提供了类Emacs的按键绑定。使用 AutoHotKey V2 脚本编写。

首先使用 SharpKeys 将 CapsLock 按键修改为 RightCtrl，RightCtrl 按键修改为 LeftCtrl，这样使用 Ctrl 键为软件原生功能，CapsLock 键为 Emacs 模式按键，如此，所有应用均有 Windows 风格的完整编辑功能以及 Emacs 的快捷键精髓。


## 通用快捷键列表
所有应用均有效
<table>
  <tr>
    <th>Keybinding</th>
    <th>Function</th>
    <th>Notes</th>
  </tr>
  <tr>
    <td>C-x C-c</td>
    <td>kill-application</td>
    <td></td>
  </tr>
  <tr>
    <td>C-Space</td>
    <td>set-mark-command</td>
    <td></td>
  </tr>
  <tr>
    <td>C-g</td>
    <td>quit</td>
    <td></td>
  </tr>

  <tr>
    <th></th>
    <th></th>
    <th></th>
  </tr>

  <tr>
    <td>C-a</td>
    <td>move-beginning-of-line</td>
    <td></td>
  </tr>
  <tr>
    <td>C-e</td>
    <td>move-end-of-line</td>
    <td></td>
  </tr>
  <tr>
    <td>C-p</td>
    <td>previous-line</td>
    <td></td>
  </tr>
  <tr>
    <td>C-n</td>
    <td>next-line</td>
    <td></td>
  </tr>
  <tr>
    <td>C-f</td>
    <td>forward-char</td>
    <td></td>
  </tr>
  <tr>
    <td>C-b</td>
    <td>backward-char</td>
    <td></td>
  </tr>

  <tr>
    <th></th>
    <th></th>
    <th></th>
  </tr>

  <tr>
    <td>M-f</td>
    <td>forward-word</td>
    <td></td>
  </tr>
  <tr>
    <td>M-b</td>
    <td>backward-word</td>
    <td></td>
  </tr>

  <tr>
    <th></th>
    <th></th>
    <th></th>
  </tr>

  <tr>
    <td>C-v</td>
    <td>scroll-down</td>
    <td></td>
  </tr>
  <tr>
    <td>M-v</td>
    <td>scroll-up</td>
    <td></td>
  </tr>

  <tr>
    <th></th>
    <th></th>
    <th></th>
  </tr>

  <tr>
    <td>C-x, a</td>
    <td>end-of-buffer</td>
    <td></td>
  </tr>
  <tr>
    <td>C-x, e</td>
    <td>beginning of buffer</td>
    <td></td>
  </tr>
  <tr>
    <td>C-x, h</td>
    <td>mark-whole-buffer</td>
    <td></td>
  </tr>

  <tr>
    <td>C-S-a</td>
    <td>mark-beginning-of-line</td>
    <td></td>
  </tr>
  <tr>
    <td>C-S-e</td>
    <td>mark-end-of-line</td>
    <td></td>
  </tr>
  <tr>
    <td>C-S-p</td>
    <td>mark-previous-line</td>
    <td></td>
  </tr>
  <tr>
    <td>C-S-n</td>
    <td>mark-next-line</td>
    <td></td>
  </tr>
  <tr>
    <td>C-S-f</td>
    <td>mark-forward-char</td>
    <td></td>
  </tr>
  <tr>
    <td>C-S-b</td>
    <td>mark-backward-char</td>
    <td></td>
  </tr>

  <tr>
    <th></th>
    <th></th>
    <th></th>
  </tr>

  <tr>
    <td>C-w</td>
    <td>kill-region</td>
    <td></td>
  </tr>
  <tr>
    <td>M-w</td>
    <td>kill-ring-save</td>
    <td></td>
  </tr>
  <tr>
    <td>C-y</td>
    <td>yank</td>
    <td></td>
  </tr>

  <tr>
    <th></th>
    <th></th>
    <th></th>
  </tr>

  <tr>
    <td>C-/</td>
    <td>undo</td>
    <td></td>
  </tr>
  <tr>
    <td>C-?</td>
    <td>redo</td>
    <td></td>
  </tr>

  <tr>
    <th></th>
    <th></th>
    <th></th>
  </tr>

  <tr>
    <td>C-d</td>
    <td>delete-char</td>
    <td>可以删除选中区域</td>
  </tr>
  <tr>
    <td>M-d</td>
    <td>delete-word</td>
    <td></td>
  </tr>
  <tr>
    <td>C-k</td>
    <td>kill-line</td>
    <td></td>
  </tr>

  <tr>
    <th></th>
    <th></th>
    <th></th>
  </tr>

  <tr>
    <td>C-o</td>
    <td>open-line-up</td>
    <td>在当前行上方插入空白行</td>
  </tr>
  <tr>
    <td>C-l</td>
    <td>open-line-down</td>
    <td>在当前行下方插入空白行</td>
  </tr>
  <tr>
    <td>C-j</td>
    <td>newline-and-indent</td>
    <td>换行并且缩进</td>
  </tr>
  <tr>
    <td>C-m</td>
    <td>new-line</td>
    <td>标准换行</td>
  </tr>
</table>

<br>

## Editor Keymap
已绑定的应用
+ VsCode
+ Effidit
<table>
  <tr>
    <th>Keybinding</th>
    <th>Function</th>
    <th>Notes</th>
  </tr>
  <tr>
    <td>C-x C-f</td>
    <td>find-file</td>
    <td>打开</td>
  </tr>
  <tr>
    <td>C-s</td>
    <td>isearch-forward</td>
    <td></td>
  </tr>
  <tr>
    <td>C-r</td>
    <td>isearch-backward</td>
    <td>反向搜索，实际无效</td>
  </tr>
  <tr>
    <td>C-.</td>
    <td>tab-switch-forward</td>
    <td></td>
  </tr>
  <tr>
    <td>C-,</td>
    <td>tab-switch-backward</td>
    <td></td>
  </tr>
  <tr>
    <td>C-z</td>
    <td>appliction-minimize</td>
    <td></td>
  </tr>
</table>

<br>

## Explorer Keymap
已绑定的应用
+ Explorer
+ XYPlorer
<table>
  <tr>
    <th>Keybinding</th>
    <th>Function</th>
    <th>Notes</th>
  </tr>
  <tr>
    <td>M-]</td>
    <td>dir-forward</td>
    <td></td>
  </tr>
  <tr>
    <td>M-[</td>
    <td>dir-backward</td>
    <td></td>
  </tr>
  <tr>
    <td>M-=</td>
    <td>dir-up-level</td>
    <td></td>
  </tr>
  <tr>
    <td>M-\</td>
    <td>dir-up-level</td>
    <td>返回上级</td>
  </tr>
</table>

<br>

## Office Keymap
已绑定的应用
+ Word / Excel / PowerPoint
+ Notepad 3
<table>
  <tr>
    <th>Keybinding</th>
    <th>Function</th>
    <th>Notes</th>
  </tr>
  <tr>
    <td>C-x C-f</td>
    <td>find-file</td>
    <td></td>
  </tr>
  <tr>
    <td>C-s</td>
    <td>isearch-forward</td>
    <td></td>
  </tr>
  <tr>
    <td>C-r</td>
    <td>isearch-backward</td>
    <td>反向搜索，实际无效</td>
  </tr>
</table>

<br>

## IM Keymap
已绑定的应用
+ WeChat
+ TIM
<table>
  <tr>
    <th>Keybinding</th>
    <th>Function</th>
    <th>Notes</th>
  </tr>
  <tr>
    <td>C-j</td>
    <td>newline-and-indent</td>
    <td>换行并且缩进</td>
  </tr>
  <tr>
    <td>C-m</td>
    <td>new-line</td>
    <td>标准换行 Alt + Enter</td>
  </tr>
  <tr>
    <td>C-z</td>
    <td>appliction-minimize</td>
    <td></td>
  </tr>
</table>

<br>

# 其他

+ emacs.skl：SharpKeys 改键方案，可直接导入使用
+ template.dotx：一个基本的 word 模板。
