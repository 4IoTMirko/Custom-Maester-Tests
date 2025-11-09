BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingBusinessPhone.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1012", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1012: Business Phone Attribute - All users should have a business phone set" {
        $result = Test-4IoTUsersMissingBusinessPhone
        $result | Should -Be $true -Because "All users should have a business phone assigned."
    }
}