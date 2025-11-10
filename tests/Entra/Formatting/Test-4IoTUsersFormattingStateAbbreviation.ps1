function Test-4IoTUsersFormattingStateAbbreviation {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
    $result = $true
    try {
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id | %{Invoke-MtGraphRequest -RelativeUri "users" -Filter "id eq '$($_.id)'" -Select id,displayName,jobTitle,companyName,postalCode,streetaddress,state,city,country,businessPhones,department,officeLocation,mobilePhone,employeeHireDate,employeeID,sponsors,mail,othermails,proxyaddresses}
        }
        $incorrectStates = @()

        foreach ($user in $users) {
            if ([string]::IsNullOrEmpty($user.state)) {
                $result = $false
                $incorrectStates += $user
                continue
            }
            # Expected format: Two uppercase letters (no periods). Example: CA
            if ($user.state -notmatch '^[A-Z]{2}$') {
                $result = $false
                $incorrectStates += $user
            }
        }

        if ($result) {
            Add-MtTestResultDetail -Result "All users have the correct US state format (e.g. CA)." -GraphObjects @() -GraphObjectType Users
        } else {
            Add-MtTestResultDetail -Result "Some users have an incorrect state format.`n%TestResult%" -GraphObjects $incorrectStates -GraphObjectType Users
        }
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}