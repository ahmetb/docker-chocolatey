$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.9.1.exe'
$checksum       = '4f88ae8680ac72d4144d667de5b4cdae'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.9.1.exe'
$checksum64     = '08b5fa55b2a2a559315c6747fb2fcab0'
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
