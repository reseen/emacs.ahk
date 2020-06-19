# emacs.ahk
This tiny script allows you to use the emacs-like key bindings on Windows, which is written in AutoHotkey (AHK) language. The maintainer has used this script since 2020-06 and has verified that it works effectively for various kinds of applications.

## Supported keybindings
<table>
  <tr>
    <th>Keybinding</th>
    <th>Emacs Lisp Function</th>
  </tr>
<tr>
<td>C-Space</td>
<td>set-mark-command</td>
</tr>
<tr>
<td>M-h</td>
<td>set-mark-command</td>
</tr>
<tr>
<td>C-x C-f</td>
<td>find-file</td>
</tr>
<tr>
<td>C-x C-s</td>
<td>save-buffer</td>
</tr>
<tr>
<td>C-x C-c</td>
<td>kill-emacs</td>
</tr>
<tr>
<td>F5</td>
<td>kill-emacs</td>
</tr>
<tr>
<td>C-d</td>
<td>delete-char</td>
</tr>
<tr>
<td>M-d</td>
<td>delete-word</td>
</tr>
<tr>
<td>C-h</td>
<td>delete-backward-char</td>
</tr>
<tr>
<td>C-k</td>
<td>kill-line</td>
</tr>
<tr>
<td>C-o</td>
<td>open-line-emacs</td>
</tr>
<tr>
<td>C-g</td>
<td>quit</td>
</tr>
<tr>
<td>C-j</td>
<td>newline-and-indent</td>
</tr>
<tr>
<td>C-l</td>
<td>newline-emacs</td>
</tr>
<tr>
<td>C-m</td>
<td>newline</td>
</tr>
<tr>
<td>C-l</td>
<td>newline_emacs</td>
</tr>
<tr>
<td>M-i</td>
<td>indent-for-tab-command</td>
</tr>
<tr>
<td>C-i</td>
<td>indent-for-tab-command-invert</td>
</tr>
<tr>
<td>C-s</td>
<td>isearch-forward</td>
</tr>
<tr>
<td>C-r</td>
<td>isearch-backward</td>
</tr>
<tr>
<td>C-w</td>
<td>kill-region</td>
</tr>
<tr>
<td>M-w</td>
<td>kill-ring-save</td>
</tr>
<tr>
<td>C-y</td>
<td>yank</td>
</tr>
<tr>
<td>C-/</td>
<td>undo</td>
</tr>
<tr>
<td>C-?</td>
<td>redo</td>
</tr>
<tr>
<td>C-a</td>
<td>move-beginning-of-line</td>
</tr>
<tr>
<td>C-e</td>
<td>move-end-of-line</td>
</tr>
<tr>
<td>C-p</td>
<td>previous-line</td>
</tr>
<tr>
<td>C-n</td>
<td>next-line</td>
</tr>
<tr>
<td>C-f</td>
<td>forward-char</td>
</tr>
<tr>
<td>C-b</td>
<td>backward-char</td>
</tr>
<tr>
<td>M-f</td>
<td>forward-word</td>
</tr>
<tr>
<td>M-b</td>
<td>backward-word</td>
</tr>
<tr>
<td>C-v</td>
<td>scroll-down</td>
</tr>
<tr>
<td>M-v</td>
<td>scroll-up</td>
</tr>
<tr>
<td>win-=</td>
<td>text-scale-increase</td>
</tr>
<tr>
<td>win--</td>
<td>text-scale-decrease</td>
</tr>
<tr>
<td>F11</td>
<td>maximize or restore window</td>
</tr>
<tr>
<td>C-z, j</td>
<td>end-of-buffer</td>
</tr>
<tr>
<td>C-z, k</td>
<td>beginning of buffer</td>
</tr>
<tr>
<td>C-x, h</td>
<td>mark-whole-buffer</td>
</tr>
</table>

* Customized by Eason Huang
# Toggle Input Method by Capslock Key
use Capslock key for input method switch, and hold the Capslock key for switching Capslocks

# Other useful functions
windows.ahk include some useful fictions for handling windows system more efficient.
