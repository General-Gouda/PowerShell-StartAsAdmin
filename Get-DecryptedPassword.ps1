#----------------------------------------------------#
# Decrypts password using Certificate in LocalMachine\My cert store in Windows
#----------------------------------------------------#

function Get-DecryptedPassword
{
	[CmdletBinding()]
	param
	(
		$EncryptedPassword,
		$EncryptedKey,
		$Thumbprint,
		$AdminUsername
	)

	$ErrorActionPreference = 'Stop'

	if (Get-ChildItem Cert:\LocalMachine\My\$thumbprint)
	{
		try
		{
			$cert = Get-Item -Path Cert:\LocalMachine\My\$thumbprint -ErrorAction Stop
			$key = $cert.PrivateKey.Decrypt(([Convert]::FromBase64String($encryptedKey)), $true)
			$secureString = $encryptedPassword | ConvertTo-SecureString -Key $key
			$adminCredential = New-Object System.Management.Automation.PSCredential($AdminUsername, $secureString)
		}
		catch
		{
			Write-Warning "Failure decrypting key.`nError:$_"
			$adminCredential = $null
		}
	} 
	else
	{
		Write-Warning "Certificate needed for password decryption not found.`nError:$_"
		$adminCredential = $null
	}

	return $adminCredential
}
