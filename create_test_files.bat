@echo off

REM Create folder and change directory
mkdir create_test_files_folder
cd create_test_files_folder

REM Videos
echo Video file > test_video.mp4
echo Video file > test_clip.avi
echo Video file > test_movie.mkv

REM Images
echo Image file > test_image.jpg
echo Image file > test_picture.png
echo Image file > test_graphic.gif

REM Documents
echo Document file > test_doc.docx
echo Document file > test_sheet.xlsx
echo Document file > test_slide.pptx
echo Document file > test_text.txt
echo Document file > test_pdf.pdf

REM Music
echo Music file > test_song.mp3
echo Music file > test_audio.wav

REM Archives
echo Archive file > test_archive.zip
echo Archive file > test_backup.rar

REM Others
echo Other file > test_script.py
echo Other file > test_data.json
echo Other file > test_config.ini

echo Test files created!
pause
