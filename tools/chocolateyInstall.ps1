$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.10.0.exe'
$checksum       = '7248486a5454f81919e57676e2eb0fe6'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.10.0.exe'
$checksum64     = '7b4927107d23e02f55b7b870b299f752'
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
