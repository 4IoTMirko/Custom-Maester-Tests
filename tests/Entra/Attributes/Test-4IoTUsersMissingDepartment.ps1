function Test-4IoTUsersMissingDepartment {
    $result = $true

    try {
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id
        }
        $usersWithoutDepartment = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.department)) {
                $result = $false
                $usersWithoutDepartment += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a department assigned."
        } else {
            $TestResults += "No department is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutDepartment -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}