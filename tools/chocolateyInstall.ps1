$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.13.0-rc7.zip'
$checksum       = '01a2007b9d5fac29f498a79124a9a3b0'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.13.0-rc7.zip'
$checksum64     = 'e67693a2e073a188a1644d9c8d14f72b'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
