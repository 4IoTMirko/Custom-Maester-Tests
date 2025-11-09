BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingEmployeeHireDate.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1015", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1015: Employee Hire Date Attribute - All users should have an employee hire date set" {
        $result = Test-4IoTUsersMissingEmployeeHireDate
        $result | Should -Be $true -Because "All users should have an employee hire date assigned."
    }
}