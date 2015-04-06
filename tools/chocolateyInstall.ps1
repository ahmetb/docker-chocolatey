$packageName    = 'docker'
$url            = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/i386/docker-1.6.0-rc5.exe'
$checksum       = '6925b32289dd8b53561883429f0f106c'
$url64          = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/x86_64/docker-1.6.0-rc5.exe'
$checksum64     = 'a5bf235a7bd2e9cca5ef9ccac7ea2fac'
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
