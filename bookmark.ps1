$marks = @{};

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
$marks.getenumerator() | export-csv $marksPath -notype
}

function lm{
$marks
}

Register-EngineEvent PowerShell.Exiting -Action { mdump } | out-null
