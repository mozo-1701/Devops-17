function Get-LabVMDisk {
<#
    .SYNOPSIS
        Retrieves lab virtual machine disk (VHDX) if present.
    .DESCRIPTION
        Gets a VM disk configuration using the xVHD DSC resource.
#>
    [CmdletBinding()]
    param (
        ## VM/node name
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.String] $Name,

        ## Media Id
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [System.String] $Media,

        ## Lab DSC configuration data
        [Parameter(ValueFromPipelineByPropertyName)]
        [System.Collections.Hashtable]
        [Microsoft.PowerShell.DesiredStateConfiguration.ArgumentToConfigurationDataTransformationAttribute()]
        $ConfigurationData
    )
    process {

        $hostDefaults = Get-ConfigurationData -Configuration Host;

        if ($PSBoundParameters.ContainsKey('ConfigurationData')) {

            $image = Get-LabImage -Id $Media -ConfigurationData $ConfigurationData;
        }
        else {

            $image = Get-LabImage -Id $Media;
        }

        $vhd = @{
            Name = $Name;
            Path = $hostDefaults.DifferencingVhdPath;
            ParentPath = $image.ImagePath;
            Generation = $image.Generation;
        }
        Import-LabDscResource -ModuleName xHyper-V -ResourceName MSFT_xVHD -Prefix VHD;
        Get-LabDscResource -ResourceName VHD -Parameters $vhd;

    } #end process
} #end function
