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

1. Clone this repository.

## Making a new release

#### 1. Update all files

Run `./update.sh 1.10.3` and specifiy the new version of the Docker client. (The script works on Mac only at the moment).
This will update these files
  * docker.nuspec
  * appveyor.yml
  * tools/chocolateyInstall.ps1

#### 2. Create a branch

Create a branch and push it.

    git checkout -b update-docker-1.10.3
    git add docker.nuspec appveyor.yml tools/chocolateyInstall.ps1
    git push -u origin update-docker-1.10.3

#### 3. Create a pull request

With the new branch create a pull request. Now check AppVeyor build status.

#### 4. Merge pull request

At GitHub merge the pull request if all the tests from AppVeyor are green.

#### 5. Draft a release

Now draft a new release at https://github.com/ahmetalpbalkan/docker-chocolatey/releases/new
Enter eg. 1.10.3 in the field "Tag version" and "Release title" and add some nice description.

AppVeyor then builds the package again, tests it and then pushes it to Chocolatey for approval.

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
