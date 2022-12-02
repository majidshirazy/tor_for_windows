@echo off
NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO RUNASADMIN
GOTO INSTALLSERVICE

:RUNASADMIN
CD /d %~dp0
powershell -Command "Start-Process %~nx0 -Verb RunAs"
EXIT

:INSTALLSERVICE
sc stop Tor
sc delete Tor

CD /d %~dp0\..
IF EXIST "%PROGRAMDATA%\TOR" DEL /S /Q "%PROGRAMDATA%\TOR"
MKDIR "%PROGRAMDATA%\TOR"
XCOPY /EY "*" "%PROGRAMDATA%\TOR\"
RMDIR /Q /S %programdata%\TOR\scripts
sc create Tor start=auto binPath="%PROGRAMDATA%\TOR\tor.exe -nt-service -f %PROGRAMDATA%\TOR\torrc"
sc description Tor "This is the TOR Windows Service. It can be used by Bridges such as snowflake or obfs4 by editing TOR config file located in C:\ProgramData\Tor\torrc"
powershell -Command "net start Tor"

EXIT
