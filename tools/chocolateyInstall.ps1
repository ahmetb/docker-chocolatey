$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.13.1-rc1.zip'
$checksum       = '9f6d66571b65a84997d2c85d0868db79'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.13.1-rc1.zip'
$checksum64     = '2fa1b40b5ba49d71e373d4cf6d3c5d73'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
