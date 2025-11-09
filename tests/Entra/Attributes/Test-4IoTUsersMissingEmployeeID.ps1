function Test-4IoTUsersMissingEmployeeID {
    $result = $true

    try {
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id
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