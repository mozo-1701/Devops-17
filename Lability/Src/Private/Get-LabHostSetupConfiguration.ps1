function Get-LabHostSetupConfiguration {
<#
    .SYNOPSIS
        Returns an array of hashtables defining the desired host configuration.
    .DESCRIPTION
        The Get-LabHostSetupConfiguration function returns an array of hashtables used to determine whether the
        host is in the desired configuration.
    .NOTES
        The configuration is passed to avoid repeated calls to Get-LabHostDefault and polluting verbose output.
#>
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param ( )
    process {
        [System.Boolean] $isDesktop = (Get-CimInstance -ClassName Win32_OperatingSystem -Verbose:$false).ProductType -eq 1;
        ## Due to the differences in client/server deployment for Hyper-V, determine the correct method before creating the host configuration array.
        $labHostSetupConfiguration = @();

        if ($isDesktop) {

            Write-Debug -Message 'Implementing desktop configuration.';
            $labHostSetupConfiguration += @{
                UseDefault = $true;
                Description = 'Hyper-V role';
                ModuleName = 'PSDesiredStateConfiguration';
                ResourceName = 'MSFT_WindowsOptionalFeature';
                Prefix = 'WindowsOptionalFeature';
                Parameters = @{
                    Ensure = 'Enable';
                    Name = 'Microsoft-Hyper-V-All';
                }
            };
        }
        else {

            Write-Debug -Message 'Implementing server configuration.';
            $labHostSetupConfiguration += @{
                UseDefault = $true;
                Description = 'Hyper-V Role';
                ModuleName = 'PSDesiredStateConfiguration';
                ResourceName = 'MSFT_RoleResource';
                Prefix = 'WindowsFeature';
                Parameters = @{
                    Ensure = 'Present';
                    Name = 'Hyper-V';
                    IncludeAllSubFeature = $true;
                }
            };
            $labHostSetupConfiguration += @{
                UseDefault = $true;
                Description = 'Hyper-V Tools';
                ModuleName = 'PSDesiredStateConfiguration';
                ResourceName = 'MSFT_RoleResource';
                Prefix = 'WindowsFeature';
                Parameters = @{
                    Ensure = 'Present';
                    Name = 'RSAT-Hyper-V-Tools';
                    IncludeAllSubFeature = $true;
                }
            };
        } #end Server configuration

        $labHostSetupConfiguration += @{
            ## Check for a reboot before continuing
            UseDefault = $false;
            Description = 'Pending reboot';
            ModuleName = 'xPendingReboot';
            ResourceName = 'MSFT_xPendingReboot';
            Prefix = 'PendingReboot';
            Parameters = @{
                Name = 'TestingForHypervReboot';
                SkipCcmClientSDK = $true;
            }
        };

        return $labHostSetupConfiguration;

    } #end process
} #end function
