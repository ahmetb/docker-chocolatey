$packageName    = 'docker'
$url            = 'https://download.docker.com/win/static/edge/x86_64/docker-17.06.0-ce.zip'
$checksum       = '3d27360a11a3a627aac9c6d73eb32d4a9b6dcca6bcb4b2c7a5fcd9d2e0ec6c82'
$url64          = $url
$checksum64     = $checksum
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
