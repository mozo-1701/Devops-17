#11.2
# Väntar på födelse datum som input i formatet yyyy-mm-dd.
$birthday = Read-Host "Please enter your birthday:"

$BTD = Get-Date -Date $birthday
$today = Get-Date
#Här räknar man hur gammal man är.
$calculatetime = $today - $BTD
#Här skriver den ut som seconds, minutes,hours and miliseconds.
$calculatetime