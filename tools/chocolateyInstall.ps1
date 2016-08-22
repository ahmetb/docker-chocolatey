$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.12.1.zip'
$checksum       = '629df7d4874b111509acff5f3f8110ff'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.12.1.zip'
$checksum64     = 'ddb84b1d5c95ae587652b521c9f2ad7f'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
