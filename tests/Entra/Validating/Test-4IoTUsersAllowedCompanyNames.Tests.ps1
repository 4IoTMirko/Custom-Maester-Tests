BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersAllowedCompanyNames.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1001", "Entra", "CustomTests", "Validation", "Users", "CompanyName" {
    It "ENTRA.UV.1001: Company Name - All users should have a valid company name" {
        $result = Test-4IoTUsersAllowedCompanyNames
        $result | Should -Be $true -Because "All users must have a company name from the valid list."
    }
}
