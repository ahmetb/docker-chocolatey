$packageName    = 'docker'
$url            = 'https://github.com/StefanScherer/docker-cli-builder/releases/download/18.06.1-ce/docker.exe'
$checksum       = '9cb9972c28cee9597c6365d5c37d1160625d4ea9c9c70635cf5d7e0c352467d3'
$url64          = $url
$checksum64     = $checksum
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$file = "$($toolsDir)\docker.exe"

if (![System.IO.Directory]::Exists($toolsDir)) {[System.IO.Directory]::CreateDirectory($toolsDir)}

Get-ChocolateyWebFile $packageName $file $url $url64 $checksum $checksum64 $checksumType $checksumType64
