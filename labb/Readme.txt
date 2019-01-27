#Read.me
Ralpje metoden används för att skapa en automatisk lab miljö .


1- På HOST (värd) datorn ska läggas till rollerna:

Hyper-V
AD DS
DNS

2- Enligt metoden skapas en switch först . Sedan skapar man 4 nya VMar.
Scriptet skapalabb-2019-01-17a ska köras på Host datorn vilken i sin tur kör två scripter 
(switch.ps1 och install-VM.ps1)
 
 ps C:\> powershell c:\temp\lab\skapalabb-2019-01-17a.ps1


3- Sedan ska VM delen som heter skapalabb-2019-01-17b.ps1  köras som i sin tur startar 3 scripter
(install-AD-Skog.ps1, make-OU.ps1 och add-user.ps1) 

install-AD-Skog.ps1 och de två andra scripterna körs från VM-1 för att VM-1 maskinen ska bli en DC-controller
för alla VMar i lab miljön. Samt för att skapa en skog för lab-miljö domainen "local.com".

Logga in på VM-1 med administrator kontot LOCAL\Administrator och Linux4Ever . Kopiera scripterna skapalabb-2019-01-17b.ps1, user-account.csv,
install-AD-Skog.ps1, make-OU.ps1 och add-user.ps1 från Värd datorn till VM-1.
Kör scriptet:

ps C:\> powershell C:\temp\lab\skapalabb-2019-01-17b.ps1

Jag har hunnit så längt med labbmiljö automation scriptet som skapar 4 VMar med VM-1 som DC-controller
och en OU som heter LAB med 3 under OU (Computer, users och Groups) samt skapas 20 användare från 
C:\temp\lab\user-account.csv fil .
 










