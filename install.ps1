# PowerShell Script to Install the CLI Tool

$installPath = "$env:USERPROFILE\Initz"  # Set install path
$cliFilename = "Initz.exe"               # Set CLI executable name

# Ensure the directory exists
if (!(Test-Path -Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force
}

$downloadUrl = "https://github.com/pandey03muskan/AudioBook/releases/download/Initz/Initz.exe"

Write-Output "Downloading CLI tool to: $installPath\$cliFilename"
Invoke-WebRequest -Uri $downloadUrl -OutFile "$installPath\$cliFilename" -UseBasicParsing

# Add the directory to the system PATH
Write-Host "Adding CLI tool to PATH..."
$env:Path += ";$installPath"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)

# Confirm installation
Write-Host "Installation complete! You can now use '$initz' from any terminal."


