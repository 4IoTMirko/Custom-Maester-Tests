function Test-4IoTUsersMissingMobilePhone {
    $result = $true

    try {
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id
        }
        $usersWithoutMobilePhone = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.mobilePhone)) {
                $result = $false
                $usersWithoutMobilePhone += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a mobile phone assigned."
        } else {
            $TestResults += "No mobile phone is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutMobilePhone -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}