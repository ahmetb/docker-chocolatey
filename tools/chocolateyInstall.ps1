$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.7.0-rc2.exe'
$checksum       = 'afaebb991cac8bd6ff7a4bac7a566a90'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.7.0-rc2.exe'
$checksum64     = 'ec0bf7ff94e66712a507f187acf7cf10'
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