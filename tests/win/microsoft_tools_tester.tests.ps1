Param(
    [String]
    $File
)

BeforeDiscovery {
    $Hiera = Get-HieraRoleData -Path $File
}

## Skip if this is run on a builder
Describe "Microsoft Tools - Tester" {
    BeforeAll {
        $Directories = Get-WinFactsDirectories
    }
    It "<_.DisplayName> is installed" -ForEach @(
        Show-Win10SDK
    ) {
        $PSItem.DisplayName -in $Names | Should -Not -Be $null
    }
    It "<_.DisplayName> is 10.1.19041.685" -ForEach @(
        Show-Win10SDK
    ) {
        $PSItem.DisplayVersion | Should -Be "10.1.22621.1778"
    }
    It "<_.DisplayName> is installed" -ForEach @(
        Show-WinDotNet48
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 4.8.04084" -ForEach @(
        Show-WinDotNet48
    ) {
        $_.DisplayVersion | Should -Be "4.8.09032"
    }
    It "<_.DisplayName> is installed" -ForEach @(
        Show-vcc2019
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 14.26.28720" -ForEach @(
        Show-vcc2019
    ) {
        $_.DisplayVersion | Should -Be "14.26.28720"
    }
    It "<_.DisplayName> is installed" -ForEach @(
        Show-Win10SDKAddon
    ) {
        $_.DisplayName |  Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.0.0" -ForEach @(
        Show-Win10SDKAddon
    ) {
        $_.DisplayVersion | Should -Be 10.1.0.0
    }
}