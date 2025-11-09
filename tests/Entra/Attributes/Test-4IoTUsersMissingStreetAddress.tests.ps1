BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingStreetAddress.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1003", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1003: Street Address Attribute - All users should have a street address set" {
        $result = Test-4IoTUsersMissingStreetAddress
        $result | Should -Be $true -Because "All users should have a street address assigned."
    }
}