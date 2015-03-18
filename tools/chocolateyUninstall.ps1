$packageName = 'docker'

$binRoot = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path "$binRoot" "$packageName"

if (Test-Path $installDir) {
    Remove-Item "$installDir" -Recurse
}