# För att skapa en switch först.
 
 powershell C:\temp\lab\switch.ps
 Start-Sleep -Seconds 10

# install-VM  ska köras för att importera scriptet C:\temp\lab\new-labvm.psm1. Sedan skapar den 4  nya VMar
 # med fast IP adress.

 powershell C:\temp\lab\install-VM
 Start-Sleep -Seconds 10