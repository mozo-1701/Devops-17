function Reset-LabVMDisk {
<#
    .SYNOPSIS
        Removes and resets lab VM disk file (VHDX) configuration.
#>
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    param (
        ## VM/node display name
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.String] $Name,

        ## Media Id
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [System.String] $Media,

        ## VM/node name
        [Parameter(ValueFromPipelineByPropertyName)]
        [System.String] $NodeName = $Name,

        ## Lab DSC configuration data
        [Parameter(ValueFromPipelineByPropertyName)]
        [System.Collections.Hashtable]
        [Microsoft.PowerShell.DesiredStateConfiguration.ArgumentToConfigurationDataTransformationAttribute()]
        $ConfigurationData
    )
    process {

        $null = $PSBoundParameters.Remove('NodeName');

        Remove-LabVMSnapshot -Name $Name;
        Remove-LabVMDisk -NodeName $NodeName @PSBoundParameters;
        Set-LabVMDisk @PSBoundParameters;

    } #end process
} #end function
