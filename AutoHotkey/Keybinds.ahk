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
~LWin Up:: return

; Quit window with Win+Shift+Q
#+q::
    Send, {alt down}{f4}{alt up}
Return

; Win+D to trigger Launchy
#d::
    Send, {alt down}{space}{alt up}
Return

switchDesktopByNumber( target ) {
    Loop, 5 {
        send ^#{left}
    }
    while( target > 0 ) {
        sleep 2
        send ^#{right}
        target--
    }
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
