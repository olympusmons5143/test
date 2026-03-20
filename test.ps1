Add-Type -AssemblyName System.Windows.Forms
#[System.Windows.Forms.MessageBox]::Show("This is a test.", "Test", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
$info = "User: $(whoami)`nHost: $(hostname)`nIP: $((Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notlike '*Loopback*'} | Select-Object -First 1).IPAddress)"
[System.Windows.Forms.MessageBox]::Show($info, "System Info Captured", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
