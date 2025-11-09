BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingOfficeLocation.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1009", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1009: Office Location Attribute - All users should have an office location set" {
        $result = Test-4IoTUsersMissingOfficeLocation
        $result | Should -Be $true -Because "All users should have an office location assigned."
    }
}