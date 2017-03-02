$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-17.03.0-ce.zip'
$checksum       = 'bc090c38554c058bd40ff25abe6e0873a16819ae3edf658d89cbc5a0768dad3f'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-17.03.0-ce.zip'
$checksum64     = '6ab9e1b7aed9ab98fe6adec6e8e45cec9f5c69e1370d7ceec5029a5df199d0e1'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
