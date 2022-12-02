# TOR For Microsoft Windows

## About
This is the TOR Windows Service. It can be used by Bridges such as snowflake or obfs4 by editing TOR config file located in C:\ProgramData\Tor\torrc
By Using TOR you can surf the web anonymously. This program and it's scripts has been Tested on WIndows 10 and 11.

## Requirements
    - Windows version up to 10 and later
    - An internet link


## Installation

For install I have made some batch file located in .\scripts directory.
Use `install_service.bat` to install Tor files in your profile program data and install as a service into windows services to automated starting.
Use `service_restart.bat` to restart Tor service. As you may know you can start, stop and restart by CMD commands yourself.
As you may know Windows does not have tail in bash so I use `Get-Content` in powershell and you can use `tail_log.bat` to see and tail the logs.
