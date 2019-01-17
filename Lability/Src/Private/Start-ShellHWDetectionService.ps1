function Start-ShellHWDetectionService {
<#
    .SYNOPSIS
        Starts the ShellHWDetectionService - if present!
#>
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    param ( )
    process {

        if (Get-Service -Name 'ShellHWDetection' -ErrorAction SilentlyContinue) {

            Start-Service -Name 'ShellHWDetection' -ErrorAction Ignore -Confirm:$false;
        }

    } #end process
} #end function Start-ShellHWDetectionService
