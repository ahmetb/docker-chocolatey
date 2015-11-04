$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.9.0.exe'
$checksum       = '5c1990a4ce59c42ef493db0013aaccf8'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.9.0.exe'
$checksum64     = 'b08166276646433dc04b23982a9071aa'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir  = "$(Split-Path -parent $toolsDir)"
$installDir  = Join-Path "$packageDir" "bin"
$installBin  = "${packageName}.exe"
$installPath = Join-Path "$installDir" "$installBin"

New-Item -ItemType Directory -Force -Path "$installDir"
Get-ChocolateyWebFile "$packageName" "$installPath" "$url" "$url64" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"
