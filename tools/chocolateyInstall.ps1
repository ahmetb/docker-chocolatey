$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.10.3.exe'
$checksum       = '943235a4e0f3b1b8a214cca1d81e4693'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.10.3.exe'
$checksum64     = '4d9c818967d729f38931edbe33c28398'
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
