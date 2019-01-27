#11.4
#Läser tabelen från C:\temp\import.csv

$element = Get-content "C:\temp\import.csv"
# Här går den genom kolumn för kolumn och tillsist om 
for ($count = 1; $count -lt $element.Length; $count++)
{
    $col0 = ([string]$element[$count]).Split(',')[0]
	$col1 = ([string]$element[$count]).Split(',')[1]
    $col2 = ([string]$element[$count]).Split(',')[2]
    $col3 = ([string]$element[$count]).Split(',')[3]
	# om värde på col2 och col3 är lika, då ska den skriva namnet på element.
        if ($col2 -eq $col3)
            {echo $col0}
}