$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.12.2.zip'
$checksum       = '038678bd1250af5d400994e711408ed9'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.12.2.zip'
$checksum64     = 'a84ddb1e7ff217cf3e75f116acade7d1'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
