@echo off
setlocal enabledelayedexpansion

REM Get the name of this script to ignore it
set "BATCHNAME=%~nx0"

REM Prompt for user input suffix
set /p SUFFIX=Enter the suffix to append to each file name: 

set COUNT=0

for %%F in (*.*) do (
    REM Ignore this script itself
    if /i not "%%~nxF"=="%BATCHNAME%" (
        set "EXT=%%~xF"
        set "NAME=%%~nF"
        set "NEWNAME=!COUNT!!SUFFIX!%%~xF"
        if exist "!NEWNAME!" (
            echo WARNING: Target file "!NEWNAME!" already exists. Skipping "%%F".
        ) else (
            echo Renaming: "%%F"  --^>  "!NEWNAME!"
            ren "%%F" "!NEWNAME!"
            set /a COUNT+=1
        )
    )
)

echo Done!
pause