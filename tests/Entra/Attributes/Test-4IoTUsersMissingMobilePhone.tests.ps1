BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingMobilePhone.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1011", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1011: Mobile Phone Attribute - All users should have a mobile phone set" {
        $result = Test-4IoTUsersMissingMobilePhone
        $result | Should -Be $true -Because "All users should have a mobile phone assigned."
    }
}