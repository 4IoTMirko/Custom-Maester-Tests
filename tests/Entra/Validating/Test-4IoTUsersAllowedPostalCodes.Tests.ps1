BeforeAll {
    . "$PSScriptRoot\Test-4IoTUsersAllowedPostalCodes.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1005", "Entra", "CustomTests", "Validation", "Users", "PostalCode" {
    It "ENTRA.UV.1005: Postal Codes - All users should have a valid postal code" {
        $result = Test-4IoTUsersAllowedPostalCodes
        $result | Should -Be $true -Because "All users must have a postal code from the valid list."
    }
}