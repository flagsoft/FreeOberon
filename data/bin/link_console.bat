@ECHO OFF
REM This script is run by Free Oberon on Windows. Current directory of the
REM script will be where FreeOberon.exe is located. This particular script
REM is for console programs.
CD bin >nul 2>&1
@DEL /s %~n1.exe >nul 2>&1
SET CURDIR=%~dp0
SET ONAME=%~n1
SET PATH=%CURDIR%voc\bin;%CURDIR%mingw32\bin;%PATH%

REM Put all arguments starting from 2nd to ARGS.
SHIFT
SET ARGS=%1
SHIFT
:START
IF [%1] == [] GOTO FINISH
SET ARGS=%ARGS% %1
SHIFT
GOTO START
:FINISH
REM END Put all... ARGS.

ECHO ON
gcc -fPIC -g -I "%CURDIR%voc\C\include"^
 -o %ONAME%.exe %ONAME%.o^
 %ARGS%^
 "%CURDIR%voc/lib/Int.o"^
 -L"%CURDIR%voc\lib" -lvoc-OC -lmingw32
@SET RETCODE=%ERRORLEVEL%
@EXIT /b %RETCODE%
