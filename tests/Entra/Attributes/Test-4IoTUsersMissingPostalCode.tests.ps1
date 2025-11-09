BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingPostalCode.ps1

}

Describe "4IoT" -Tag "ENTRA.UA.1006", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1006: Postal Code Attribute - All users should have a postal code set" {
        $result = Test-4IoTUsersMissingPostalCode
        $result | Should -Be $true -Because "All users should have a postal code assigned."
    }
}
