#This script connects to Microsoft Graph, get users from selected license who has on Office 365 Users.

#Modules installation command "Install-Module Microsoft.Graph.Users.Actions", "Install-Module Microsoft.Graph.Identity.DirectoryManagement".

#Module installation internal assignment "Import-Module Microsoft.Graph.Users.Actions", "Import-Module Microsoft.Graph.Identity.DirectoryManagement".

#First, Get your License SKUID using "Get-MgSubscribedSku" to find the "SkuId" information of the license to be assigned.

#Second, After you get your "SkuId" add to Lines "17" 

#In Graph connections, Powershell may not work if you start it as "As Administrator". You need to open it without Administrator.

# 1. Office 365 Graph Connection
Connect-MgGraph -Scopes "User.ReadWrite.All"

# 2. The license information 
$Licenses =  @("Add your SkuId") # Add your license SkuID which you wanna check.For Example Service Plan Name: M365EDU_A3_FACULTY

$User = Get-MgUser -All | Select-Object -ExpandProperty Userprincipalname
# 4. Get licenses for users
Get-MgUserLicenseDetail -UserId $User | where {$_.SkuId -eq $Licenses } | Export-Csv -Path "C:\Example.csv" -NoTypeInformation -Append