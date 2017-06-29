#!/bin/bash
# Build and test the docker NuGet package in a Windows container

docker build -t chocolatey - <<EOF
FROM microsoft/windowsservercore

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
EOF

docker run --rm -v C:$(pwd):C:/package -w C:/package chocolatey powershell -Command 'cpack ; .\test.ps1'
