


Skriv in två grönsaker dubbelt i listan.
Sortera listan i bokstavsordning och med unikt förekommande grönsaker.
Presentera de olika grönsakerna.
Och lägg in en slutrad med hur många unika grönsaker listan innehåller.

#Skapar en lista med fem olika grönsaker.
$myList = "Timjan", "Dill", "Sparris", "Brokolli", "Selleri"

#Skapar en fil "C:\temp\gronsaker.txt"
New-Item -Path C:\temp\gronsaker.txt -ItemType File

Skriver in två grönsaker dubbelt i listan.
$newList = "Timjan","Dill","Sparris","Brokolli","Selleri","Timjan","Dill"

Sorterar listan i bokstavsordning och med unikt förekommande grönsaker.
$subList = ( $newList | sort|Get-Unique)

#Presenterar de olika grönsakerna.
Set-Content C:\temp\gronsaker.txt 'Det olika grönsakerna är:'

#lägger in en slutrad med hur många unika grönsaker listan innehåller.
Add-Content C:\temp\gronsaker.txt $sublist
add-Content  C:\temp\gronsaker.txt $subList.Count