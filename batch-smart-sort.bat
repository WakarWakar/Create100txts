@echo off
setlocal enabledelayedexpansion

REM Define extension groups
set "videos=mp4 avi mov mkv wmv flv webm m4v"
set "images=jpg jpeg png gif bmp tiff svg webp"
set "documents=pdf doc docx xls xlsx ppt pptx txt rtf odt ods odp csv"
set "music=mp3 wav flac aac ogg m4a wma"
set "archives=zip rar 7z tar gz bz2 iso"

REM Loop through all files in the current directory
for %%f in (*.*) do (
    set "ext=%%~xf"
    set "ext=!ext:~1!"

    REM Only process if not a .bat file
    if /I not "!ext!"=="bat" (
        set "dest_folder="

        REM Check videos
        for %%v in (%videos%) do (
            if /I "!ext!"=="%%v" (
                set "dest_folder=sorted_videos"
            )
        )

        REM Check images
        if "!dest_folder!"=="" (
            for %%i in (%images%) do (
                if /I "!ext!"=="%%i" (
                    set "dest_folder=sorted_images"
                )
            )
        )

        REM Check documents
        if "!dest_folder!"=="" (
            for %%d in (%documents%) do (
                if /I "!ext!"=="%%d" (
                    set "dest_folder=sorted_documents"
                )
            )
        )

        REM Check music
        if "!dest_folder!"=="" (
            for %%m in (%music%) do (
                if /I "!ext!"=="%%m" (
                    set "dest_folder=sorted_music"
                )
            )
        )

        REM Check archives
        if "!dest_folder!"=="" (
            for %%a in (%archives%) do (
                if /I "!ext!"=="%%a" (
                    set "dest_folder=sorted_archives"
                )
            )
        )

        REM If not matched, move to sorted_others
        if "!dest_folder!"=="" (
            set "dest_folder=sorted_others"
        )

        if not exist "!dest_folder!" mkdir "!dest_folder!"

        set "filename=%%~nf"
        set "fileext=%%~xf"
        call :get_unique_name "!dest_folder!" "!filename!" "!fileext!" newname
        move "%%f" "!dest_folder!\!newname!"
    )
)

echo Done sorting files!

REM Remove empty sorting folders
for %%d in (sorted_videos sorted_images sorted_documents sorted_music sorted_archives sorted_others) do (
    if exist "%%d" (
        rd "%%d" 2>nul
    )
)

pause

goto :eof

:get_unique_name
REM %1=folder, %2=filename, %3=ext, %4=outputvar
setlocal enabledelayedexpansion
set "folder=%~1"
set "name=%~2"
set "ext=%~3"
set "candidate=!name!!ext!"
set count=1
:check_unique
if exist "!folder!\!candidate!" (
    set "candidate=!name!(!count!)!ext!"
    set /a count+=1
    goto :check_unique
)
endlocal & set "%~4=%candidate%"
goto :eof
