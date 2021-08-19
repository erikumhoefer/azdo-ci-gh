"current location: $(Get-Location)"
"script root: $PSScriptRoot"
"retrieve available modules"
$modules = Get-Module -list
if ($modules.Name -notcontains 'pester') {
    Install-Module -Name Pester -Force -SkipPublisherCheck
}

$testResults = Invoke-Pester -Script "./Tests/" -PassThru
if ($testResults.FailedCount -gt 0)
{
    throw "Pester unit tests failed."
}

Write-Host "All Pester tests successful!"