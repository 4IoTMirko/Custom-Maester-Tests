function Test-4IoTUsersMissingManagers {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
    $result = $true

    try {
        # Retrieve all users from Microsoft Graph
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id | %{Invoke-MtGraphRequest -RelativeUri "users" -Filter "id eq '$($_.id)'" -Select id,displayName,jobTitle,companyName,postalCode,streetaddress,state,city,country,businessPhones,department,officeLocation,mobilePhone,employeeHireDate,employeeID,sponsors,mail,othermails,proxyaddresses}
        }

        # Initialize an array to track users without a manager
        $usersWithoutManager = @()

        # Loop through each user and ensure they have a manager assigned
        foreach ($user in $users) {
            if($user.jobTitle -eq "Geschäftsführer" -or $user.displayName -eq "On-Premises Directory Synchronization Service Account" ) {
            continue
}

            # Fetch the manager for the current user
            $manager = Get-MgBetaUserManager -UserId $user.Id -ErrorAction SilentlyContinue

            if ([string]::IsNullOrEmpty($manager)) {
                $result = $false
                $usersWithoutManager += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users with out managers assigned."
        } else {
            $TestResults += "No managers are assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutManager -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}