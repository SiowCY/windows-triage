@echo off
REM Note: Please run as Administrator
REM A simple Windows Triage to capture important information when performing incident response. 
REM Modify the script base on your environment.
REM Thanks Sysinternal and NirSoft for excellent tools

echo Output results will store in TriageOutput
set mypath=%~dp0
mkdir %mypath%\TriageOutput

echo Collecting process, service and startup via WMIC
wmic process list full > "%mypath%\TriageOutput\wmic-process.txt"
wmic /output:"%mypath%\TriageOutput\wmic-process.csv" process list full /format:csv
wmic service list full > "%mypath%\TriageOutput\wmic-service.txt"
wmic /output:"%mypath%\TriageOutput\wmic-service.csv" service list full /format:csv
wmic startup list full > "%mypath%\TriageOutput\wmic-startup.txt"
wmic /output:"%mypath%\TriageOutput\wmic-startup.csv" startup list full /format:csv

echo Collecting DNS Cache and Netstats
ipconfig /displaydns > "%mypath%\TriageOutput\dnscache.txt"
netstat -abno > "%mypath%\TriageOutput\netstats.txt"

echo Collecting browsing history and last activities
"%mypath%\BrowsingHistoryView.exe" /sverhtml "%mypath%\TriageOutput\browserhistory.html"
"%mypath%\BrowsingHistoryView.exe" /scomma "%mypath%\TriageOutput\browserhistory.csv"
"%mypath%\LastActivityView.exe" /shtml "%mypath%\TriageOutput\lastactivity.html"
"%mypath%\LastActivityView.exe" /scomma "%mypath%\TriageOutput\lastactivity.csv"

echo Collecting event logs, autoruns, process list and tcp log via sysinternals
psloglist.exe -s /accepteula > "%mypath%\TriageOutput\system-event.csv"
psloglist.exe -s Security /accepteula > "%mypath%\TriageOutput\security-event.csv"
autorunsc.exe -c /accepteula > "%mypath%\TriageOutput\autostart.csv"
autorunsc.exe -a t -c /accepteula > "%mypath%\TriageOutput\taskschduler.csv"
pslist.exe -t /accepteula > "%mypath%\TriageOutput\processlist.txt"

