BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersAllowedCities.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1003", "Entra", "CustomTests", "Validation", "Users", "City" {
    It "ENTRA.UV.1003: Cities - All users should have a valid city" {
        $result = Test-4IoTUsersAllowedCities
        $result | Should -Be $true -Because "All users must have a city from the valid list."
    }
}
