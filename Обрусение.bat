@echo off
setlocal

REM Укажите URL для скачивания нового файла
set "fileUrl=https://gist.githubusercontent.com/dykomenko/07d7528d4dd970afec98aa3e407ef84d/raw/efb078978e1af92e411c68a0604f643e582041df/citadel_gc_russian.txt"

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
