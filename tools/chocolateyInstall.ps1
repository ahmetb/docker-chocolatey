$packageName    = 'docker'
$url            = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/i386/docker-1.6.0-rc1.exe'
$checksum       = 'cbe2b574dd8d96825185c22fcfb280db'
$checksumType   = 'md5'
$url64          = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/x86_64/docker-1.6.0-rc1.exe'
$checksum64     = '00F022AD868639BB0E5FE58F360C9522'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir  = "$(Split-Path -parent $toolsDir)"
$installDir  = Join-Path "$packageDir" "bin"
$installBin  = "${packageName}.exe"
$installPath = Join-Path "$installDir" "$installBin"

mkdir "$installDir"
Get-ChocolateyWebFile "$packageName" "$installPath" "$url" "$url64" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"