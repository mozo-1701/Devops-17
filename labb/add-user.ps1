$csv = Import-Csv C:\temp\lab\user-account.csv
foreach ($i in $csv) {

New-ADUser -Surname $i.LastName  -GivenName $i.FirstName -SamAccountName $i.username -Organization $i.OU

}