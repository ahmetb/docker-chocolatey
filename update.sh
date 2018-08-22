#!/bin/bash

if [ "$1" = "" ]; then
  echo "Usage: $0 version"
  echo "Update the choco package to a given version"
  echo "Example: $0 17.06.0-ce"
  exit 1
fi

if [[ "${OSTYPE}" != "darwin"* && "${OSTYPE}" != "linux-gnu"* ]]; then
  echo "This version support Mac and Windows Subsystem for Linux"
  exit 2
fi

version=$1

uri="edge"

if [[ $version = *"-rc"* ]]
then
  uri="test"
fi
set -e

url="https://github.com/StefanScherer/docker-cli-builder/releases/download/${version}/docker.exe"
checksum=$(curl --fail -L "${url}" | shasum -a 256 | cut -f 1 -d " ")

# cut off "-ce", eg. 17.06.0-ce -> 17.06.0
version=${version//-ce/}

sed -i.bak "s/<version>.*<\/version>/<version>${version}<\/version>/" docker.nuspec

sed -i.bak "s/version: .*{build}/version: ${version}.{build}/" appveyor.yml

sed -i.bak "s!^\$url            = '.*'!\$url            = '${url}'!" tools/chocolateyInstall.ps1
sed -i.bak "s/^\$checksum       = '.*'/\$checksum       = '${checksum}'/" tools/chocolateyInstall.ps1
sed -i.bak "s!^\$url64          = '.*'!\$url64          = '${url64}'!" tools/chocolateyInstall.ps1
sed -i.bak "s/^\$checksum64     = '.*'/\$checksum64     = '${checksum64}'/" tools/chocolateyInstall.ps1
