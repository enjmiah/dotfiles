#MaxHotkeysPerInterval 120
SetCapsLockState, AlwaysOff

Capslock & =:: Send {U+2013} ; en dash –
Capslock & -:: Send {U+2014} ; em dash —
Capslock & Space:: Send {U+2002} ; en space
Capslock & i:: Send {U+201C} ; “
Capslock & o:: Send {U+201D} ; ”
Capslock & [:: Send {U+2018} ; ‘
Capslock & ]:: Send {U+2019} ; ’
Capslock & *:: Send {U+2606} ; ☆
Capslock & .:: Send {U+2026} ; …
Capslock & ,:: Send {U+30FB} ; ・
Capslock & 9:: Send {U+2190} ; ←
Capslock & 0:: Send {U+2192} ; →
Capslock & ?:: Send {U+261E} ; ☞
Capslock & 1:: Send {U+26A0} ; ⚠

Capslock & j:: Send {Left}
Capslock & k:: Send {Down}
Capslock & l:: Send {Up}
Capslock & `;:: Send {Right}

:*:;r::</ruby>

Capslock & a:: EnterUnicode()

EnterUnicode()
{
	Input, Code, , {LShift}
	Send {U+%Code%}
}
