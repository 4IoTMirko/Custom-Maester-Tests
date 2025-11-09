BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingDepartment.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1008", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1008: Department Attribute - All users should have a department set" {
        $result = Test-4IoTUsersMissingDepartment
        $result | Should -Be $true -Because "All users should have a department assigned."
    }
}