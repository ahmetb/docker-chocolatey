$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.11.1.zip'
$checksum       = '9f70c194a760a6f339b51ddc84f5c16d'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.11.1.zip'
$checksum64     = '2148235257bd34b11da6bccb926d807b'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
