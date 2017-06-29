# Maintainer's Guide

This document explains how to maintain Chocolatey package
for Docker CE client for Windows.

## How it works

This Chocolatey package is designed to download the Docker CE
client binary (.exe) from `download.docker.com/win/static/edge` and place it
in `%PATH%`.

The pre-release packages download the docker client binary from `download.docker.com/win/static/test`.

Main installation script is written in PowerShell and is in
`tools\chocolateyInstall.ps1`.

## Setting up development environment.

1. Clone this repository.

## Making a new release

The following steps describe the process to make a new release. If you want
to make a new pre-release eg. for a release candidate 17.06.0-ce-rc5, see the steps below.

#### 1. Update all files

First make sure you are in the `master` branch.

    git checkout master
    git pull

Run `./update.sh 17.06.0-ce` and specify the new version of the Docker client. (The script works on Mac only at the moment).
This will update these files
  * docker.nuspec
  * appveyor.yml
  * tools/chocolateyInstall.ps1

#### 2. Create a branch

Create a branch and push it.

    git checkout -b update-docker-17.06.0-ce
    git add docker.nuspec appveyor.yml tools/chocolateyInstall.ps1
    git push -u origin update-docker-17.06.0-ce

#### 3. Create a pull request

With the new branch create a pull request. Now check AppVeyor build status.

#### 4. Merge pull request

At GitHub merge the pull request if all the tests from AppVeyor are green.

#### 5. Draft a release

Now draft a new release at https://github.com/ahmetalpbalkan/docker-chocolatey/releases/new
Enter eg. 17.06.0-ce in the field "Tag version" and "Release title" and add some nice description.

AppVeyor then builds the package again, tests it and then pushes it to Chocolatey for approval.

## Making a new pre-release

The following steps describe the process to make a new pre-release package
for one of the release candidates of the Docker client.

#### 1. Update all files

First make sure you are in the `prerelease` branch.

    git checkout prerelease
    git pull

Run `./update.sh 1.12.0-rc5` and specify the new version of the Docker client. (The script works on Mac only at the moment).
This will update these files
  * docker.nuspec
  * appveyor.yml
  * tools/chocolateyInstall.ps1

#### 2. Create a branch

Create a branch and push it.

    git checkout -b update-docker-1.12.0-rc5
    git add docker.nuspec appveyor.yml tools/chocolateyInstall.ps1
    git push -u origin update-docker-1.12.0-rc5

#### 3. Create a pull request

With the new branch create a pull request **targeting the `prerelease` branch**.
Now check AppVeyor build status.

#### 4. Merge pull request

At GitHub merge the pull request into the `prerelease` branch if all the tests
from AppVeyor are green.

#### 5. Draft a pre-release

Now draft a new pre-release at https://github.com/ahmetalpbalkan/docker-chocolatey/releases/new
Enter eg. 1.12.0-rc5 in the field "Tag version" and "Release title" and add some nice description.
Remember to check the **This is a pre-release** checkbox.

AppVeyor then builds the package again, tests it and then pushes it to Chocolatey for approval.

## Approval Process

#### 6. Approval Process

If you are submitting a stable version, Chocolatey moderators need to
allow the package before it is published. This usually takes an hour or
so. (If it takes any longer, ping @ferventcoder).

If a package is **pre-release** (i.e. has `-rc1`, `-beta` like strings
in its version) then the submission also goes through automatic approval.

The difference is, users install stable packages with:

    choco install docker

and pre-release packages with:

    choco install docker -pre

command and Chocolatey usually prompts users with more confirmation
messages if the package is pre-release.

#### 7. Profit

Package will be published at https://chocolatey.org/packages/docker
