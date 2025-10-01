@echo off
:: Check for Admin Privileges
::net session >nul 2>&1
::if %errorLevel% neq 0 (
::    echo Requesting administrative privileges...
::    powershell -Command "Start-Process '%0' -Verb RunAs"
::    exit /b
::)

setlocal enabledelayedexpansion

:input_loop
:: cls
echo ================================
echo  YouTube Downloader Script
echo ================================
echo.
set /p argument2="Enter argument2 (video URL): "
set /p argument1="Enter argument1 (file name): "
set /p argument3="Enter argument3 (optional Referer URL, press Enter to skip): "


:: Set paths from environment variables or manually
set "ytDlp=C:\Users\joao3\Videos\yt-dlp-master"
set "cookies=C:\Users\joao3\Videos\yt-dlp-master"
set "saveLocation=C:\Users\joao3\Videos"
set "ffmpeg=C:\ffmpeg"

:: Set output filename template
if "%argument1%"=="" (
    set "outputTemplate=%saveLocation%\%%(title)s.%%(ext)s"
) else (
    set "outputTemplate=%saveLocation%\%argument1%.%%(ext)s" 
)


:: Check if argument2 is empty (required field)
if "%argument2%"=="" (
    echo.
    echo ERROR: Video URL is required!
    echo Press any key to retry...
    pause >nul
    goto input_loop
)


:: Check if argument3 is provided
if "%argument3%"=="" (
    echo Running first download command...
    "%ytDlp%\yt-dlp.exe" --newline -i --all-subs -o "!outputTemplate!" --ignore-config --hls-prefer-native -f bestvideo+bestaudio/b --cookies "%cookies%\chrome" --buffer-size 16k --no-warning --remux-video mp4 --audio-multistreams --sub-langs all --ffmpeg-location "%ffmpeg%\bin" "%argument2%"
) else (
    echo Running second download command...
    "%ytDlp%\yt-dlp.exe" -o "!outputTemplate!" --add-header "Referer: %argument3%" --add-header "Origin: %argument3%" --add-header "User-Agent: Mozila/5.0" "%argument2%"
)

echo.
echo Download process completed.
echo Press any key to download another video...
:: pause >nul
goto input_loop


