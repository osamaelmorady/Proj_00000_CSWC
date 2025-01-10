@echo off
echo Setting up the environment...

rem Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Python is not installed. Please install Python first.
    pause
    exit /b
)

rem Create a virtual environment
echo Creating a virtual environment...
python -m venv venv

rem Activate the virtual environment
echo Activating the virtual environment...
call venv\Scripts\activate

rem Install required libraries
echo Installing required libraries...
pip install --upgrade pip
pip install -r requirements.txt

echo Setup complete.
pause