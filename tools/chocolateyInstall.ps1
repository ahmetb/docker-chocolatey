$packageName    = 'docker'
$url            = 'https://download.docker.com/win/static/edge/x86_64/docker-17.07.0-ce.zip'
$checksum       = 'a44b39af4e7d93057d8f91adb3062791202e1a03f06829af1eb2ddc768853688'
$url64          = $url
$checksum64     = $checksum
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
