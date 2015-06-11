$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.6.0.exe'
$checksum       = 'ecf9d6db32597c76ae8f8149aeec6662'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.6.0.exe'
$checksum64     = '67a482e2be45c687ac786a73576e028a'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir  = "$(Split-Path -parent $toolsDir)"
$installDir  = Join-Path "$packageDir" "bin"
$installBin  = "${packageName}.exe"
$installPath = Join-Path "$installDir" "$installBin"

New-Item -ItemType Directory -Force -Path "$installDir"
Get-ChocolateyWebFile "$packageName" "$installPath" "$url" "$url64" -checksum "$checksum" -checksumType "$checksumType" -checksum64
