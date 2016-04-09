# windows-triage
A simple Windows triage for incident response

It collects processes, services, startups, browsing histories, last acitivities, system and security event logs, autoruns registry, task scheduler and memory.

Thanks to Sysinternals for pslist, psloglist and autorunsc.
- Event logs play important role in timeline analysis when there is no proxy log.

Thanks to NirSoft for browsinghistoryview and lastactivityview.
- Browsing history is important especially exploitation took place through web browser plugins.

Thanks to MoonSols for DumpIt.
- When doing live response, memory of the machine is important due to malware could runs in memory.
