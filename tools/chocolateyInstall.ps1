$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-17.03.1-ce.zip'
$checksum       = 'a86090b2dfe1677de03ca3463967259c6c615743d900f07be3fb8781763ec4c9'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-17.03.1-ce.zip'
$checksum64     = 'f22cfd236cb956fd7e0309e11ef0020b2a4b6d3c53bb409f837271d0d870c6ea'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
