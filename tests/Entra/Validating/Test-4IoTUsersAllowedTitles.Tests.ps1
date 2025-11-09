BeforeAll {
    . "$PSScriptRoot/Test-4IoTUsersAllowedTitles.ps1"
}

Describe "4IoT" -Tag "ENTRA.UV.1008", "Entra", "CustomTests", "Validation", "Users", "Title" {
    It "ENTRA.UV.1008: Title - All users should have a valid title" {
        $result = Test-4IoTUsersAllowedTitles
        $result | Should -Be $true -Because "All users must have a title from the valid list."
    }
}
