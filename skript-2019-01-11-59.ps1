
5.9.1
    $a = 3
     Write-Host $a
	3 
	 
  5.9.2
  $a.GetType()
  
IsPublic IsSerial Name                                     BaseType                                                   
-------- -------- ----                                     --------                                                   
True     True     Int32                                    System.ValueType                                           
  

  5.9.3
   $b = 3.3
     Write-Host $b 
	 PS C:\Users\Administrator.VT17_2> $b = 3.3
     Write-Host $b
     3,3
    
	 IsPublic IsSerial Name                                     BaseType                                                   
-------- -------- ----                                     --------                                                   
True     True     Int32                                    System.ValueType                                           

  5.9.4
  $b.GetType()	 
	 
IsPublic IsSerial Name                                     BaseType                                                   
-------- -------- ----                                     --------                                                   
True     True     Double                                   System.ValueType 
  
  5.9.5
  $c = 3.3
  Write-Host $c
  
  PS C:\Users\Administrator.VT17_2>  $c = 3.3
  Write-Host $c
3,3
	  
  5.9.6 PS C:\Users\Administrator.VT17_2> $c.GetType()

IsPublic IsSerial Name                                     BaseType                                                   
-------- -------- ----                                     --------                                                   
True     True     Double                                   System.ValueType  

  5.9.7 
  $a = 3
   $b = 3.3
   $d=$a + $b
   Write-Host $d
 
IsPublic IsSerial Name                                     BaseType                                                   
-------- -------- ----                                     --------                                                   
True     True     Double                                   System.ValueType   
  
 5.9 8
     $a = 3.4
     $b = 3.3
     $d=$a + $b
     Write-Host $d
	 
	 PS C:\Users\Administrator.VT17_2>
	 $a = 3.4
     $b = 3.3
     $d=$a + $b
     Write-Host $d
     6,7
 