
BeforeAll {
    . "$PSScriptRoot\Test-4IoTUsersFormattingCapitalInitialEmail.ps1"
}

Describe "4IoT" -Tag "ENTRA.UF.1003.T01.Email", "Entra", "CustomTests", "Formatting", "Users" {
    It "ENTRA.UF.1003.T01.Email: Must be Capital First Initial and Last Name with First Letter Capitalized" {
        $result = Test-4IoTUsersFormattingCapitalInitialEmail
        $result | Should -Be $true -Because "All user emails must follow the capital-initial format."
    }
}