BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersAllowedLocations.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1010.L01", "Entra", "CustomTests", "Validation", "Users", "Location" {
    It "ENTRA.UV.1010.L01: Locations - All users must have all 7 location properties correct" {
        $result = Test-4IoTUsersAllowedLocations
        $result | Should -Be $true -Because "All users must have streetAddress, city, state, and postalCode, country, businessPhones, and companyName matching exactly within the same allowed record."
    }
}
