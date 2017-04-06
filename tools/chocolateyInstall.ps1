$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-17.04.0-ce.zip'
$checksum       = 'c6307c09ed4337354c29d87bcfbff0333ac1bfc6551ae12c4101d3d1ef01cda3'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-17.04.0-ce.zip'
$checksum64     = 'e10ce76efff553b5f346015b8ea5bff1fa59977ad457f51643efc6811a70cf1b'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
