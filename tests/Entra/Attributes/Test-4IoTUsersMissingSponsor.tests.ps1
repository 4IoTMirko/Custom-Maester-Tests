BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingSponsor.ps1
}

Describe "4IoT" -Tag "ENTRA.UA.1014", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1014: Sponsor Attribute - All users should have a sponsor set" {
        $result = Test-4IoTUsersMissingSponsor
        $result | Should -Be $true -Because "All users should have a sponsor assigned."
    }
}