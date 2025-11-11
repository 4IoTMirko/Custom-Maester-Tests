function Test-4IoTUsersFormattingCapitalInitialEmail {
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
        $incorrectEmailUsers = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }
            if ([string]::IsNullOrEmpty($user.givenName) -or [string]::IsNullOrEmpty($user.surname) -or [string]::IsNullOrEmpty($user.mail)) {
                $result = $false
                $incorrectEmailUsers += $user
                continue
            }
            $expectedLocalPart = "{0}{1}" -f $user.givenName.Substring(0,1).ToUpper(), ($user.surname.Substring(0,1).ToUpper() + $user.surname.Substring(1).ToLower())
            $actualLocalPart = ($user.mail -split "@")[0]

            if ($actualLocalPart -cne $expectedLocalPart) {
                $result = $false
                $incorrectEmailUsers += $user
            }
        }

        if ($result) {
            $testResults = "All user emails have the correct capital-initial format."
        } else {
            $testResults = "Some user emails do not meet the capital-initial format.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $testResults -GraphObjects $incorrectEmailUsers -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}