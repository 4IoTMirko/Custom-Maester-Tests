BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingCompanyName.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1010", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1010: Company Name Attribute - All users should have a company name set" {
        $result = Test-4IoTUsersMissingCompanyName
        $result | Should -Be $true -Because "All users should have a company name assigned."
    }
}
