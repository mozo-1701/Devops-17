
#2019-01-16-a . En lista kommando 
#Utifrån artikeln https://www.business.com/articles/powershell-active-directory-cmdlets/

Get-ADDomain
Get-Command -Verb Get -Module ActiveDirectory
Get-ADUser danborg
Get-ADUser -Filter 'SamAccountName -eq "danborg"'
Get-Help Get-ADUser -Parameter filter
Get-ADComputer $env:COMPUTERNAME | Get-ADPrincipalGroupMembership

#  Creating And Working With Users 


"TestQAGroup","TestManagersGroup","TestDevGroup","TestAdministrators" |

   ForEach-Object {New-ADGroup -Name $_ -GroupScope Global}

$names = "Alan Turing","Grace Hopper"
$departments = "Test","Dev","QA"
Foreach($name in $names) {
    Foreach($department in $departments) {
          $usernames = "{0}{1}" -f $name.Substring(0,1), $name.Split()[1]
          $user = New-ADUser -GivenName $name.split()[0]
                             -Surname $name.sname.split()[1
                             -Name "$name$department
                             -AccountPassword (ConvertT-SecureString) -String "Changeme1!" -AsPlainText -Force"
                             -Department $department
                             -UserPrincipalName "username$department@ADTestDomain.com"
                             -SamAccountName "$$username$department"
                             -PassThru

          Get-ADGroup -filter 'name -like "test"' |  Add-ADGroupMember -Members $user

  }
}    


Get-ADGroupMember -Identity TestDevGroup | Format-Table Name,SamAccountName

Remove-ADUserGhopperQA

Enable-ADAccountATuringQA

Remove-ADGroupMember -Identity testAdministrators -Members ATuringTest

$members = Get-ADUser -Filter 'department -eq "dev"  -or department -eq "test"'
Remove-ADGroupMember -Identity testAdministrators -Members $members

Get-Help Remove-ADGroup -Parameter members

Get-ADPrincipalGroupMembership -Identity ghoppertest

Get-ADUser -Filter 'givenname -eq "alan"  -or givenname -eq "grace"' | Get-ADPrincipalGroupMembership | Format-Table name,SamAccountName

$reportData = Foreach($group in (Get-ADGroup -filter 'name -like "test"')) {
              Foreach($member in (Get-ADGroupMember $group )) {
                   New-Object -TypeName PSobject -Property @{group=$group.Name;member=$member.name}
              }
           }
$reportData  | Out-GridView -Title MembershipReport