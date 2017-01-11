$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.12.6.zip'
$checksum       = 'c6d1e9591ceee396d748305692f61f3c'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.12.6.zip'
$checksum64     = 'd3d58a8cd16ad39b30e81f1eefbe751a'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
