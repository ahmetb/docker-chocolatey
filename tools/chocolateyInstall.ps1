$packageName    = 'docker'
$url            = 'https://download.docker.com/win/static/edge/x86_64/docker-17.09.0-ce.zip'
$checksum       = 'aee9eed72facb59a6d06de047782ffef9011827be9f24b82dfff5b6792606c74'
$url64          = $url
$checksum64     = $checksum
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
