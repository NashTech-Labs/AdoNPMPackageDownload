param (
    [string]$githubToken,
    [string]$packageName,
    [string]$organization,
    [string]$targetPath,
    [string]$artifactPath,
    [string]$registryUrl
)
 
# Set package details
$packageName = "@$organization/$packageName"
$packageVersion = "latest"  # Set to "latest" if you want the latest version
 
Set-Location -Path $artifactPath
$npmrcPath = ".npmrc"
 
$env:NODE_PATH = './node_modules'
Write-Host "NODE_PATH set to $env:NODE_PATH"
 
if (-not (Test-Path $npmrcPath)) {
    Set-Content -Path $npmrcPath -Value $registryUrl
} else {
    Set-Content -Path $npmrcPath -Value $registryUrl
}
 
Add-Content -Path $npmrcPath -Value "//npm.pkg.github.com/:_authToken=$githubToken"
Add-Content -Path $npmrcPath -Value "always-auth=true"
 
if ($packageVersion -eq "latest") {
    Write-Host "npm install $packageName"
    npm install $packageName
} else {
    Write-Host "npm install "$packageName@$packageVersion""
    npm install "$packageName@$packageVersion"
}
 
Write-Host "Package '$packageName' installed successfully."
Remove-Item -Path $npmrcPath -Force
 
# Assuming you want to zip the folder "my_folder" to a location "C:\my_zip_folder\my_folder.zip"
Set-Location -Path $targetPath
$folderPath = "$artifactPath\node_modules\$packageName"
$zipFilePath = "$targetPath\my_folder.zip"
 
Compress-Archive -Path $folderPath -DestinationPath $zipFilePath
 
Write-Host "Folder '$folderPath' has been zipped to '$zipFilePath'"