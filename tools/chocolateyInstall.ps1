$packageName    = 'docker'
$url            = 'https://github.com/StefanScherer/docker-cli-builder/releases/download/18.06.0-ce/docker.exe'
$checksum       = 'd69fac0f201b6f5727e0985990261ddc4e1cb3edd1f8db4ff46f3b2c59c3b873'
$url64          = $url
$checksum64     = $checksum
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$file = "$($toolsDir)\docker.exe"

if (![System.IO.Directory]::Exists($toolsDir)) {[System.IO.Directory]::CreateDirectory($toolsDir)}

Get-ChocolateyWebFile $packageName $file $url $url64 $checksum $checksum64 $checksumType $checksumType64
