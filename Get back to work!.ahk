; This script tells user off for slacking

; v1.1: Restructured and added comments

#Persistent ; Keeps a script permanently running
#NoTrayIcon ; Hide tray icon

; Set variables
title_bar_text := "System Administrator"
idle_time := 5 * 60 * 1000

If InStr(%A_UserName%, ".") ; If the user name contains a domain name
{
	Username := StrSplit(%A_UserName%, ".") ; Get the username of current user

	Loop % Username.MaxIndex() ; Loop through the array and get the last element after the dot (strip domain names)
	{
		Name := Username[A_Index]
	}
}
Else
{
	Username := %A_UserName%
	Name := Username
}


SetTimer, Check, 1000 ; Poll every second
return

Check: ; Continuously poll for the inactive time counter
IfGreater, A_TimeIdle, %idle_time%, MsgBox, , %title_bar_text%, Get back to work %Name%!, ; Send a warning after a set amout of idle time has been elapsed

Escape::function_exit() ; Exit key
function_exit()
{
	MsgBox, , %title_bar_text%, I'M STILL WATCHING YOU!
	ExitApp
}