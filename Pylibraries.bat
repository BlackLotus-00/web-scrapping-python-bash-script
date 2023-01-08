@echo off

echo Checking for required libraries...
set requirements=requirements.txt

pip freeze | findstr /i requirements > nul

if %errorlevel% == 0 (
  echo Required libraries are installed.
) else (
  echo Required libraries are NOT installed.
  echo Installing libraries...
  pip install -r %requirements%
)

echo Done.
pause