function Test-4IoTUsersMissingEmployeeHireDate {
    $result = $true

    try {
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id
        }
        $usersWithoutHireDate = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.employeeHireDate)) {
                $result = $false
                $usersWithoutHireDate += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without an employee hire date assigned."
        } else {
            $TestResults += "No employee hire date is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutHireDate -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}