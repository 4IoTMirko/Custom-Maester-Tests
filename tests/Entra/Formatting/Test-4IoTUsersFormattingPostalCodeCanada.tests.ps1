
# Example: Tests for 4IoT using Pester

BeforeAll {
    . "$PSScriptRoot\Test-4IoTUsersFormattingPostalCodeCanada.ps1"
}

Describe "4IoT" -Tag "ENTRA.UF.1001.T01.Canada", "Entra", "CustomTests", "Canada", "Users", "Formatting" {

    It "ENTRA.UF.1001.T01.Canada: Postal Code - All users should have a valid Canadian postal code" {
        $result = Test-4IoTUsersFormattingPostalCodeCanada
        $result | Should -Be $true -Because "All users must have a valid Canadian postal code."
    }

}