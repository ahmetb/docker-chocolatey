$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.13.0-rc6.zip'
$checksum       = '0a5c09ec99328d02769184d1d5d1c4c3'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.13.0-rc6.zip'
$checksum64     = '2afa7a93dc1f052ce515cd6797807412'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
