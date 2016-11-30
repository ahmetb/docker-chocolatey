$packageName    = 'docker'
$url            = 'https://test.docker.com/builds/Windows/i386/docker-1.13.0-rc2.zip'
$checksum       = 'd58f57f4b7e51a8300de45e96ffa9325'
$url64          = 'https://test.docker.com/builds/Windows/x86_64/docker-1.13.0-rc2.zip'
$checksum64     = '011cae65015eae6faf9a4264413dc867'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
