Add-WindowsFeature AD-Domain-Services

Install-ADDSForest -DomainName testing.local -InstallDNS

<#

This script creates a Domain Controller

- Type the Directory Services Restore Mode (DSRM) password twice and press Enter to save the password. The DSRM password is referred to as the SafeModeAdministratorPassword in Windows PowerShell
- Type A and press Enter to configure the server as a domain controller and install DNS
- The domain controller promotion will complete and the server will be rebooted finalizing the process
#>
