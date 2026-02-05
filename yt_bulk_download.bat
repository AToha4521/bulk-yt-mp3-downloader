@echo off
Title .: Bulk Youtube Audio Downloader from Playlist:. 
REM Check if yt-dlp is available in PATH
where yt-dlp >nul 2>&1
if errorlevel 1 (
    echo yt-dlp is not installed or not found in your PATH.
    echo Please download and install yt-dlp from:
    echo https://github.com/yt-dlp/yt-dlp
    echo After installation, make sure yt-dlp.exe is in your PATH or in C:\Windows\System32.
    echo.
    pause
    exit /b
)

REM yt-dlp found, continue
cd /d "%~dp0"

yt-dlp ^
--cookies-from-browser Firefox ^
-f bestaudio ^
--extract-audio ^
--audio-format mp3 ^
--audio-quality 0 ^
--embed-metadata ^
--embed-thumbnail ^
--add-metadata ^
--parse-metadata "title:%(title)s" ^
--parse-metadata "artist:%(uploader)s" ^
--parse-metadata "album:%(playlist_title)s" ^
--parse-metadata "track_number:%(playlist_index)s" ^
--restrict-filenames ^
--yes-playlist ^
--no-video ^
-o "%%(playlist_title)s\%%(playlist_index)02d - %%(title)s.%%(ext)s" ^
"https://www.youtube.com/playlist?list=PL0wqt_um4x0bsdViTJBmnl6KGMoSqxfZy"

pause
