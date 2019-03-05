@echo off
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%_%ldt:~8,2%-%ldt:~10,2%-%ldt:~12,2%

SET date=%ldt%

SET what=
setlocal enabledelayedexpansion
FOR %%i IN (%*) do SET what=!what!, %%i
SET what=%what:~1%

SET where=%~nx1


REM echo powershell Compress-Archive -Path %what% -DestinationPath "%date%_%where%.zip" -Force 
powershell Compress-Archive -Path %what% -DestinationPath "%date%_%where%.zip" -Force 

REM timeout 30


