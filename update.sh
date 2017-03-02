#!/bin/bash

if [ "$1" = "" ]; then
  echo "Usage: $0 version"
  echo "Update the choco package to a given version"
  echo "Example: $0 17.03.0-ce"
  exit 1
fi

if [[ "${OSTYPE}" != "darwin"* && "${OSTYPE}" != "linux-gnu"* ]]; then
  echo "This version support Mac and Windows Subsystem for Linux"
  exit 2
fi

version=$1

uri="get"

if [[ $version = *"-rc"* ]]
then
  uri="test"
fi

# cut off "-ce"
version=${version//-ce/}

url="https://${uri}.docker.com/builds/Windows/i386/docker-${version}-ce.zip"
url64="https://${uri}.docker.com/builds/Windows/x86_64/docker-${version}-ce.zip"
checksum=$(curl "${url}.sha256" | cut -f 1 -d " ")
checksum64=$(curl "${url64}.sha256" | cut -f 1 -d " ")

sed -i.bak "s/<version>.*<\/version>/<version>${version}<\/version>/" docker.nuspec

sed -i.bak "s/version: .*{build}/version: ${version}.{build}/" appveyor.yml

sed -i.bak "s!^\$url            = '.*'!\$url            = '${url}'!" tools/chocolateyInstall.ps1
sed -i.bak "s/^\$checksum       = '.*'/\$checksum       = '${checksum}'/" tools/chocolateyInstall.ps1
sed -i.bak "s!^\$url64          = '.*'!\$url64          = '${url64}'!" tools/chocolateyInstall.ps1
sed -i.bak "s/^\$checksum64     = '.*'/\$checksum64     = '${checksum64}'/" tools/chocolateyInstall.ps1
