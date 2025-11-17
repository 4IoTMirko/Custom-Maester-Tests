
# File: Test-4IoTUsersFormattingLowerCaseInitialEmail.ps1

function Test-4IoTUsersFormattingLowerCaseInitialEmail {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/../validation.json")
    )
    $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
    $result = $true
    try {
        $Users = @()
        $Groups = $validation.groupsInScope
        foreach ($Group in $Groups) {
            $users += Get-MtGroupMember -GroupId $group.id | %{Invoke-MtGraphRequest -RelativeUri "users" -Filter "id eq '$($_.id)'" -Select id,givenname,surname,displayName,jobTitle,companyName,postalCode,streetaddress,state,city,country,businessPhones,department,officeLocation,mobilePhone,employeeHireDate,employeeID,sponsors,mail,othermails,proxyaddresses}
        }
        $incorrectEmailUsers = @()

        foreach ($user in $users) {
            if ([string]::IsNullOrEmpty($user.givenName) -or [string]::IsNullOrEmpty($user.surname) -or [string]::IsNullOrEmpty($user.mail)) {
                $result = $false
                $incorrectEmailUsers += $user
                continue
            }
            $expectedLocalPart = $(($user.givenName).Substring(0,1).ToUpper() + ($user.givenName).Substring(1).ToLower()  + '.' + ($user.surname).Substring(0,1).ToUpper() + ($user.surname).Substring(1).ToLower() ) -replace 'ä', 'ae' -replace 'ö', 'oe' -replace 'ü', 'ue' -replace 'Ä', 'Ae' -replace 'Ö', 'Oe' -replace 'Ü', 'Ue' -replace 'ß', 'ss'
            $actualLocalPart = ($user.mail -split "@")[0]

            if ($actualLocalPart -cne $expectedLocalPart) {
                $result = $false
                $incorrectEmailUsers += $user
            }
        }

        if ($result) {
            Add-MtTestResultDetail -Result "All users have the correct lowercase email format." -GraphObjects @() -GraphObjectType Users
        } else {
            Add-MtTestResultDetail -Result "Some users do not meet the lowercase email format.`n%TestResult%" -GraphObjects $incorrectEmailUsers -GraphObjectType Users
        }
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}