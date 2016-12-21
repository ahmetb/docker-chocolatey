$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.13.0-rc3.zip'
$checksum       = 'fb94eae850ce5a16fe302978cf853698'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.13.0-rc3.zip'
$checksum64     = 'f8e47abca0596d4d1a0338e67bf841b7'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
