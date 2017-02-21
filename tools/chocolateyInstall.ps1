$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-17.03.0-ce-rc1.zip'
$checksum       = 'eeb278fd066bfc7bb97ec1b551e14ba5'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-17.03.0-ce-rc1.zip'
$checksum64     = '2dc3f2d76a77a338035770d602a0634d'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
