# PowerShell Script to Install the CLI Tool

# URL to your .exe file on GitHub Releases
$downloadUrl = "https://github.com/pandey03muskan/AudioBook/releases/download/Initz/Initz.exe"
$exeName = "Initz.exe"
$installPath = "C:\Program Files\Initz"

# Create the installation directory
if (!(Test-Path -Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath
}

# Download the .exe file
Write-Host "Downloading CLI tool..."
Invoke-WebRequest -Uri $downloadUrl -OutFile "$installPath\$initz"

# Add the directory to the system PATH
Write-Host "Adding CLI tool to PATH..."
$env:Path += ";$installPath"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)

# Confirm installation
Write-Host "Installation complete! You can now use '$initz' from any terminal."

