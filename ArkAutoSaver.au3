#include <Constants.au3>
#include <Date.au3>

Local $iAnswer = MsgBox(3, "Ark AutoSaver", "'Yes' if you want to AutoSave your first choice, 'No' if you want to AutoSave your second choice (in .ini)")

If ($iAnswer == 2) Then
	EndProgram()
EndIf

$proces="ShooterGame.exe"
$secondMapFolderPath = IniRead("arkConfig.ini", "Paths", "secondMapFolderPath", "0")
$secondMapBackupFolderPath = IniRead("arkConfig.ini", "Paths", "secondMapBackupFolderPath", "0")
$firstMapFolderPath = IniRead("arkConfig.ini", "Paths", "firstMapFolderPath", "0")
$firstMapBackupFolderPath = IniRead("arkConfig.ini", "Paths", "firstMapBackupFolderPath", "0")
$gamePath = IniRead("arkConfig.ini", "Paths", "gamePath", "0")
$saveTime = IniRead("arkConfig.ini", "Timer", "saveTime", "0")
$saveTime *= 60 * 1000
ShellExecute($gamePath)
DirCreate ($secondMapBackupFolderPath)
DirCreate ($firstMapBackupFolderPath)

If ($secondMapFolderPath == 0) Then
	MsgBox($MB_SYSTEMMODAL, "Ark AutoSaver Error", "Sorry, it looks like your Second map folder is wrong. Programm will end :(")
	EndProgram()
ElseIf ($firstMapFolderPath == 0) Then
	MsgBox($MB_SYSTEMMODAL, "Ark AutoSaver Error", "Sorry, it looks like your First map folder is wrong. Programm will end :(")
	EndProgram()
EndIf

while 1
	sleep ($saveTime)
	If ProcessExists($proces) Then
		$currentDate = @YEAR & "-" & @MON & "-" & @MDAY  & " " & @HOUR & "h" & @MIN & "m" & @SEC & "s"
		($iAnswer == 7) ? DirCopy($blackwoodSaveFolderPath, $secondMapBackupFolderPath & $currentDate, 0) : DirCopy( $firstMapFolderPath, $firstMapBackupFolderPath & $currentDate, 0 )
		; MsgBox($MB_SYSTEMMODAL, "Ark", "Files have been saved")
	Else
		EndProgram()
	EndIf
WEnd

Func EndProgram()
    Exit
EndFunc