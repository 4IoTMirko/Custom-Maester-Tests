BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingState.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1005", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1005: State Attribute - All users should have a state set" {
        $result = Test-4IoTUsersMissingState
        $result | Should -Be $true -Because "All users should have a state assigned."
    }
}