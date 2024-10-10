#This script connects to Microsoft Graph, removes the all licenses on Office 365 Users and allows the desired license to be assigned.

#Modules installation command "Install-Module Microsoft.Graph.Users.Actions", "Install-Module Microsoft.Graph.Identity.DirectoryManagement".

#Module installation internal assignment "Import-Module Microsoft.Graph.Users.Actions", "Import-Module Microsoft.Graph.Identity.DirectoryManagement".

#First, the "UserPrincipalNames" of the users should be extracted to a CSV and "UserPrincipalName" should be given as the title.

#Second, Get your License SKUID using "Get-MgSubscribedSku" to find the "SkuId" information of the license to be assigned.

#Third, After you get your "SkuId" add to Lines "23-39-42" 

#On this script, I used the license of M365EDU_A3_FACULTY for example.

#In Graph connections, Powershell may not work if you start it as "As Administrator". You need to open it without Administrator.

# 1. Office 365 Graph Connection
Connect-MgGraph -Scopes "User.ReadWrite.All"
 
# 2. The license information to be assigned (New license) can be fetched using "Get-MgSubscribedSku" to find the "SkuId" information of the license to be assigned.
$addLicenses = @(
    [Microsoft.Graph.PowerShell.Models.MicrosoftGraphAssignedLicense]@{
        SkuId = "Add Your SkuId"  # Add your license SkuID which you wanna assign.For Example Service Plan Name: M365EDU_A3_FACULTY
    }
)
 
# 3. Read CSV file with users
$csvPath = "C:\Example.csv"  # Full path to CSV file
$userList = Import-Csv -Path $csvPath
 
# 4. Update licenses for each user
foreach ($user in $userList) {
    $userId = $user.UserPrincipalName
 
    # Retrieve user's existing licenses
    $currentLicenses = Get-MgUserLicenseDetail -UserId $userId
 
    # Check the license "M365EDU_A3_FACULTY" in the available licenses
    $hasTargetLicense = $currentLicenses | Where-Object { $_.SkuId -eq "Add SKU ID here" }
 
    # License removal process
    $removeLicenses = $currentLicenses | Where-Object { $_.SkuId -ne "Add SKU ID here" } | Select-Object -ExpandProperty SkuId
 
    # Update licenses
    if ($removeLicenses) {
        Set-MgUserLicense -UserId $userId -RemoveLicenses $removeLicenses -AddLicenses $addLicenses
        Write-Host "$userId has been updated."
    } else {
        Write-Host "$userId has already the same license. Other License has been removed."
    }
}
 
Write-Host "All licenses proccess has finished!"