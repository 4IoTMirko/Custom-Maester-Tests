
# Example: Tests for 4IoT using Pester

BeforeAll {
    . "$PSScriptRoot\Test-4IoTUsersFormattingBusinessNumberUSA1.ps1"
}

Describe "4IoT" -Tag "ENTRA.UF.1002.T01.USA", "Entra", "CustomTests", "USA", "Users", "BusinessNumber" {

    It "ENTRA.UF.1002.T01.USA: Business Number - All users should have a valid format" {
        $result = Test-4IoTUsersFormattingBusinessNumberUSA1
        $result | Should -Be $true -Because "All users must have a valid business number in (123) 456-7890 x123 format."
    }

}