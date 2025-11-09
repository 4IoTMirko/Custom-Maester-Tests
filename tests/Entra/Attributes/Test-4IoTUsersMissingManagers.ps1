function Test-4IoTUsersMissingManagers {
    $result = $true

    try {
        # Retrieve all users from Microsoft Graph
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id
        }

        # Initialize an array to track users without a manager
        $usersWithoutManager = @()

        # Loop through each user and ensure they have a manager assigned
        foreach ($user in $users) {
            if($user.jobTitle -eq "CEO" -or $user.displayName -eq "On-Premises Directory Synchronization Service Account" ) {
            continue
}

            # Fetch the manager for the current user
            $manager = Get-MgUserManager -UserId $user.Id -ErrorAction SilentlyContinue

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