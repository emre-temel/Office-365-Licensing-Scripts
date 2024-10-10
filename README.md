The scripts for everyone which I use on my customers. The scripts you can use on your office 365 with safety. Sometime we need to change license on bulk users and but GUI wont allow properly to change. Here the my scripts details. For every scripts before execute, please test on pilot users.

Every scripts has their own Readme before execute codes. On scripts readme, you will see the modules which you have to install and import. Please install module before execute. Some scripts import users information from CSV. Cause of this, you can use "ExportUsersToCsv.ps1" for export UserprincipalName. Export script modeled for other scripts. You can export and use on other scripts.

ExportUsersToCSV = You can export users who has license and export to CSV. You are gonna need that if you execute AddLicenseToUsersFromCSV, RemoveLicenseToUsersFromCSV and RemoveExistLicenseandAddNewOnefromCSV.

ExportUsersFromSpecificLicense = You can export users who has specific license which you wanna see and Export to CSV.

DeleteLicenseFromEveryone = Before you execute please test. With you license SkuId, you can delete license on all users who has.

AddLicenseToUsersFromCSV = Assign your license on users from CSV. 

RemoveLicenseToUsersFromCSV = Unassing your license on users from CSV.

RemoveExistLicenseandAddNewOnefromCSV = Replace your license. This script only assign your chosen license and remove other license on users.
