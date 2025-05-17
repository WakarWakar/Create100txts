@echo off
setlocal

REM Ask for confirmation
set /p confirm=Are you sure you want to create 100 empty txt files in testfolderfulloftxt? (Y/N): 
if /i not "%confirm%"=="Y" goto :end

REM Create the subfolder if it doesn't exist
if not exist "testfolderfulloftxt" (
    mkdir "testfolderfulloftxt"
)

REM Create 100 empty txt files
for /l %%i in (1,1,100) do (
    type nul > "testfolderfulloftxt\file%%i.txt"
)

echo 100 empty txt files created in testfolderfulloftxt
: end
pause