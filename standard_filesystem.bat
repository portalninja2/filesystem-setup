@echo off
@title Ordner erstellen
mkdir Dokumente
mkdir Bilder
mkdir Videos
mkdir BackUP's
mkdir Scripts
mkdir Musik
mkdir Zip's
mkdir apps
mkdir Scripts\vorgefertigt
mkdir Scripts\bearbeitung
mkdir Scripts\fertig
mkdir Scripts\neu

echo Ordner Setup fertig. (Wenn das Script fortgesetzt werden soll, beliebige Taste druecken)
pause >nul
cls

:Auswahlmenue
@title USB-Stick-Setup
cls
echo.
echo Treffe eine Auswahl
echo =====================
echo.
echo [1]Notizen Setup
echo [2]Passwort Setup
echo [3]Ockla Setup
echo [4]Programm Setup
echo [5]Script Setups
echo [f]Finish Setup
echo.

set asw=0
set /p asw="Bitte eine Auswahl treffen: "

if %asw%==1 goto NoteSetup
if %asw%==2 goto PasswordSetup
if %asw%==3 goto OcklaSetup
if %asw%==4 goto ProgrammSetup
if %asw%==5 goto ScriptSetups
if %asw%==f goto FinishSetup
if %asw%==exit goto END
goto Auswahlmenue

:NoteSetup
echo Coming soon
pause >nul
goto Auswahlmenue

:PasswordSetup
echo Coming soon
pause >nul
goto Auswahlmenue

:OcklaSetup
echo Coming soon
pause >nul
goto Auswahlmenue

:ProgrammSetup
cls
@title PortableDownload
cd apps
curl https://www.heise.de/download/product/portableapps.com-platform-portableapps-suite-38804/download/danke?id=92a6a080-8e66-4959-8687-a5a0e870fca7 --ssl-no-revoke
cls
:QOpenPortable
@title PortableInstallation
echo Soll es geöffnet werden?
echo ============================
echo.
echo y/n y=Ja =Nein

set yn=0
set /p y/n="N/y: "

if %yn%==y goto openportable
if %yn%==n goto no
goto Auswahlmenue

:no
goto Auswahlmenue

:yes
goto openportable

:openportable
apps\portable.exe
pause >nul
goto Auswahlmenue

:ScriptSetups
echo Coming soon
pause >nul
goto Auswahlmenue

:FinishSetup
cd Scripts
move ../standard_filesystem.bat old_setup.bat
END

:END
echo bye
pause >nul
exit
