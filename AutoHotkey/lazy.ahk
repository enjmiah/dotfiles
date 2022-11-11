;
; Author:
;     Jerry Yin / jerryyin.info
;
; License:
;     Any copyright is dedicated to the Public Domain.
;     http://creativecommons.org/publicdomain/zero/1.0/
;
; Instructions:
;   - Map LWin to ScrollLock in the Windows registry for convenience/ergonomics.
;

#SingleInstance force
#MaxHotkeysPerInterval 200
#NoEnv

SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
Menu, Tray, Icon, ../var/quill.ico

#If GetKeyState("ScrollLock", "P")
; Close the active window.
+q::Send !{F4}
; Activate colour picker (PowerToys).
+c::Send #+c
; Activate crosshairs (PowerToys).
+x::Send #+x
#If

; Activate launcher (PowerToys).
ScrollLock & Space::Send #{Space}

; Spawn launcher (Run box).
ScrollLock & d::Send #r
ScrollLock & e::Run explorer
ScrollLock & w::Send #2
ScrollLock & a::Send #7
ScrollLock & Enter::Send #6

; For desktop-switching in VirtuaWin.
#If not GetKeyState("LShift", "P")
ScrollLock & 1::Send !1
ScrollLock & 2::Send !2
ScrollLock & 3::Send !3
ScrollLock & 4::Send !4
ScrollLock & 5::Send !5
ScrollLock & 6::Send !6
ScrollLock & 7::Send !7
ScrollLock & 8::Send !8
ScrollLock & 9::Send !9
ScrollLock & 0::Send !0
#If GetKeyState("LShift", "P")
ScrollLock & 1::Send !+1
ScrollLock & 2::Send !+2
ScrollLock & 3::Send !+3
ScrollLock & 4::Send !+4
ScrollLock & 5::Send !+5
ScrollLock & 6::Send !+6
ScrollLock & 7::Send !+7
ScrollLock & 8::Send !+8
ScrollLock & 9::Send !+9
ScrollLock & 0::Send !+0
#If

; Switching windows using a custom program.
ScrollLock & j::Send !j
ScrollLock & k::Send !k
ScrollLock & l::Send !l
ScrollLock & `;::Send !`;

Capslock & F1::Send {Volume_Mute}
Capslock & F2::Send {Volume_Down 1}
Capslock & F3::Send {Volume_Up 1}

Capslock & j::  Send {blind}{Left}
Capslock & k::  Send {blind}{Down}
Capslock & l::  Send {blind}{Up}
Capslock & `;:: Send {blind}{Right}

Capslock & g:: Send {U+201C}  ; “
Capslock & h:: Send {U+201D}  ; ”
Capslock & `:: Send {U+2018}  ; ‘
Capslock & ':: Send {U+2019}  ; ’
Capslock & =:: Send {U+2013}  ; en dash –
Capslock & -:: Send {U+2014}  ; em dash —
Capslock & *:: Send {U+2606}  ; ☆
Capslock & .:: Send {U+202F}.{U+202F}.{U+202F}.{U+2009} ; . . .
Capslock & \:: Send {U+2026}  ; …
Capslock & ,:: Send {U+30FB}  ; ・
Capslock & 9:: Send {U+2190}  ; ←
Capslock & 0:: Send {U+2192}  ; →
Capslock & /:: Send {U+261E}{U+00A0} ; ☞<nbsp>
Capslock & 1:: Send {U+26A0}  ; ⚠
Capslock & x:: Send {U+2718}  ; ✘

Capslock & q:: Send !`` ; Toggle IME

Capslock & e:: Send {U+00E9} ; é
