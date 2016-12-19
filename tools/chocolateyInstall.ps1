$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.12.4.zip'
$checksum       = '7b8100e9aa92ce4ec263224b1ac175be'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.12.4.zip'
$checksum64     = '6cd4fcb998b642caf170c7c6fb9037a5'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
