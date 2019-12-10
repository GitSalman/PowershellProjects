$SHM = Get-Service -Name 'kCura Service Host Manager'
$WM = Get-Service -Name 'kCura EDDS Web Processing Manager'
$AM = Get-Service -Name 'kCura EDDS Agent Manager'
$IQM = Get-Service -Name 'Invariant Queue Manager'

$services = @($WM,$SHM,$AM,$IQM)

$msgBoxInput = [System.Windows.MessageBox]::Show("Would you like to start up Relativity Services on $env:computername ?",'Start Relativity Services','YesNoCancel','Error')

switch ($msgBoxInput) {

'Yes' {

    foreach ($service in $services) {
        while ($service.Status -ne 'Running') {
            Start-Service $service
            write-host $service.Status
            write-host 'Service starting'
            Start-Sleep -seconds 60
            $service.Refresh()
            if ($service.Status -eq 'Running')
            {
                Write-Host "$service service is now Running"
            }
        }
    }

}

'No' {
    function ex{exit}
}

'Cancel' {
    function ex{exit}
}

}