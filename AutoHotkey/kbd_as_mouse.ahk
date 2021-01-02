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
