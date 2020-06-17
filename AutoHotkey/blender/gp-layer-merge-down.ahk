SetCapsLockState, AlwaysOff

SetDefaultMouseSpeed, 0
SetMouseDelay, 20

Capslock & m:: MergeDown()

MergeDown()
{
	Click, 1909, 379
	Click, 1786, 548
	SendInput {Esc}
}
