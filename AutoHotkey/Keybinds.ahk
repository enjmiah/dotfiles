;
; Keybinds.ahk
;
; Custom keybindings for making interacting with Windows's window manager more
; ergonomic.
;
; Author:
;     Jerry Yin / jerryyin.info
;
; License:
;     Any copyright is dedicated to the Public Domain.
;     http://creativecommons.org/publicdomain/zero/1.0/
;

; Disable Win key as start menu. A lot of shortcuts use Win as a modifier, so
; it's easy to fat finger otherwise.
~LWin Up::return

; Middle click with Win+S (what ASUS Smart Gesture sends when you triple tap)
#s:: Send, {MButton}{LWin up}

; Quit window with Win+Shift+Q
#+q:: Send, !{f4}

; Win+D to trigger Launchy
#d:: Send, !{space}

switchDesktopByNumber( target ) {
    Loop, 5 {
        Send, ^#{left}
    }
    while( target > 0 ) {
        Sleep, 1
        Send, ^#{right}
        target--
    }
    ; just in case
    Send, {ctrl up}{lwin up}
}

; Win+number to switch to desktop
#1::switchDesktopByNumber(0)
#2::switchDesktopByNumber(1)
#3::switchDesktopByNumber(2)
#4::switchDesktopByNumber(3)
#5::switchDesktopByNumber(4)
#6::switchDesktopByNumber(5)
#7::switchDesktopByNumber(6)
#8::switchDesktopByNumber(7)
#9::switchDesktopByNumber(8)
#0::switchDesktopByNumber(9)
