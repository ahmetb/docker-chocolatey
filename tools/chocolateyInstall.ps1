$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.12.0-rc4.zip'
$checksum       = 'a9db01c44ab876c8097d272d6431f1b3'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.12.0-rc4.zip'
$checksum64     = '3a6caaa39ff00f58e39a2f934012c8e7'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
