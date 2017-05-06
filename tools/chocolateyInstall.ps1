$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-17.05.0-ce.zip'
$checksum       = '99820746a362466700718d33ee727b9aea993b9c2e05fb2c53ed606e9f6780f1'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-17.05.0-ce.zip'
$checksum64     = 'cbb0b47b511023a98dd0c83d76c1f30b315b8381b85b67be355eca4748229031'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
