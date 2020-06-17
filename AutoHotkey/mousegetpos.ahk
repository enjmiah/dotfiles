;
; Helper script for determining the location of e.g. UI elements
;
; Author:
;     Jerry Yin / jerryyin.info
;
; License:
;     Any copyright is dedicated to the Public Domain.
;     http://creativecommons.org/publicdomain/zero/1.0/
;

Space:: PopupCursorPos()

PopupCursorPos()
{
	MouseGetPos, xpos, ypos
	MsgBox, The cursor is at X%xpos% Y%ypos%.
}
