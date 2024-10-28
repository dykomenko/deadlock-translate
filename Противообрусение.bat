@echo off
setlocal

REM Укажите URL для скачивания нового файла
set "fileUrl=https://gist.githubusercontent.com/dykomenko/38bba6df365afc0d0a0eb657d85b0271/raw/3fa7e358f8331eadc40762f7dad5999e8a3bee44/citadel_gc_russian.txt"

REM Укажите путь к папке, где нужно заменить файл
set "targetPath=%~dp0game\citadel\resource\localization\citadel_gc"

REM Временное имя для скачанного файла
set "tempFile=%temp%\citadel_gc_russian.txt"

REM Скачивание файла с помощью curl
curl -o "%tempFile%" "%fileUrl%"

REM Проверка, скачан ли файл успешно
if exist "%tempFile%" (
    REM Замена существующего файла
    move /y "%tempFile%" "%targetPath%"
    echo Файл успешно заменен.
) else (
    echo Ошибка скачивания файла.
)

endlocal
pause
