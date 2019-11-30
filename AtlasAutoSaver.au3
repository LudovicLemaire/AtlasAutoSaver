#include <Constants.au3>
#include <Date.au3>

Local $iAnswer = MsgBox(3, "ATLAS AutoSaver", "'Yes' if you want to AutoSave Ocean, 'No' if you want to AutoSave Blackwood")

If ($iAnswer == 2) Then
	EndProgram()
EndIf

$proces="AtlasGame.exe"
$blackwoodSaveFolderPath = IniRead("atlasConfig.ini", "Paths", "blackwoodSaveFolderPath", "0")
$blackwoodBackupFolderPath = IniRead("atlasConfig.ini", "Paths", "blackwoodBackupFolderPath", "0")
$oceanSaveFolderPath = IniRead("atlasConfig.ini", "Paths", "oceanSaveFolderPath", "0")
$oceanBackupFolderPath = IniRead("atlasConfig.ini", "Paths", "oceanBackupFolderPath", "0")
$gamePath = IniRead("atlasConfig.ini", "Paths", "gamePath", "0")
$saveTime = IniRead("atlasConfig.ini", "Timer", "saveTime", "0")
$saveTime *= 60 * 1000
ShellExecute($gamePath)
DirCreate ($blackwoodBackupFolderPath)
DirCreate ($oceanBackupFolderPath)

If ($blackwoodSaveFolderPath == 0) Then
	MsgBox($MB_SYSTEMMODAL, "ATLAS AutoSaver Error", "Sorry, it looks like your Blackwood folder is wrong. Programm will end :(")
	EndProgram()
ElseIf ($oceanSaveFolderPath == 0) Then
	MsgBox($MB_SYSTEMMODAL, "ATLAS AutoSaver Error", "Sorry, it looks like your Ocean folder is wrong. Programm will end :(")
	EndProgram()
EndIf

while 1
	sleep ($saveTime)
	If ProcessExists($proces) Then
		$currentDate = @YEAR & "-" & @MON & "-" & @MDAY  & " " & @HOUR & "h" & @MIN & "m" & @SEC & "s"
		($iAnswer == 7) ? DirCopy($blackwoodSaveFolderPath, $blackwoodBackupFolderPath & $currentDate, 0) : DirCopy( $oceanSaveFolderPath, $oceanBackupFolderPath & $currentDate, 0 )
		; MsgBox($MB_SYSTEMMODAL, "Atlas", "Files have been saved")
	Else
		EndProgram()
	EndIf
WEnd

Func EndProgram()
    Exit
EndFunc