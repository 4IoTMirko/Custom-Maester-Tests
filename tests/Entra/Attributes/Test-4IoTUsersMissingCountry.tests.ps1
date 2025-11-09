BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingCountry.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1007", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1007: Country Attribute - All users should have a country set" {
        $result = Test-4IoTUsersMissingCountry
        $result | Should -Be $true -Because "All users should have a country assigned."
    }
}