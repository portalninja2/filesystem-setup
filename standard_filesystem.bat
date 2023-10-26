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
mkdir Scripts\modules
mkdir Scripts\bearbeitung
mkdir Scripts\fertig
mkdir Scripts\neu
mkdir BackUP's\local
mkdir BackUP's\remote
cls

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
echo [b]BackUP's
echo [m]Module Setup
echo.
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
if %asw%==b goto backupmenue
if %asw%==m goto modules
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
move standard_filesystem.bat Scripts\old_setup.bat
goto END

:backupmenue
@title BackUP's
cls
echo BackUP Aktionen:
echo =====================
echo [c] Erstellen eines lokalen BackUP's (Diese Instanz)
echo [r] BackUP von einem Link erstellen
echo [m] BackUP von einem anderen Datenträger erstellen
echo [g] BackUP wiederherstellen (lokal)
echo [gr] BackUP wiederherstellen (Remote)

echo.

set basw=0
set /p basw="Triff eine Auswahl: "

if %basw%==c goto lcbackup
if %basw%==r goto rcbackup
if %basw%==g goto lwbackup
if %basw%==gr goto rwbackup
if %basw%==back goto Auswahlmenue

:lcbackup

echo Beta!
set name=0
set /p name="Trage deinen Zusatz Namen ein: "
set "name=LocalUSB-%name%.zip"
set "files=apps Bilder Dokumente Musik	Scripts	Videos	Zip's USB-Modules.bat Setup.bat filesystem_script.bat"
tar -c -f BackUP's\local\%name% %files%

pause
goto backupmenue

:rcbackup
echo coming soon
pause
goto backupmenue

:lwbackup
echo coming soon
pause
goto backupmenue

:rwbackup
echo coming soon
pause
goto backupmenue

:modules
@title module-Setup
cls
curl --output USB-Modules.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/start.bat --ssl-no-revoke
pause >nul
goto Auswahlmenue

:END
echo bye
pause >nul
exit
