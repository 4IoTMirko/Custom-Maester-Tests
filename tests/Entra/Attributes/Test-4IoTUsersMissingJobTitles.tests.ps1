BeforeAll {
    . $PSScriptRoot/Test-4IoTUsersMissingJobTitles.ps1
}

    
Describe "4IoT" -Tag "ENTRA.UA.1002", "Entra", "CustomTests", "Users" {    
    It "ENTRA.UA.1002: Job Title Attribute - All users should have a job title set" {
        $result = Test-4IoTUsersMissingJobTitles
        $result | Should -Be $true -Because "All users should have a job title assigned."
    }
}