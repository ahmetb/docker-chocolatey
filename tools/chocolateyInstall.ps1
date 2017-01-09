$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.13.0-rc5.zip'
$checksum       = '2574d0a4fdd9695716dbf53af4006337'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.13.0-rc5.zip'
$checksum64     = 'd9671a1ff4225fe0039118d3fb63c28e'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
