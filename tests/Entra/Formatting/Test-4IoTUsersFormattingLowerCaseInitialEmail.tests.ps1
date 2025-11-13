
BeforeAll {
    . "$PSScriptRoot\Test-4IoTUsersFormattingLowerCaseInitialEmail.ps1"
}

Describe "4IoT" -Tag "ENTRA.UF.1003.T02.Email", "LowerCaseNameCapitalCaseInitialEmail" {
    It "ENTRA.UF.1003.T02.Email: All user emails must be lowercase first name + last name with capital initial" {
        $result = Test-4IoTUsersFormattingLowerCaseInitialEmail
        $result | Should -Be $true -Because "User emails must follow the lowercase first + last name with capital initial format."
    }
}