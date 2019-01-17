function Test-LabVM {
<#
    .SYNOPSIS
        Checks whether the (external) lab virtual machine is configured as required.
#>
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (
        ## Specifies the lab virtual machine/node name.
        [Parameter(ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [System.String[]] $Name,

        ## Specifies a PowerShell DSC configuration document (.psd1) containing the lab configuration.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [System.Collections.Hashtable]
        [Microsoft.PowerShell.DesiredStateConfiguration.ArgumentToConfigurationDataTransformationAttribute()]
        $ConfigurationData
    )
    process {

        if (-not $Name) {

            $Name = $ConfigurationData.AllNodes | Where-Object NodeName -ne '*' | ForEach-Object { $_.NodeName }
        }

        foreach ($vmName in $Name) {

            $isNodeCompliant = $true;
            $node = Resolve-NodePropertyValue -NodeName $vmName -ConfigurationData $ConfigurationData;
            Write-Verbose -Message ($localized.TestingNodeConfiguration -f $node.NodeDisplayName);

            Write-Verbose -Message ($localized.TestingVMConfiguration -f 'Image', $node.Media);
            if (-not (Test-LabImage -Id $node.Media -ConfigurationData $ConfigurationData)) {

                $isNodeCompliant = $false;
            }
            else {

                ## No point testing switch, vhdx and VM if the image isn't available
                Write-Verbose -Message ($localized.TestingVMConfiguration -f 'Virtual Switch', $node.SwitchName);
                foreach ($switchName in $node.SwitchName) {

                    if (-not (Test-LabSwitch -Name $switchName -ConfigurationData $ConfigurationData)) {

                        $isNodeCompliant = $false;
                    }
                }

                Write-Verbose -Message ($localized.TestingVMConfiguration -f 'VHDX', $node.Media);
                $testLabVMDiskParams = @{
                    Name = $node.NodeDisplayName;
                    Media = $node.Media;
                    ConfigurationData = $ConfigurationData;
                }
                if (-not (Test-LabVMDisk @testLabVMDiskParams -ErrorAction SilentlyContinue)) {

                    $isNodeCompliant = $false;
                }
                else {

                    ## No point testing VM if the VHDX isn't available
                    Write-Verbose -Message ($localized.TestingVMConfiguration -f 'VM', $vmName);
                    $testLabVirtualMachineParams = @{
                        Name = $node.NodeDisplayName;
                        SwitchName = $node.SwitchName;
                        Media = $node.Media;
                        StartupMemory = $node.StartupMemory;
                        MinimumMemory = $node.MinimumMemory;
                        MaximumMemory = $node.MaximumMemory;
                        ProcessorCount = $node.ProcessorCount;
                        MACAddress = $node.MACAddress;
                        SecureBoot = $node.SecureBoot;
                        GuestIntegrationServices = $node.GuestIntegrationServices;
                        ConfigurationData = $ConfigurationData;
                    }
                    if (-not (Test-LabVirtualMachine @testLabVirtualMachineParams)) {

                        $isNodeCompliant = $false;
                    }
                }
            }

            Write-Output -InputObject $isNodeCompliant;

        } #end foreach vm

    } #end process
} #end function Test-LabVM
