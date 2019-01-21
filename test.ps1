$ErrorActionPreference = "Stop"

if ($env:APPVEYOR_BUILD_VERSION) {
  # run in CI
  $version = $env:APPVEYOR_BUILD_VERSION -replace('\.[^.\\/]+$')
} else {
  # run manually
  [xml]$spec = Get-Content docker.nuspec
  $version = $spec.package.metadata.version
}

"TEST: Version $version in docker.nuspec file should match"
[xml]$spec = Get-Content docker.nuspec
if ($spec.package.metadata.version.CompareTo($version)) {
  Write-Error "FAIL: Wrong version in nuspec file!"
}

"TEST: Package should contain only install script"
Add-Type -assembly "system.io.compression.filesystem"
$zip = [IO.Compression.ZipFile]::OpenRead("$pwd\docker.$version.nupkg")
if ($zip.Entries.Count -ne 5) {
  Write-Error "FAIL: Wrong count in nupkg!"
}
$zip.Dispose()

try {
  . choco install -y docker -source .
  Write-Error "FAIL: docker package could be installed"
} catch {
  Write-Host "PASS: docker could not be installed as the dependency could not be found"
}

"TEST: Installation of package should work"
. choco install -y docker-cli -version 18.09.0
. choco install -y docker -source .

"TEST: Version of binary should match"
. docker --version
if (-Not $(docker --version).Contains("version 18.09.0,")) {
  Write-Error "FAIL: Wrong version of docker installed!"
}

"TEST: Docker daemon shim must not exist"
if (Test-Path $env:ChocolateyInstall\bin\dockerd.exe) {
  Write-Error "FAIL: Docker daemon shim exists!"
}

"TEST: Docker proxy shim must not exist"
if (Test-Path $env:ChocolateyInstall\bin\docker-proxy.exe) {
  Write-Error "FAIL: Docker proxy shim exists!"
}

"TEST: Uninstall show remove the binary"
. choco uninstall docker
try {
  . docker
  Write-Host "PASS: docker still found"
} catch {
  Write-Error "FAIL: docker binary not found"
}

"TEST: Finished"
