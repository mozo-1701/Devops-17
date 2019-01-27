#install-AD-Skog.ps1 scriptet körs från VM-1 för att VM-1 maskinen blir en DC-controller
#för alla VMar i lab miljön. Samt för att skapa en skog för lab-miljö domainen "local.com".

 powershell C:\temp\lab\install-AD-Skog
 Start-Sleep -Seconds 10

# make-OU.ps1 skapar en Organisation Unit med namn LAB under OUerna Computer, Users, Groups.


powershrell C:\temp\lab\make-OU.ps1
Start-Sleep -Seconds 10

# add-user.ps1 skapar 20 användare from filen C:\temp\lab\user-account.csv som ligger på VM1 .

 C:\temp\lab\add-user.ps1
 Start-Sleep -Seconds 10