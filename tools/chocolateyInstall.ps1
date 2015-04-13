$packageName    = 'docker'
$url            = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/i386/docker-1.6.0-rc6.exe'
$checksum       = '3f2de7a5c33e8bc2232e9c047b3a63c1'
$url64          = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/x86_64/docker-1.6.0-rc6.exe'
$checksum64     = '9196acb366743e03d2dd0a877d2d27d5'
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
