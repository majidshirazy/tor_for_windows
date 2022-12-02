@echo off
NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO RUNASADMIN
GOTO RESTARTSERVICE

:RUNASADMIN
CD /d %~dp0
powershell -Command "Start-Process %~nx0 -Verb RunAs"
EXIT

:RESTARTSERVICE
powershell -Command "net stop Tor"
powershell -Command "net start Tor"

pause