FROM mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*

WORKDIR /inetpub/wwwroot

COPY content/ .

#https://github.com/Microsoft/iis-docker/blob/master/windowsservercore-ltsc2019/Dockerfile
