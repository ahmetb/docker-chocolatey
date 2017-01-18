$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.13.0.zip'
$checksum       = '3a542433b0d9839b48495403df991ba4'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.13.0.zip'
$checksum64     = 'f7caf27a123acc290ef0336adbd58611'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
