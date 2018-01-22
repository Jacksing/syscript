$marks = [Ordered]@{};

$marksPath = Join-Path (split-path -parent $profile) .bookmarks

if(test-path $marksPath){
import-csv $marksPath | %{$marks[$_.key]=$_.value}
}

function m($number){
$marks["$number"] = (pwd).path
mdump
}

function d($number){
$marks.remove("$number")
mdump
}

function g($number){
cd $marks["$number"]
}

function mdump{
$marks.getenumerator() | Sort -Property Name | export-csv $marksPath -notype
}

function lm{
$marks.getenumerator() | Sort -Property Name
}

Register-EngineEvent PowerShell.Exiting -Action { mdump } | out-null
