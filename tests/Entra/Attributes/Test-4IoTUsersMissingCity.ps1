function Test-4IoTUsersMissingCity {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/../validation.json")
    )
    $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
    $result = $true

    try {
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id | %{Invoke-MtGraphRequest -RelativeUri "users" -Filter "id eq '$($_.id)'" -Select id,displayName,jobTitle,companyName,postalCode,streetaddress,state,city,country,businessPhones,department,officeLocation,mobilePhone,employeeHireDate,employeeID,sponsors,mail,othermails,proxyaddresses}
        }
        $usersWithoutCity = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.city)) {
                $result = $false
                $usersWithoutCity += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a city assigned."
        } else {
            $TestResults += "No city is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutCity -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}