BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingEmployeeID.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1016", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1016: Employee ID Attribute - All users should have an employee ID set" {
        $result = Test-4IoTUsersMissingEmployeeID
        $result | Should -Be $true -Because "All users should have an employee ID assigned."
    }
}