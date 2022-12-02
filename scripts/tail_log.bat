@echo off

NET SESSION

powershell -Command "Get-Content C:\Tor\Log\notice.log -wait"

Pause
