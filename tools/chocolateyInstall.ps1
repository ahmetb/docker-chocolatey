$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.11.0-rc4.zip'
$checksum       = '0a5ad21e3c8e08d11df1301ff9aef409'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.11.0-rc4.zip'
$checksum64     = 'b85671b18c24abc83ee80e3db2352363'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
