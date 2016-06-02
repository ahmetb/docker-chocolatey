$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.11.2.zip'
$checksum       = '39054474e36a9bc22cb1ba917b4b159a'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.11.2.zip'
$checksum64     = '561de894690e66eaa58fcda7614f532f'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
