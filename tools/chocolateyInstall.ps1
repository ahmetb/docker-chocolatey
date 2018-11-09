$packageName    = 'docker'
$url            = 'https://github.com/StefanScherer/docker-cli-builder/releases/download/18.09.0/docker.exe'
$checksum       = '831d191ecb337889287630d4b89a24953f1416deb76f823f42f7101de23ce540'
$url64          = $url
$checksum64     = $checksum
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$file = "$($toolsDir)\docker.exe"

if (![System.IO.Directory]::Exists($toolsDir)) {[System.IO.Directory]::CreateDirectory($toolsDir)}

Get-ChocolateyWebFile $packageName $file $url $url64 $checksum $checksum64 $checksumType $checksumType64
