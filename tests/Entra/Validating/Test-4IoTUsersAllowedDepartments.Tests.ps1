BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersAllowedDepartments.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1009", "Entra", "CustomTests", "Validation", "Users", "Department" {
    It "ENTRA.UV.1009: Department - All users should have a valid department" {
        $result = Test-4IoTUsersAllowedDepartments
        $result | Should -Be $true -Because "All users must have a department from the valid list."
    }
}
