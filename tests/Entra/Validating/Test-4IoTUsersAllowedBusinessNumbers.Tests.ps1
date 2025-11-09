BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersAllowedBusinessNumbers.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1007", "Entra", "CustomTests", "Validation", "Users", "BusinessNumber" {
    It "ENTRA.UV.1007: Business Number - All users should have an allowed business number" {
        $result = Test-4IoTUsersAllowedBusinessNumbers
        $result | Should -Be $true -Because "All users must have a business number from the valid list."
    }
}
