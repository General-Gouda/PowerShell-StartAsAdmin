# Start new PowerShell ISE session as admin account

function Start-AdminISESession
{
    $credential = Get-DecryptedPassword -EncryptedPassword $encryptedPassword -EncryptedKey $encryptedKey -Thumbprint $thumbPrint -AdminUsername 'domain\useradmin'

    Start-Process "powershell_ise.exe" -Credential $credential
}
