
# Example: Tests for 4IoT using Pester

BeforeAll {
    . "$PSScriptRoot\Test-4IoTUsersFormattingBusinessNumberUSA2.ps1"
}

Describe "4IoT" -Tag "ENTRA.UF.1002.T02.USA", "Entra", "CustomTests", "USA", "Users", "BusinessNumber" {

    It "ENTRA.UF.1002.T02.USA: Business Number - All users should have a valid format" {
        $result = Test-4IoTUsersFormattingBusinessNumberUSA2
        $result | Should -Be $true -Because "All users must have a valid business number in (123) 456-7890 format."
    }

}