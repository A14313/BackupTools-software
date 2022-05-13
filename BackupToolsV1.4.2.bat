@echo off
title BackupTools V1.4.2
color a
mode con:cols=110 lines=25
cls
REM begin of NEW LINE
set NLC=^


set NL=^^^%NLC%%NLC%^%NLC%%NLC%
REM end

:ADMIN-ACCESS
echo You may need to run this software as administrator
echo to avoid unnecessary errors and to perform the task without errors.
echo.
echo The administrator access is used to copy or mirror your files or
echo whatever you chose as an option.
echo.
echo If youre skeptical, you can view the source code in here or in github.
echo.
echo If you dont run this software as administrator, you can relaunch the software
echo and run as administrator
echo.
echo.
echo.
echo Please make sure to hit the correct key before pressing "Enter key" to avoid closing of the software
echo.

set /p adminaccess=Do you run this software as an administrator?%NL%%NL%Press Y for yes and N for no%NL%::
goto %adminaccess%

:Y
goto TERMS

:N
goto END3

:TERMS
cls
echo By accessing or using the service you agree that I am not responsible
echo of what will happen to your PC.
echo.
echo Incase you placed the source folder incorrect or
echo the destination folder is incorrect, this program might delete some files.
echo.
echo Just be careful of typing or pasting the correct directory and everything should be fine.
echo Read the instructions carefully before proceeding.

echo If you disagree with any part of the terms then you may NOT access the service.
echo.
echo Please make sure to hit the correct key before pressing "Enter key" to avoid closing of the software
echo.

set /p terms=Do you agree with the terms?%NL%%NL%Press Y for yes and N for no%NL%::
goto %terms%

:Y
goto SELECTION

:N
goto END2

:SELECTION
cls
echo What do you want to do?
echo 1 MIRROR/Backup files
echo 2 Copy files
echo 3 Move files
echo 4 Delete "File too long" error or delete all files from the directory
echo.
echo.
echo.
echo 8 Want to buy me some coffee?
echo 9 CREDITS
echo 0 to QUIT
echo.
echo.
echo.
echo Please keep in mind that the maximum process or maximum
echo run of this program is 3. For example: You ran this program and you chose
echo MIRROR/Backup files. If the folder is large, it will take some time to load.
echo However, you can run this program again and choose other services but only at the
echo maximum of 3. Got it?
echo.
echo Please make sure to hit the correct key before pressing "Enter key" to avoid closing of the software
echo.
set /p selection=Please input the number:%NL%::
goto %selection%

:1
set switch=/MIR
set word=MIRROR
set phrase1=This will MIRROR the files from Source to your Destination.
set phrase2=Please note that any files from your destination folder will be deleted and MIRROR the Source folder.
set phrase3=This might delete some files if you typed the source or destination incorrect.
set phrase4=.
set phrase4_1=.
goto ROBOCOPY

:2
set word=COPY
set phrase1=This will COPY the files from Source to your Destination.
set phrase2=Please note that any files from your destination folder will NOT be deleted and ONLY COPY the Source folder.
set phrase3=.
set phrase4=.
set phrase4_1=.
goto COPY

:3
set switch=/MOVE
set word=MOVE
set phrase1=This will MOVE the files from Source to your Destination and OVERWRITE the files.
set phrase2=It will DELETE the files from source after moving all files to the destination.
set phrase3=This might delete some files if you typed the source or destination incorrect.
set phrase4=If you noticed that some files are still there from the Source folder, it means the program
set phrase4_1=detected that it is the same file to the destination. So there is no sense of moving that file.
goto ROBOCOPY

:4
goto FILETOOLONG

:8
start https://www.paypal.me/carloautor
goto SELECTION

:9
start https://www.instagram.com/invites/contact/?i=6fxx5w0ei866&utm_content=tysqnl
goto SELECTION

:0
goto END


REM ROBOCOPY START
:ROBOCOPY
goto SRC

:SRC
cls
set /p src=Where is your source?%NL%::
IF NOT EXIST "%src%" (
color c
echo The source directory does not exist
pause
goto QUESTION1
) ELSE (
echo.
goto DEST)

:DEST
set /p dest=Where is your destination?%NL%::
IF NOT EXIST "%dest%" (
color c
echo The destination directory does not exist
pause
goto QUESTION2
) ELSE (
goto CONFIRMATION)

:CONFIRMATION
cls
echo Are you sure you want to run this %word% script?
echo %phrase1%
echo %phrase2%
echo.
echo Please review the source and destination before proceeding.
echo %phrase3%
echo.
echo %phrase4%
echo %phrase4_1%
echo.
echo Here's what you've typed so far
echo Source = %src%
echo Destination = %dest%
echo.
set /p confirmation=Are you sure you want to run this script?%NL%%NL%Press Y for yes and N for no%NL%::
goto %confirmation%

:Y
goto ROBO

:N
goto QUESTION1

:ROBO
ROBOCOPY "%src%" "%dest%" /E /ZB /COPY:DATOU /DCOPY:DAT /R:3 /W:3 /LOG:"%dest%\COPYLOG.TXT" %switch%
pause
goto QUESTIONSTARTOVER

