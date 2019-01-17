function Invoke-LabMediaDownload {
<#
    .SYNOPSIS
        Downloads resources.
    .DESCRIPTION
        Initiates a download of a media resource. If the resource has already been downloaded and the checksum
        is correct, it won't be re-downloaded. To force download of a ISO/VHDX use the -Force switch.
    .NOTES
        ISO/WIM media is downloaded to the default IsoPath location. VHD(X) files are downloaded directly into the
        ParentVhdPath location.
#>
    [CmdletBinding()]
    [OutputType([System.IO.FileInfo])]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.String] $Id,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [System.String] $Uri,

        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [System.String] $Checksum,

        [Parameter(ValueFromPipelineByPropertyName)]
        [System.Management.Automation.SwitchParameter] $Force
    )
    process {

        $hostDefaults = Get-ConfigurationData -Configuration Host;
        $destinationPath = Join-Path -Path $hostDefaults.HotfixPath -ChildPath $Id;
        $invokeResourceDownloadParams = @{
            DestinationPath = $destinationPath;
            Uri = $Uri;
        }
        if ($Checksum) {

            [ref] $null = $invokeResourceDownloadParams.Add('Checksum', $Checksum);
        }

        [ref] $null = Invoke-ResourceDownload @invokeResourceDownloadParams -Force:$Force;
        return (Get-Item -Path $destinationPath);

    } #end process
} #end function
