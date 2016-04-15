$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.11.0.zip'
$checksum       = 'f8bbf3bd40c9939513f5023f5107e9b2'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.11.0.zip'
$checksum64     = '1474613540062ba4d28496e060da5e15'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
