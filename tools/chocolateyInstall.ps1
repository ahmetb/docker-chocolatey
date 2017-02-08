$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.13.1-rc2.zip'
$checksum       = 'eed8194c395b25dcdf9f1fd9e2c8fc69'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.13.1-rc2.zip'
$checksum64     = '47aade0f23cfa74b8843e6a584f41138'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
