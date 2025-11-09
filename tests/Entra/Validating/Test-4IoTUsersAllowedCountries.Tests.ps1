BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersAllowedCountries.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1006", "Entra", "CustomTests", "Validation", "Users", "Country" {
    It "ENTRA.UV.1006: Countries - All users should have a valid country" {
        $result = Test-4IoTUsersAllowedCountries
        $result | Should -Be $true -Because "All users must have a country from the allowed list."
    }
}
