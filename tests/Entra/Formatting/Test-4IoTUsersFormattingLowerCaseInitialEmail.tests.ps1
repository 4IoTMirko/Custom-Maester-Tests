
BeforeAll {
    . "$PSScriptRoot\Test-4IoTUsersFormattingLowerCaseInitialEmail.ps1"
}

Describe "4IoT" -Tag "ENTRA.UF.1003.T02.Email", "LowerCaseEmail" {
    It "ENTRA.UF.1003.T02.Email: All user emails must be lowercase first initial + last name" {
        $result = Test-4IoTUsersFormattingLowerCaseInitialEmail
        $result | Should -Be $true -Because "User emails must follow the lowercase initial + last name format."
    }
}