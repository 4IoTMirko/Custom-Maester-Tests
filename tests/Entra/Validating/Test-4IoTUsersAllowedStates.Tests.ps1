BeforeAll {
    . "$PSScriptRoot\Test-4IoTUsersAllowedStates.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1004", "Entra", "CustomTests", "Validation", "Users", "State" {
    It "ENTRA.UV.1004: States - All users should have a valid state" {
        $result = Test-4IoTUsersAllowedStates
        $result | Should -Be $true -Because "All users must have a state from the valid list."
    }
}