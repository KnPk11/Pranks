; This script chaotically moves victim's mouse (configurable from offensive )

; v1.1: Added comments

#Persistent ; Keeps a script permanently running
#NoTrayIcon ; Hide tray icon

loop, 
{
	Random, SleepTime, 1, 10
	Random, X, -100, 100
	Random, Y, -100, 100
	MouseGetPos, X, Y ; Get current mouse coordinates
	Sleep, %SleepTime% ; How often should the mouse move
	MouseMove, %X%, %Y%, 2, R ; Move mouse telative to current position (R)
	Sleep, 100
}
Escape::function_exit() ; Exit key
function_exit()
{
	ExitApp
}