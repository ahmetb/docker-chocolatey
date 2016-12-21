$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.13.0-rc4.zip'
$checksum       = 'a107defb60d5546e57b703e900ff238f'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.13.0-rc4.zip'
$checksum64     = 'f22672d591b8e30c27175d7e28e4e120'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
