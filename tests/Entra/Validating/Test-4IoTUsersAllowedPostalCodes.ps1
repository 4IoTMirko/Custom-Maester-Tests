function Test-4IoTUsersAllowedPostalCodes {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/../validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        # Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid zip codes from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json
        $validZipCodes = $validation.validLocations.postalCode

        # Retrieve all member users from Graph
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id | %{Invoke-MtGraphRequest -RelativeUri "users" -Filter "id eq '$($_.id)'" -Select id,displayName,jobTitle,companyName,postalCode,streetaddress,state,city,country,businessPhones,department,officeLocation,mobilePhone,employeeHireDate,employeeID,sponsors,mail,othermails,proxyaddresses}
        }
        $usersNotInList = @()

        foreach ($user in $users) {
            # Skip certain accounts you do not want to evaluate
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Check if the user’s postal code is missing OR not in the list of valid zip codes
            if ($null -eq $user.postalCode -or -not ($validZipCodes -contains $user.postalCode)) {
                $result = $false
                $usersNotInList += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a postal code in the valid list."
        } else {
            $TestResults = "These users have postal codes not found in the valid list:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersNotInList -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}