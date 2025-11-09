BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersAllowedLocationsNoBusinessPhones.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1010.L02", "Entra", "CustomTests", "Validation", "Users", "Location" {
    It "ENTRA.UV.1010.L02: Locations - All users must have 6 location properties correct" {
        $result = Test-4IoTUsersAllowedLocationsNoBusinessPhones
        $result | Should -Be $true -Because "All users must have streetAddress, city, state, postalCode, country, and companyName matching exactly within the allowed record."
    }
}
