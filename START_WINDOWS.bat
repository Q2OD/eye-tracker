@echo off
setlocal
cd /d %~dp0

echo =====================================
echo Eye Tracker Setup (Automatic)
echo =====================================
echo.

REM ----------------------------
REM Check for Python
REM ----------------------------
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python not found.
    echo Downloading Python 3.9.6 installer...
    echo.

    set PYTHON_URL=https://www.python.org/ftp/python/3.9.6/python-3.9.6-amd64.exe
    set PYTHON_EXE=python-3.9.6-amd64.exe

    powershell -Command "Invoke-WebRequest -Uri '%PYTHON_URL%' -OutFile '%PYTHON_EXE%'"

    echo.
    echo IMPORTANT:
    echo When the installer opens:
    echo   1. CHECK 'Add Python to PATH'
    echo   2. Click 'Install Now'
    echo.
    echo The script will continue after install.
    pause

    start /wait %PYTHON_EXE

    echo.
    echo Python installed. Continuing...
    echo.
)

REM ----------------------------
REM Ensure pip works
REM ----------------------------
python -m ensurepip --upgrade >nul 2>&1
python -m pip install --upgrade pip

REM ----------------------------
REM Install Flask
REM ----------------------------
echo Installing Flask...
python -m pip install flask

REM ----------------------------
REM Run the app
REM ----------------------------
echo.
echo =====================================
echo Starting Eye Tracker
echo Open this in Chrome:
echo http://127.0.0.1:5000
echo =====================================
echo.

python app.py

pause
