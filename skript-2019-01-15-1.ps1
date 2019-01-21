# Making a root certifikat for the current user.
$cert = New-SelfSignedCertificate -Subject "My Code Signing Certificate” -Type CodeSigningCert -CertStoreLocation Cert:\CurrentUser\My

#Creating a file for test av certificate.

  New-Item c:\temp\certificate.ps1 -ItemType file
  add-Content -Value 'echo "This is a certificate file....."' C:\temp\certificate.ps1

# Saving the signature in file certifikat.ps1.
 Set-AuthenticodeSignature -FilePath C:\temp\certificate.ps1 -Certificate $cert
 
 # Exporting Root Certificate to file Mitt-rootCA.
 Export-Certificate -Cert $cert -FilePath "C:\temp\My-rootCA.crt"
 
 # Importing certificate from file to LocalMachine .
 Import-Certificate -CertStoreLocation 'Cert:\LocalMachine\Root' -FilePath "C:\temp\My-rootCA.crt"

#Seting Restriction for execuring certificate.ps1 file. Changing policy to unretricted will allow you to run the script.
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Restricted -Force
