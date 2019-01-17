function Set-ConfigurationData {
<#
    .SYNOPSIS
        Saves lab configuration data.
#>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([System.Management.Automation.PSCustomObject])]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess','')]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('Host','VM','Media','CustomMedia')]
        [System.String] $Configuration,

        [Parameter(Mandatory, ValueFromPipeline)]
        [System.Object] $InputObject
    )
    process {

        $configurationPath = Resolve-ConfigurationDataPath -Configuration $Configuration;
        [ref] $null = New-Directory -Path (Split-Path -Path $configurationPath -Parent) -Verbose:$false;
        Set-Content -Path $configurationPath -Value (ConvertTo-Json -InputObject $InputObject -Depth 5) -Force -Confirm:$false;

    } #end process
} #end function Set-ConfigurationData
