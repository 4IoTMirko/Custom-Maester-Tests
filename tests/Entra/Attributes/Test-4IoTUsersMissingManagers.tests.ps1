BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingManagers.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1001", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1001: Manager Attribute - All users should have a manager attribute set" {
        $result = Test-4IoTUsersMissingManagers
        $result | Should -Be $true -Because "All users should have a manager assigned."
    }
}