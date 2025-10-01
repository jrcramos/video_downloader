# Video Downloader

A Windows batch script that uses yt-dlp to download videos from YouTube and other supported platforms.

## Prerequisites

Before using this script, you need to have the following installed:

1. **yt-dlp**: Download from [https://github.com/yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp)
2. **ffmpeg**: Download from [https://ffmpeg.org/download.html](https://ffmpeg.org/download.html)
   - Extract ffmpeg to `C:\ffmpeg` so binaries are in `C:\ffmpeg\bin`

## Setup

1. Edit the `downloader.bat` file and update the following paths to match your system:

```batch
set "ytDlp=C:\Users\joao3\Videos\yt-dlp-master"     :: Path where yt-dlp.exe is located
set "cookies=C:\Users\joao3\Videos\yt-dlp-master"   :: Path where chrome cookie file is located
set "saveLocation=C:\Users\joao3\Videos"            :: Path where videos will be saved
set "ffmpeg=C:\ffmpeg"                               :: Path where ffmpeg is installed (binaries in bin subfolder)
```

2. **(Optional)** If you want to use browser cookies for authentication:
   - Place your Chrome cookies file in the cookies directory
   - The script expects a file named `chrome` in the cookies path

## Usage

1. Double-click `downloader.bat` to run the script
2. When prompted, enter:
   - **Video URL** (required): The URL of the video you want to download
   - **File name** (optional): Custom name for the output file. Press Enter to use the video's original title
   - **Referer URL** (optional): Only needed for some sites that require a referer header. Press Enter to skip

### Example

```
================================
 YouTube Downloader Script
================================

Enter video URL: https://www.youtube.com/watch?v=example
Enter file name (optional, press Enter to use video title): my_video
Enter Referer URL (optional, press Enter to skip):
```

## Features

- Downloads best quality video and audio, then merges them
- Downloads all available subtitles
- Remuxes video to MP4 format
- Supports multiple audio streams
- Uses Chrome cookies for authenticated downloads
- Allows custom output filenames
- Supports sites requiring Referer headers
- Continuous mode: Can download multiple videos without restarting the script

## Troubleshooting

### "yt-dlp is not recognized"
- Verify the `ytDlp` path in the script points to the correct location of `yt-dlp.exe`

### "ffmpeg not found"
- Ensure ffmpeg is installed at `C:\ffmpeg` with binaries in `C:\ffmpeg\bin`
- Or update the `ffmpeg` path in the script to your installation location

### Download fails with authentication error
- Make sure the `chrome` cookie file exists in the cookies directory
- Try extracting fresh cookies from your browser

## License

This project is provided as-is for personal use.

