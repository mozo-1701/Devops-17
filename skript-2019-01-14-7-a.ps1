#This script will print out first total Warrnings and Errors numbers from system log, then it will show 
#Warrnings and Errors from last 24 hour, then the Uniqe count of them. If the total Warrnings and Errors are 
#more than 10, a warning text will be print out.
# Creating head style
$Head = @"
  
<style>
  body {
    font-family: "Arial";
    font-size: 8pt;
    color: #4C607B;
    }
  th, td { 
    border: 1px solid #e57300;
    border-collapse: collapse;
    padding: 5px;
    }
  th {
    font-size: 1.2em;
    text-align: left;
    background-color: #003366;
    color: #ffffff;
    }
  td {
    color: #000000;
    }
  .even { background-color: #ffffff; }
  .odd { background-color: #bfbfbf; }
</style>
  
"@
 
# Creating body
$count = Get-Eventlog -LogName "System" -EntryType Error, Warning  | measure 

#printing out the result from $count.
echo "There is" $count "Warrnings and Errors from system log "  | Out-File  -FilePath  C:\temp\result.html 

#Printing Error and Warnings from the last 24 hours to file C:\temp\result.html.
Get-Eventlog -LogName "System" -EntryType Error, Warning   -After (Get-Date).AddDays(-1) | ConvertTo-HTML -head $Head -Body "<font color=`"Black`"><h4>User info report</h4></font>" | Out-File  -FilePath  C:\temp\result.html

#Printing out the result of Unique Errors and Warnings in the last 100 message of type Error and Warnings.
Get-Eventlog -LogName "System" -EntryType Error, Warning  -Newest 100 |Group-Object -Property EntryType | ConvertTo-HTML -head $Head -Body "<font color=`"Black`"><h4>User info report</h4></font>" | Out-File  -FilePath  C:\temp\result.html -Append

# If the total of Error and Warnins are more than 10, it will echo a Warning text.
if ( $count.Count -gt 10 )
{
echo " Warrning! ##### There is more than 10 Errors and Warrnings in systemlog" 

} 

