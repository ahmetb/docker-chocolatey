$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.13.1.zip'
$checksum       = '3e31c57b0e592c5a9a489cd779c5564413c8510cfdc0b9404269623a7f6cba44'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.13.1.zip'
$checksum64     = '850deeac9e05a2426be335b7bf4b31757c98639eb35e0fe8d9c4b1dc8cc06c38'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "docker" "$url" "$toolsDir" "$url64" `
 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64
