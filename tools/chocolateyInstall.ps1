$packageName    = 'docker'
$url            = 'https://master.dockerproject.com/windows/386/docker-1.5.0-dev.exe'
$url64          = 'https://master.dockerproject.com/windows/amd64/docker-1.5.0-dev.exe'
$validExitCodes = @(0)

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir = "$(Split-Path -parent $toolsDir)"
$installDir = Join-Path "$packageDir" "bin"
$installBin = "${packageName}.exe"
$installPath = Join-Path "$installDir" "$installBin"

try {
  # Download binary
  mkdir "$installDir"
  Get-ChocolateyWebFile "$packageName" "$installPath" "$url" "$url64"
  # Add to PATH
  Install-ChocolateyPath "$installDir" Machine  

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}