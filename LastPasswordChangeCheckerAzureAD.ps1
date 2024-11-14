# Last Password Change checker for AAD accounts:

Connect-MsolService
# Login as admin

$userFile = "C:\Users\user\Downloads\users.txt"
$outputFile = "C:\Users\user\Downloads\output.csv"
# Create a CSV header 
$csv = @("UserPrincipalName,LastPasswordChangeTimeStamp")
$users = Get-Content -Path $userFile

foreach ($user in $users) { # Get the user's information
    $userInfo = Get-MsolUser -UserPrincipalName $user | Select-Object UserPrincipalName, LastPasswordChangeTimeStamp 
    # Format the user information as a CSV row 
    $csvRow = "$($userInfo.UserPrincipalName),$($userInfo.LastPasswordChangeTimeStamp)"
    # Add the CSV row to the array 
    $csv += $csvRow
}

# Write the CSV content to the file
$csv | Set-Content -Path $outputFile
Write-Output "User data has been saved to $outputFile"
