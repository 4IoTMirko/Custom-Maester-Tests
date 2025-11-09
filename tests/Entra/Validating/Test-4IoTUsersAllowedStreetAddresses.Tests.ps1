
BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersAllowedStreetAddresses.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1002", "Entra", "CustomTests", "Validation", "Users", "StreetAddress" {
    It "ENTRA.UV.1002: Street Addresses - All users should have a valid street address" {
        $result = Test-4IoTUsersAllowedStreetAddresses
        $result | Should -Be $true -Because "All users must have a street address from the valid list."
    }
}