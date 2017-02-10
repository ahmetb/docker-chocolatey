$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.13.1.zip'
$checksum       = '1731804d28081b35751523136a31cfbf'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.13.1.zip'
$checksum64     = '520a2c6a98c811da7064e78e7000b3b7'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
