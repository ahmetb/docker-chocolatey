$packageName    = 'docker'
$url            = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/i386/docker-1.6.0-rc2.exe'
$checksum       = 'b87e30265310a9221ed4f4926ae3d579'
$checksumType   = 'md5'
$url64          = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/x86_64/docker-1.6.0-rc2.exe'
$checksum64     = '32524cf8ff385ae93356c7bc8f321393'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir  = "$(Split-Path -parent $toolsDir)"
$installDir  = Join-Path "$packageDir" "bin"
$installBin  = "${packageName}.exe"
$installPath = Join-Path "$installDir" "$installBin"

New-Item -ItemType Directory -Force -Path "$installDir"
Get-ChocolateyWebFile "$packageName" "$installPath" "$url" "$url64" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"