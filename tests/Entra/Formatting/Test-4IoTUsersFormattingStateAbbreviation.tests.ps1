BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersFormattingStateAbbreviation.ps1"
}

Describe "4IoT" -Tag "ENTRA.UF.1004.T01.USState", "Entra", "CustomTests", "Formatting" {
    It "ENTRA.UF.1004.T01.USState: Two-letter state abbreviation with no periods" {
        $result = Test-4IoTUsersFormattingStateAbbreviation
        $result | Should -Be $true -Because "All users must have state in two-letter format with no periods (e.g. CA)."
    }
}