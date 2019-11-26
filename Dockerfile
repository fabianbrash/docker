FROM mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

#RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*

RUN mkdir C:\inetpub\wwwroot\eating

#Note single quotes are required if you use double you will get an error???

RUN powershell -NoProfile -Command New-WebVirtualDirectory -Site 'Default Web Site' -Name Eatery -PhysicalPath C:\inetpub\wwwroot\eating

RUN powershell -NoProfile -Command Set-WebConfigurationProperty -Filter /system.webserver/directoryBrowse -Name enabled -Value True -PSPath 'IIS:\Sites\Default Web Site\Eatery'

WORKDIR /inetpub/wwwroot/eating

COPY content/ .
