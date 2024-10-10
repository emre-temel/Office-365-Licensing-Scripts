#This Script Connects to MSOL Service and allows you export who has license assigned and their "Users Principal Name" to CSV

#Module installation command "Install-Module MsOnline".

#Module installation internal assignment "Import-Module MsOnline".

# 1. Office 365 MsolService Connection
Connect-MsolService 

# 2. Get Users who has License
$LicensedUsers = Get-MsolUser | Where-Object { $_.isLicensed -eq $true }

# 3. Select UserPrincipalName and Export to CSV
$LicensedUsers | Select-Object UserPrincipalName | Export-Csv -Path "C:\Example.csv" -NoTypeInformation