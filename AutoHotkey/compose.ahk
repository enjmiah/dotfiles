#MaxHotkeysPerInterval 120
SetCapsLockState, AlwaysOff
SendMode Input

Capslock & =:: Send {U+2013} ; en dash –
Capslock & -:: Send {U+2014} ; em dash —
Capslock & Space:: Send {U+2002} ; en space
Capslock & u:: Send {U+201C} ; “
Capslock & i:: Send {U+201D} ; ”
Capslock & o:: Send {U+2018} ; ‘
Capslock & p:: Send {U+2019} ; ’
Capslock & *:: Send {U+2606} ; ☆
Capslock & .:: Send {U+2026} ; …
Capslock & ,:: Send {U+30FB} ; ・
Capslock & 9:: Send {U+2190} ; ←
Capslock & 0:: Send {U+2192} ; →
Capslock & ?:: Send {U+261E} ; ☞
Capslock & 1:: Send {U+26A0} ; ⚠
Capslock & x:: Send {U+2718} ; ✘

Capslock & j:: Send {Left}
Capslock & k:: Send {Down}
Capslock & l:: Send {Up}
Capslock & `;:: Send {Right}

Capslock & r:: Send </ruby>
Capslock & c:: Send !``

Capslock & a:: EnterUnicode()

EnterUnicode()
{
	Input, Code, , {LShift}
	Send {U+%Code%}
}
