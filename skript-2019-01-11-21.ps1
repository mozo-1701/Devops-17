 2.1 
 
 Update-Help
Update-Help : Failed to update Help for the module(s) 'Whea' with UI culture(s) {en-US} : Unable to retrieve the HelpInfo XML
 file for UI culture en-US. Make sure the HelpInfoUri property in the module manifest is valid or check your network connecti
on and then try the command again.
At line:1 char:1
+ Update-Help
+ ~~~~~~~~~~~
    + CategoryInfo          : ResourceUnavailable: (:) [Update-Help], Exception
    + FullyQualifiedErrorId : UnableToRetrieveHelpInfoXml,Microsoft.PowerShell.Commands.UpdateHelpCommand
	
	the problem is UI culture(s) {en-US} which prevent module 'Whea'