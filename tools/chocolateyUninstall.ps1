$packageName = 'docker'

$binRoot = Get-BinRoot
$installDir = Join-Path "$binRoot" "$packageName"

if (Test-Path $installDir) {
    Remove-Item "$installDir" -Recurse
}