# Example: Tests for 4IoT using Pester

BeforeAll {
    . "$PSScriptRoot\Test-4IoTUsersFormattingPostalCodeUSA.ps1"
}

Describe "4IoT" -Tag "ENTRA.UF.1001.T01.USA", "Entra", "CustomTests", "USA", "Users", "Formatting" {

    It "ENTRA.UF.1001.T01.USA: Postal Code - All users should have a valid US postal code" {
        $result = Test-4IoTUsersFormattingPostalCodeUSA
        $result | Should -Be $true -Because "All users must have a valid US postal code."
    }

}
