# Orginal Link
# http://superuser.com/questions/593987/change-directory-to-previous-directory-in-powershell

# Request:
# I am a Linux guy, but am trying to be open-minded and learn some Powershell. I miss the ability to cd - back to a previous directory, 
# like in *nix shells. Is there a similar command in Powershell¡ªone that would allow me to return to my previous directory?

# Solution
[System.Collections.Stack]$GLOBAL:dirStack = @()
$GLOBAL:oldDir = ''
$GLOBAL:addToStack = $true
function prompt
{
    Write-Host "PS $(get-location)>"  -NoNewLine -foregroundcolor Magenta
    $GLOBAL:nowPath = (Get-Location).Path
    if(($nowPath -ne $oldDir) -AND $GLOBAL:addToStack){
        $GLOBAL:dirStack.Push($oldDir)
        $GLOBAL:oldDir = $nowPath
    }
    $GLOBAL:AddToStack = $true
    return ' '
}
function BackOneDir{
    $lastDir = $GLOBAL:dirStack.Pop()
    $GLOBAL:addToStack = $false
    cd $lastDir
}
Set-Alias bd BackOneDir
