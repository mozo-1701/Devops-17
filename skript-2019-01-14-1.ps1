#Skapar en katalog "C:\temp".
New-Item -Path C:\temp -ItemType Directory

#Skapar en fil i  katalog med namnet "test.txt".
New-Item -Path 'C:\temp\test.txt' -ItemType File

#Lägger till dagens datum  i test.txt.
Set-Content C:\temp\test.txt  (Get-date)

#Lägger in texten "Välkommen till Nackademin" i test.txt.
add-Content -Value 'Välkommen till Nackademin' C:\temp\test.txt

#Radera innehållet i filen.
Clear-Content C:\temp\test.txt

#Lägger in texten "Välkommen till Nackademin" i test.txt.
Set-Content C:\temp\test.txt 'Välkommen till Nackademin'

#Lägg till dagens datum i test.txt.
add-Content -Value (Get-Date)  C:\temp\test.txt