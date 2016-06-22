Const strDestination = "E:\MD\_"

Set objArgs = WScript.Arguments
Set WshShell = WScript.CreateObject("WScript.Shell")

For i = 0 to objArgs.Count - 1   '' Loop through all arguments.
  strShortCut = strDestination & "\" & GetAName(objArgs(i)) & ".lnk"
  set oShellLink = WshShell.CreateShortcut(strShortCut)
  oShellLink.TargetPath = objArgs(i)
  oShellLink.WindowStyle = 1
  ''oShellLink.Description = "Created By Ivan Chen"
  oShellLink.WorkingDirectory = Left(objArgs(i), InStrRev(objArgs(i), "\"))
  oShellLink.Save
Next

Function GetAName(DriveSpec)
   Dim fso
   Set fso = CreateObject("Scripting.FileSystemObject")
   GetAName = fso.GetFileName(DriveSpec)
End Function
''end