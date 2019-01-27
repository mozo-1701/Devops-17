10.4

# Ett tabel med namn och födelse datum.
$pops =@{"Daniel"=971226; "Mats" =481110; "Göran" =920926; "Mike" =750625}

# Här väntar man för ett input från standard input.
 $name = Read-Host "Please enter your name"

$a = $pops.($name)
#Skriver ut födelse datum på standard output.
Out-Host -InputObject $a