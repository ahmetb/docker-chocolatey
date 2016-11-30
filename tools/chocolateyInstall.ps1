$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.12.3.zip'
$checksum       = '6d410819fb96563527e09ffc67427f05'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.12.3.zip'
$checksum64     = '26d64373f65e4ae9db71a50e8cc8b6c7'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
