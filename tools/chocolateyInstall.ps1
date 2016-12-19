$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.12.5.zip'
$checksum       = 'bd7114d59d41aac56c5f499231d1e4f9'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.12.5.zip'
$checksum64     = '4d5e250ee8ba766583b56fb29cb8aeea'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
