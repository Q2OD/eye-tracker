@echo off
cd /d %~dp0
echo Starting local server...
echo Open this in Chrome: http://127.0.0.1:8000
echo.
caddy.exe file-server --listen :8000 --root .
pause
