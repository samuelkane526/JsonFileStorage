param([string]$text = "Welcome to PowerShell", [int]$speed = 10) # 10ms

function WriteLine([string]$line) {
	[int]$end = $line.Length
	$startPos = $HOST.UI.RawUI.CursorPosition
	$spaces = "                                                                     "
	[int]$termHalfWidth = 120 / 2
	foreach($pos in 1 .. $end) {
		$HOST.UI.RawUI.CursorPosition = $startPos
		Write-Host "$($spaces.Substring(0, $termHalfWidth - $pos / 2) + $line.Substring(0, $pos))" -noNewline
		Start-Sleep -milliseconds $speed
	}
	Write-Host ""
}

try {
	WriteLine $text 
	exit 0 # success
} catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}
Read-Host -Prompt "Press Enter to exit"
