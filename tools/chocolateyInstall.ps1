$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.12.0.zip'
$checksum       = '63eb40b17c88cb6d9404f5b5054e5dfc'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.12.0.zip'
$checksum64     = '2ccb6e53934ee08782923ea8a875be55'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