:QUESTION1
color a
cls
set /p question1=Do want to input the source again?%NL%%NL%Press Y for yes and N for no%NL%M to go back to main menu%NL%::
goto %question1%

:Y
goto SRC

:N
goto END

:M
cls
goto SELECTION

:QUESTION2
color a
cls
set /p question2=Do want to input the destination again?%NL%%NL%Press Y for yes and N for no%NL%M to go back to main menu%NL%::
goto %question2%

:Y
goto DEST

:N
goto END

:M
cls
goto SELECTION


REM ROBOCOPY END====================================================

REM start of Copy Script===============================
:COPY
goto SRC2

:SRC2
cls
set /p src2=Where is your source?%NL%::
IF NOT EXIST "%src2%" (
color c
echo The source directory does not exist
pause
goto QUESTION1
) ELSE (
echo.
goto DEST2)

:DEST2
set /p dest2=Where is your destination?%NL%::
IF NOT EXIST "%dest2%" (
color c
echo The destination directory does not exist
pause
goto QUESTION2
) ELSE (
goto CONFIRMATION)

:CONFIRMATION
cls
echo Are you sure you want to run this %word% script?
echo %phrase1%
echo %phrase2%
echo.
echo Please review the source and destination before proceeding.
echo %phrase3%
echo.
echo %phrase4%
echo %phrase4_1%
echo.
echo Here's what you've typed so far
echo Source = %src2%
echo Destination = %dest2%
echo.
set /p confirmation=Are you sure you want to run this script?%NL%%NL%Press Y for yes and N for no%NL%::
goto %confirmation%

:Y
goto ROBO

:N
goto QUESTION1

:ROBO
ROBOCOPY "%src2%" "%dest2%" /E /ZB /COPY:DATOU /DCOPY:DAT /R:3 /W:3 /LOG:"%dest2%\COPYLOG.TXT"
pause
goto QUESTIONSTARTOVER

:QUESTION1
color a
cls
set /p question1=Do want to input the source again?%NL%%NL%Press Y for yes and N for no%NL%M to go back to main menu%NL%::
goto %question1%

:Y
goto COPY

:N
goto END

:M
cls
goto SELECTION

:QUESTION2
color a
cls
set /p question2=Do want to input the destination again?%NL%%NL%Press Y for yes and N for no%NL%M to go back to main menu%NL%::
goto %question2%

:Y
goto DEST2

:N
goto END

:M
cls
goto SELECTION


REM END of COPY Script==============================================

REM start of File too long tool===============================
:FILETOOLONG
cls
set /p toolongfolder=Where is the directory that has "file too long" error or the directory that you want to delete?%NL%::
IF NOT EXIST "%toolongfolder%" (
color c
echo The folder does not exist
pause
goto QUESTION1
) ELSE (
goto CONFIRMATION)

:CONFIRMATION
cls
echo Are you sure you want to run this script?
echo This will delete all the files and folders from the directory that you typed.
echo.
echo Please review the directory before proceeding.
echo This might delete ALL files and folders if you typed directory incorrect.
echo.
echo Here's what you've typed so far
echo Directory = %toolongfolder%
echo.
set /p confirmation=Are you sure you want to run this script?%NL%%NL%Press Y for yes and N for no%NL%::
goto %confirmation%

:Y
goto CHECKING

:N
goto QUESTION1

:CHECKING
IF EXIST "%TEMP%\empty_folder" (
rd /Q /S "%TEMP%\empty_folder"
goto ROBO
) ELSE (
goto ROBO)

:ROBO
mkdir "%TEMP%\empty_folder"
ROBOCOPY "%TEMP%\empty_folder" "%toolongfolder%" /MIR
rd /Q /S "%TEMP%\empty_folder"
pause
goto QUESTIONSTARTOVER

:QUESTION1
cls
color a
cls
set /p question1=Do want to input the directory again?%NL%%NL%Press Y for yes and N for no%NL%M to go back to main menu%NL%::
goto %question1%

:Y
goto FILETOOLONG

:N
goto END

:M
cls
goto SELECTION


REM END of File too long tool==============================================

:QUESTIONSTARTOVER
color a
cls
set /p question3=Do want to go back to main menu?%NL%%NL%Press Y for yes and N for no%NL%::
goto %question3%

:Y
cls
goto SELECTION

:N
goto END


:END
color a
cls
set /p question4=Are you sure you want to exit?%NL%%NL%Press Y for yes and N for no%NL%::
goto %question4%

:Y
exit

:N
cls
goto SELECTION

:END2
color a
cls
set /p question4=Are you sure you want to exit?%NL%%NL%Press Y for yes and N for no%NL%::
goto %question4%

:Y
exit

:N
cls
goto TERMS

:END3
color a
cls
set /p question4=Are you sure you want to exit?%NL%%NL%Press Y for yes and N for no%NL%::
goto %question4%

:Y
exit

:N
cls
goto ADMIN-ACCESS