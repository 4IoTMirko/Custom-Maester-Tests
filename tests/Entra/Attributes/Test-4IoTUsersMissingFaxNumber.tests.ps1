BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingFaxNumber.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1013", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1013: Fax Number Attribute - All users should have a fax number set" {
        $result = Test-4IoTUsersMissingFaxNumber
        $result | Should -Be $true -Because "All users should have a fax number assigned."
    }
}