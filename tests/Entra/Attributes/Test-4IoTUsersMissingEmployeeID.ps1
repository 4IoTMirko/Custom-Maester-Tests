function Test-4IoTUsersMissingEmployeeID {
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
        $usersWithoutEmployeeID = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.employeeID)) {
                $result = $false
                $usersWithoutEmployeeID += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without an employee ID assigned."
        } else {
            $TestResults += "No employee ID is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutEmployeeID -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}