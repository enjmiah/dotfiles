#SingleInstance force
#MaxHotkeysPerInterval 200
#NoEnv

MouseMode := false
Distance := 10

SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
SendMode Input
Menu, Tray, Icon, ../var/quill.ico

!+q::Send !{F4}

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
Capslock & ?:: Send {U+261E}{U+00A0} ; ☞<nbsp>
Capslock & 1:: Send {U+26A0}  ; ⚠
Capslock & x:: Send {U+2718}  ; ✘

Capslock & Space:: Send !``
Capslock & r:: Send </ruby>

Capslock & e:: Send {U+00E9}
Capslock & u:: Send const{Space}
Capslock & i:: Send auto{Space}
Capslock & o:: Send &{Space}
Capslock & a:: Send {Backspace}
Capslock & f:: Send for{Space}(
Capslock & t:: Send return{Space}
Capslock & Backspace:: Send ^{Backspace}
