$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-17.03.0-ce-rc1.zip'
$checksum       = '5a38233d28ea20d1b382d8217a4ef0f1aa11fb9b0ce15a042128eed749c803f4'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-17.03.0-ce-rc1.zip'
$checksum64     = '0f5d1a6c60011e9cb5ab75b6c70e14495dad8957a3aacb1a6e76d54e011b71d0'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
