
function Update-4IoTUserMissingOfficeLocation {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$OfficeLocation
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set office location to: $OfficeLocation")) {
            Update-MgUser -UserId $UserId -OfficeLocation $OfficeLocation
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}