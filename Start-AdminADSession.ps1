# Open a new Active Directory Users & Computers session as admin account

function Start-AdminADSession
{
	$credential = Get-DecryptedPassword -EncryptedPassword $encryptedPassword -EncryptedKey $encryptedKey -Thumbprint $thumbPrint -AdminUsername 'domain\useradmin'

	Start-Process "powershell.exe" -ArgumentList "mmc.exe dsa.msc" -Credential $credential -WindowStyle Hidden
}
