$packageName    = 'docker'
$url            = 'https://github.com/StefanScherer/docker-cli-builder/releases/download/18.06.0-ce/docker.exe'
$checksum       = '8ac7d299e6bbbd4af74ac28d930875bf9e1630a6a618b29734afdaea158edea4'
$url64          = $url
$checksum64     = $checksum
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
