BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingCity.ps1
}


Describe "4IoT" -Tag "ENTRA.UA.1004", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1004: City Attribute - All users should have a city set" {
        $result = Test-4IoTUsersMissingCity
        $result | Should -Be $true -Because "All users should have a city assigned."
    }
}