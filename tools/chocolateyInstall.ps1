$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.7.0.exe'
$checksum       = '9f2af080d356de682c1bfaa11916652c'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.7.0.exe'
$checksum64     = '19ca85c1d84ed39058ea1926fe4394c1'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir  = "$(Split-Path -parent $toolsDir)"
$installDir  = Join-Path "$packageDir" "bin"
$installBin  = "${packageName}.exe"
$installPath = Join-Path "$installDir" "$installBin"

New-Item -ItemType Directory -Force -Path "$installDir"
Get-ChocolateyWebFile "$packageName" "$installPath" "$url" "$url64" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"