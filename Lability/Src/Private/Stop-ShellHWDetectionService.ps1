function Stop-ShellHWDetectionService {
<#
    .SYNOPSIS
        Stops the ShellHWDetectionService - if present!
#>
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    param ( )
    process {

        if (Get-Service -Name 'ShellHWDetection' -ErrorAction SilentlyContinue) {

            Stop-Service -Name 'ShellHWDetection' -Force -ErrorAction Ignore -Confirm:$false;
        }

    } #end process
} #end function Stop-ShellHWDetectionService
