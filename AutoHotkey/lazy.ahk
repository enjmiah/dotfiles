#SingleInstance force
#MaxHotkeysPerInterval 200
#NoEnv

MouseMode := false
Distance := 10

SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
SendMode Input
Menu, Tray, Icon, ../var/quill.ico

CapsLock & F1::Send {Volume_Mute}
CapsLock & F2::Send {Volume_Down 1}
CapsLock & F3::Send {Volume_Up 1}

CapsLock & j::  Send {Left}
CapsLock & k::  Send {Down}
CapsLock & l::  Send {Up}
CapsLock & `;:: Send {Right}

Capslock & =:: Send {U+2013} ; en dash –
Capslock & -:: Send {U+2014} ; em dash —
Capslock & u:: Send {U+201C} ; “
Capslock & i:: Send {U+201D} ; ”
Capslock & o:: Send {U+2018} ; ‘
Capslock & p:: Send {U+2019} ; ’
Capslock & *:: Send {U+2606} ; ☆
Capslock & .:: Send {U+00A0}.{U+00A0}.{U+00A0}. ; . . .
Capslock & e:: Send {U+2026} ; …
Capslock & ,:: Send {U+30FB} ; ・
Capslock & 9:: Send {U+2190} ; ←
Capslock & 0:: Send {U+2192} ; →
Capslock & ?:: Send {U+261E}{U+00A0} ; ☞<nbsp>
Capslock & 1:: Send {U+26A0} ; ⚠
Capslock & x:: Send {U+2718} ; ✘

Capslock & Space:: Send !``
Capslock & a:: Send {Insert}
Capslock & r:: Send </ruby>

move(dx, dy) {
  global
  MouseMove, (Distance * dx), (Distance * dy), 0, R
  Distance := Distance * 1.1
}

; Toggle mouse mode
ScrollLock::
    MouseMode := not MouseMode
    return
Home::
    If (MouseMode)
        move(0, -1)
    Else
        Send, {Home}
    return
End::
    If (MouseMode)
        move(0, 1)
    Else
        Send, {End}
    return
Delete::
    If (MouseMode)
        move(-1, 0)
    Else
        Send, {Delete}
    return
PgDn::
    If (MouseMode)
        move(1, 0)
    Else
        Send, {PgDn}
    return
Home up::Distance := 10
End up::Distance := 10
Delete up::Distance := 10
PgDn up::Distance := 10
PgUp::
    If (MouseMode)
        click right
    Else
        Send, {PgUp}
    return

; This allows to press and hold the left mouse button instead of just clicking it once. Needed for drag and drop operations.
; snippet by x79animal at https://autohotkey.com/board/topic/59665-key-press-and-hold-emulates-mouse-click-and-hold-win7/
Ins::
    If (MouseMode) {
        If (A_PriorHotKey = A_ThisHotKey)
              return
        click down
    } Else {
        Send, {Ins}
    }
    return
Ins Up::click up
