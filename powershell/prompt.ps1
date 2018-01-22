function prompt {
  $origLastExitCode = $LASTEXITCODE

  $stringComparison = [System.StringComparison]::OrdinalIgnoreCase
  $devPath = 'E:\debcahifg\hifgdebca\ifgdebcah\khfgdecj\cahifgdebc\ahifgdebc\jghefcdbi'
  $lsvPath = 'D:\work\lsv'
  $promptChar = "$([char]0x0015)"

  $pathInfo = $ExecutionContext.SessionState.Path.CurrentLocation
  $currentPath = if ($pathInfo.Drive) { $pathInfo.Path } else { $pathInfo.ProviderPath }
  if ($currentPath -and $currentPath.StartsWith($devPath, $stringComparison))
  {
    $currentPath = "#" + $currentPath.SubString($devPath.Length)
  }
  elseif ($currentPath -and $currentPath.StartsWith($lsvPath, $stringComparison))
  {
    $currentPath = "%" + $currentPath.SubString($lsvPath.Length)
  }
  # Write-Host "$([char]0x0700)" -BackgroundColor $([ConsoleColor]::Blue) -NoNewline
  Write-Host $currentPath -ForegroundColor $([ConsoleColor]::DarkBlue ) -NoNewline
  Write-Host " [$(Get-Date -Format 'HH:mm:ss')]" -ForegroundColor $([ConsoleColor]::DarkYellow) -NoNewline
  Write-VcsStatus
  Write-Host "`n$($promptChar * ($nestedPromptLevel + 1))" -ForegroundColor $([ConsoleColor]::DarkMagenta ) -NoNewline
  $LASTEXITCODE = $origLastExitCode
  " "
}