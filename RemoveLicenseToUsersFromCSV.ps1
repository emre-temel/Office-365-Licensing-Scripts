#This script connects to Microsoft Graph, remove license on Office 365 Users.

#Modules installation command "Install-Module Microsoft.Graph.Users.Actions", "Install-Module Microsoft.Graph.Identity.DirectoryManagement".

#Module installation internal assignment "Import-Module Microsoft.Graph.Users.Actions", "Import-Module Microsoft.Graph.Identity.DirectoryManagement".

#First, the "UserPrincipalNames" of the users should be extracted to a CSV and "UserPrincipalName" should be given as the title. You can export with "ExportUsersToCsv.ps1" named script. 

#Second, Get your License SKUID using "Get-MgSubscribedSku" to find the "SkuId" information of the license to be assigned.

#Third, After you get your "SkuId" add to Lines "21" 

#On this script, I used the license of M365EDU_A3_FACULTY for example.

#In Graph connections, Powershell may not work if you start it as "As Administrator". You need to open it without Administrator.

# 1. Office 365 Graph Connection
Connect-MgGraph -Scopes "User.ReadWrite.All"
 
# 2. The license information to be assigned (New license) 
$removeLicenses =  @("Add Your SkuId") # Add your license SkuID which you wanna assign.For Example Service Plan Name: M365EDU_A3_FACULTY
 # 3. Read CSV file with users
$csvPath = "C:\Example.csv"  # Full path to CSV file
$userList = Import-Csv -Path $csvPath

# 4. Remove licenses for each user
foreach ($user in $userList) {
    $userId = $user.UserPrincipalName
    Set-MgUserLicense -UserId $userId -RemoveLicenses $removeLicenses  -AddLicenses @()
     Write-Host "The license has been removed on $userId "
    
    }

   