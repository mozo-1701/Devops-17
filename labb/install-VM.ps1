Import-Module C:\temp\lab\new-labvm.psm1
New-LabVM -VMName VM-1 -VMIP 10.11.12.24 -GWIP 10.11.12.1 -Diskpath c:\temp\ -ParentDisk E:\MASTER.vhdx
New-LabVM -VMName VM-2 -VMIP 10.11.12.25 -GWIP 10.11.12.1 -Diskpath c:\temp\ -ParentDisk E:\MASTER.vhdx
New-LabVM -VMName VM-3 -VMIP 10.11.12.26 -GWIP 10.11.12.1 -Diskpath c:\temp\ -ParentDisk E:\MASTER.vhdx
New-LabVM -VMName VM-4 -VMIP 10.11.12.27 -GWIP 10.11.12.1 -Diskpath c:\temp\ -ParentDisk E:\MASTER.vhdx
