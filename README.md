# NPM Package Downloader and Zipper
 
This PowerShell script allows you to download an npm package from a private repository and create a zip file containing the package.
 
## Prerequisites
 
1. **GitHub Access Token**: Obtain a GitHub access token with appropriate permissions to access your private repository.
 
## Usage
 
1. **Clone the Repository**:
   Clone this repository to your local machine.
 
2. **Modify Parameters**:
   Open the `download_and_zip.ps1` script and modify the following parameters:
 
   - `$githubToken`: Replace with your actual GitHub access token.
   - `$packageName`: Specify the npm package name.
   - `$organization`: Specify the organization or username (for scoped packages).
   - `$targetPath`: Set the target directory where the zip file will be created.
   - `$artifactPath`: Set the directory where npm modules will be installed.
   - `$registryUrl`: Set the registry URL (e.g., npm.pkg.github.com).
 
3. **Run the Script**:
   Open PowerShell and navigate to the cloned repository. Run the script:
 
   ```powershell
   .\download_and_zip.ps1
   ```
 
   The npm package will be installed, and the specified folder will be zipped.
 
4. **Check the Output**:
   The zip file will be created in the specified `$targetPath`.
 
## Example
 
  Suppose you want to download the package `my-awesome-package` from your private GitHub repository (`@myorg/my-repo`) and create a zip file in `C:\my-zip-folder`. Here's how you'd modify the parameters:
 

  ```powershell
  $githubToken = "your_actual_token"
  $packageName = "my-awesome-package"
  $organization = "myorg"
  $targetPath = "C:\my-zip-folder"
  $artifactPath = "C:\path\to\node_modules"
  $registryUrl = "@myorg:registry=https://npm.pkg.github.com"
  
  .\download_and_zip.ps1 -githubToken "your_actual_token" -packageName "my-awesome-package" -organization "myorg" -targetPath "C:\my-zip-folder" -artifactPath "C:\path\to\node_modules" -registryUrl "@myorg:registry=https://npm.pkg.github.com"
  
  ```
 
Run the script, and the zip file will be generated in `C:\my-zip-folder`.