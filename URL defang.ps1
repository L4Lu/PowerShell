<# Check if the URL is defanged or original. Convert the defanged URL to its original form or convert the original URL to its defanged form. #>

$url = Read-Host "Please enter the URL"

if ($url -match "hxxps" -or $url -match "\[\.\]") {
    $originalUrl = $url -replace "hxxps", "https" -replace "\[\.\]", "."
    Write-Host ""
    Write-Host "Proceed with caution:"
    Write-Host $originalUrl
} else {

    $defangedUrl = $url -replace "https", "hxxps" -replace "\.", "[.]"
    Write-Host ""
    Write-Host "Defanged URL:"
    Write-Host $defangedUrl
}
