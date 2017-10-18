$packageName    = 'docker'
$url            = 'https://download.docker.com/win/static/edge/x86_64/docker-17.10.0-ce.zip'
$checksum       = 'd69fac0f201b6f5727e0985990261ddc4e1cb3edd1f8db4ff46f3b2c59c3b873'
$url64          = $url
$checksum64     = $checksum
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
