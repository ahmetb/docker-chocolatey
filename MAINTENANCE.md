# Maintainer's Guide

This document explains how to maintain Chocolatey package
for Docker client for Windows.

## How it works

This Chocolatey package is designed to download the docker
client binary (.exe) from `get.docker.com` and place it
in `%PATH%`.

Main installation script is written in PowerShell and is in
`tools\chocolateyInstall.ps1`.

## Setting up development environment.

1. Install Chocolatey (http://chocolatey.org) on your
   Windows machine.
2. Install `nuget` package: `choco install nuget`.
3. Clone this repository.

## Making a new release

#### 1. Update `docker.nuspec`

You need to update the value in `<version>` tag with
the official docker version string correctly.

#### 2. Update `tools\chocolateyInstall.ps1`

You need to update `$url`, `$url64`, `$checksum` and `$checksum64`
variables below.

* URLs must point to `get.docker.com` for stable releases, ask
  the release captain for release candidate (rc) URLs.
* Checksums can be found by adding `.md5` extension to the URLs.

Example:

	$url            = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/i386/docker-1.6.0-rc2.exe'
	$checksum       = 'b87e30265310a9221ed4f4926ae3d579'
	....
	$url64          = 'http://test.docker.com.s3.amazonaws.com/builds/Windows/x86_64/docker-1.6.0-rc2.exe'
	$checksum64     = '32524cf8ff385ae93356c7bc8f321393'

#### 3. Package it

Open a command line window and run the following command in the folder
where `docker.nuspec` exists:

    nuget pack

It might show some warnings, but if there's no errors, it's completed.
Check if a `.nupkg` file exists in the same directory after this.

#### 4. Install it locally

First, make sure `docker` is not installed (or not in %PATH%). (Cleanest
way to do this is to run inside a clean virtual machine but that's not
always necessary).

Use the following command to install the nupkg locally (the directory
used below is where the `docker*.nupkg` exists):

    choco install docker -source c:\git\docker-chocolatey

> NOTE: If the version is pre-release (e.g. a RC), you need to provide
> `-pre` flag to the command above as well.

The command above must be installing docker correctly. Run `docker -v`
to verify if it is installed.

Repeat the `choco install` command with an additional `-x86` flag to
make sure 32-bit version installs correctly, too.

Run the following commands to verify uninstallation works:

    choco uninstall docker
    docker // shouldn't work

#### 5. Upload the package

> **CAUTION:** You can upload a version only once (chocolatey does not
> allow overwriting packages). Therefore be careful since you can do
> this step only once without changing `<version>` string.

Go to http://chocolatey.org and log in.

Click **Upload** tab.

Choose the binary.

Review the version number and details.

Hit "Upload" button.

#### 6. Approval Process

If you are submitting a stable version, Chocolatey moderators need to
allow the package before it is published. This usually takes a day or
so. (If it takes any longer, ping @ferventcoder).

If a package is **pre-release** (i.e. has `-rc1`, `-beta` like strings
in its version) then the submission **does not need moderator approval** 
and you will see a message like this:

> "*This package is exempt from moderation. While it is likely safe for you, 
> there is more risk involved.*"

The difference is, users install stable packages with:

    choco install docker

and pre-release packages with:

    choco install -pre

command and Chocolatey usually prompts users with more confirmation
messages if the package is pre-release.

#### 7. Profit

Package will be published at https://chocolatey.org/packages/docker


