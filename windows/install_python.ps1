# PowerShell script to download and install Python
# This script downloads the latest Python installer and installs it silently

$ErrorActionPreference = "Stop"

Write-Host "Downloading Python installer..." -ForegroundColor Cyan

# Get the latest Python 3.11 installer URL (stable version)
$pythonVersion = "3.11.9"
$installerUrl = "https://www.python.org/ftp/python/$pythonVersion/python-$pythonVersion-amd64.exe"
$installerPath = "$env:TEMP\python-installer.exe"

try {
    # Download Python installer
    Write-Host "Downloading from: $installerUrl" -ForegroundColor Gray
    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath -UseBasicParsing
    
    Write-Host "Download complete!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Installing Python..." -ForegroundColor Cyan
    Write-Host "This may take a few minutes. Please wait..." -ForegroundColor Yellow
    Write-Host ""
    
    # Install Python silently with:
    # - Add to PATH
    # - Install pip
    # - Install for all users (if admin) or current user
    # - Prepend PATH
    $arguments = "/quiet InstallAllUsers=0 PrependPath=1 Include_pip=1 Include_test=0"
    
    $process = Start-Process -FilePath $installerPath -ArgumentList $arguments -Wait -PassThru
    
    if ($process.ExitCode -eq 0) {
        Write-Host "Python installed successfully!" -ForegroundColor Green
        
        # Refresh environment variables
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
        
        # Clean up installer
        Remove-Item $installerPath -Force
        
        exit 0
    } else {
        Write-Host "Installation failed with exit code: $($process.ExitCode)" -ForegroundColor Red
        exit 1
    }
    
} catch {
    Write-Host "Error: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Python manually from:" -ForegroundColor Yellow
    Write-Host "https://www.python.org/downloads/" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Make sure to check 'Add Python to PATH' during installation!" -ForegroundColor Yellow
    exit 1
}

