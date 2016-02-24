$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.10.2.exe'
$checksum       = 'c8e7f61fc152295aa07614373ad63b8c'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.10.2.exe'
$checksum64     = 'd02f71aa853a1d0335be70cbbe775e71'
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
