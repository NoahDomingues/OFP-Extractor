# downloadproject.ps1
# A PowerShell script to download and extract the OFP-Extractor repository
# Last updated May 20 2025 - v1.1
# Noah Domingues - https://github.com/NoahDomingues/OFP-Extractor

# URL for the GitHub repository ZIP (default branch is "main")
$repoZipUrl = "https://github.com/NoahDomingues/OFP-Extractor/archive/refs/heads/main.zip"
$zipFile = "OFP-Extractor-main.zip"

Write-Host "Downloading repository from $repoZipUrl ..."
try {
    Invoke-WebRequest -Uri $repoZipUrl -OutFile $zipFile -UseBasicParsing
}
catch {
    Write-Error "Failed to download the repository. Error details: $_"
    exit 1
}

Write-Host "Download complete. Extracting files ..."
try {
    Expand-Archive -Path $zipFile -DestinationPath . -Force
}
catch {
    Write-Error "Extraction failed. Error details: $_"
    exit 1
}

# Option: remove the downloaded zip file after extraction
Remove-Item $zipFile -Force

Write-Host "Extraction complete. The repository has been extracted to:" (Get-Location).Path
