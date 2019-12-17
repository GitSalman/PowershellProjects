#Script to start Chrome and sign into Relativity, then start SSMS
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$chromePath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
$ssmsPath = "C:\Program Files (x86)\Microsoft SQL Server\130\Tools\Binn\ManagementStudio\Ssms.exe"


#Starting Chrome
Write-Host 'Starting Google Chrome...'

Start-Process -FilePath $chromePath

$chrome = Get-Process chrome -ErrorAction SilentlyContinue

Sleep 5

if ($chrome) {
    Write-Host 'Google Chrome has started.'
} else {
    Write-Host 'Google Chrome failed to start.'
}


[System.Windows.Forms.SendKeys]::SendWait("relativity.admin@relativity.com")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Sleep 2
[System.Windows.Forms.SendKeys]::SendWait("")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")


#Starting SSMS
Write-Host 'Starting SQL Server Management Studio...'
Start-Process -FilePath $ssmsPath
$ssms = Get-Process Ssms -ErrorAction SilentlyContinue

Sleep 30

if ($ssms) {
    Write-Host 'SQL Server Management Studio has started.'
} else {
    Write-Host 'SQL Server Management Studio failed to start.'
}

[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
