# Start new PowerShell console session as admin account

function Start-AdminPSSession
{
    $credential = Get-DecryptedPassword -EncryptedPassword $encryptedPassword -EncryptedKey $encryptedKey -Thumbprint $thumbPrint -AdminUsername 'domain\useradmin'

    Start-Process "powershell.exe" -Credential $credential
}

