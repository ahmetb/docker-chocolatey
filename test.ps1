"Running tests"
$ErrorActionPreference = "Stop"
$version = $env:APPVEYOR_BUILD_VERSION -replace('\.[^.\\/]+$')

"TEST: Version $version in docker.nuspec file should match"
[xml]$spec = Get-Content docker.nuspec
if ($spec.package.metadata.version.CompareTo($version)) {
  Write-Error "FAIL: rong version in nuspec file!"
}

"TEST: Package should contain only install script"
Add-Type -assembly "system.io.compression.filesystem"
$zip = [IO.Compression.ZipFile]::OpenRead("$pwd\docker.$version.nupkg")
if ($zip.Entries.Count -ne 5) {
  Write-Error "FAIL: Wrong count in nupkg!"
}
$zip.Dispose()

"TEST: Installation of package should work"
. choco install -y docker -source .

"TEST: Version of binary should match"
. docker --version
if (-Not $(docker --version).Contains("version $version,")) {
  Write-Error "FAIL: Wrong version of docker installed!"
}

"TEST: Uninstall show remove the binary"
. choco uninstall docker
try {
  . docker
  Write-Error "FAIL: docker binary still found"
} catch {
  Write-Host "PASS: docker not found"
}

"TEST: Finished"
