8.1
8.1.1 
  PS C:\Users\Administrator.VT17_2>    Get-Content C:\temp\address.txt
Gråstensvägen 2
18734 Täby

8.1.2
$address = Get-Content C:\temp\address.txt

   PS C:\> $address
Gråstensvägen 2 18734 Täby

8.1.3
$body=@"                            
Name:  $item["Employee"]
Depart: $item["Depart"]
Region: $item["Region"]
Manager: $item["Manager"]                         
"@

8.1.4
$myname = "Mohammad.Zohouri"
$myname | gm
$myname.ToUpper()

PS C:\Users\Administrator\Documents> $myname.ToUpper()
MOHAMMAD.ZOHOURI