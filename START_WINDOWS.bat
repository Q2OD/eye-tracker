@echo off
setlocal

REM Always run from this script's folder (works even if launched from Outlook/shortcut)
set "ROOT=%~dp0"
cd /d "%ROOT%" || (
  echo ERROR: Could not open project folder:
  echo %ROOT%
  pause
  exit /b 1
)

echo =====================================
echo Eye Tracker Setup
echo =====================================
echo Folder: %CD%
echo.

REM ----------------------------
REM Check Python
REM ----------------------------
python --version >nul 2>&1
if %errorlevel% neq 0 (
  echo Python is NOT installed (or not added to PATH).
  echo.
  echo Step 1: Install Python 3.9+:
  echo - When installer opens, CHECK "Add Python to PATH"
  echo - Then click Install
  echo.
  echo Opening Python download page now...
  start "" "https://www.python.org/downloads/windows/"
  echo.
  echo After installing, CLOSE this window and run START_WINDOWS.bat again.
  pause
  exit /b 0
)

echo Python found
