#Skapar en fil "C:\temp\test2.txt"
New-Item -Path C:\temp\test2.txt -ItemType File

#Lägg in aktuell tid i filen.
set-Content -Value (Get-Date)  C:\temp\test2.txt

#Lägger in texten "Välkommen hem" i filen.
add-Content C:\temp\test2.txt 'Välkommen hem'

#Jämför filerna test.txt med test2.txt 
Compare-Object -ReferenceObject $(Get-Content C:\temp\test.txt) -DifferenceObject $(Get-Content C:\temp\test2.txt)