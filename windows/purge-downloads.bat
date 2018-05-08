REM script to purge Downloads from time to time

@echo off
SET days=400
SET folderpath=%HOMEPATH%\Downloads

::Delete files older than N days
forfiles /p %folderpath% /s /D -%days% /C "cmd /c del /q @path"

::Delete empty folders
cd %folderpath%
for /f "delims=" %%d in ('dir /ad/b/s ^| sort /R') do rd "%%d"
