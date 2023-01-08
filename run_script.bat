@echo off
SETLOCAL EnableDelayedExpansion



copy examplePath.txt getPath.txt
echo.
echo  __     __       ______ ____ _____ _   _ ______   __  ___ ____  _____  ____  ____  _    _  ___
echo  \ \   / //\    / ____/ ____^|_   _^| \ ^| ^|  ____^| ^|  \/  ^|  ____^|___  / ____^|/ __ \^| ^|  ^| ^|  __ \
echo   \ \_/ //  \  ^| (___^| (___   ^| ^| ^|  \^| ^| ^|__    ^| \  / ^| ^|__     / / ^|  __^| ^|  ^| ^| ^|  ^| ^| ^|__) ^|
echo    \   // /\ \  \___ \\___ \  ^| ^| ^| . ` ^|  __^|   ^| ^|\/^| ^|  __^|   / /^| ^| ^|_ ^| ^|  ^| ^| ^|  ^| ^|  _  /
echo     ^| ^|/ ____ \ ____) ^|___) ^|_^| ^|_^| ^|\  ^| ^|____  ^| ^|  ^| ^| ^|____ / /_^| ^|__^| ^| ^|__^| ^| ^|__^| ^| ^| \ \
echo     ^|_/_/    \_\_____/_____/^|_____^|_^| \_^|______^| ^|_^|  ^|_^|______/_____\_____^|\____/ \____/^|_^|  \_\
echo.
echo.


rem Check if the Path variable contains the path to python.exe
echo %Path% | find /i "python" > nul
IF %ERRORLEVEL% NEQ 0 (
  echo Python is not in the Path variable T-T
  timeout /t 1 /nobreak >nul
  echo No worries i'll help you on setting variables, but just help can't get controls from here.
  timeout /t 1 /nobreak >nul
  echo Read the requirements part of the README.md
  set readme=README.md
  start %readme%
) ELSE (
  echo Python is in the Path variable
  timeout /t 1 /nobreak >nul
)
timeout /t 2


echo.
echo.
echo.
echo  ================================================================================
echo ^|                         Installing libraries                                  ^|
echo  ================================================================================
echo.
echo.
call PyLibraries.bat
echo  ================================================================================
echo ^|                         Let's start by initiating variables                  ^|
echo  ================================================================================
echo ^|                     let's check which browser you are using :                ^|
echo ^|                         - Chrome         =      1                            ^|
echo ^|                         - Firefox        =      2                            ^|
echo ^|                         - Microsoft Edge =      3                            ^|
echo  ================================================================================
set /p browserInput=Select browser:
echo.
echo.
echo.
timeout /t 0.5 /nobreak >nul
echo  ================================================================================
echo ^|   Now for the website you want to scrap,                                     ^|
echo ^|           1- Split the website by the number page                            ^|
echo ^|           2- Let's give an example 'www.example.com/more/page=1/test'        ^|
echo ^|           3- link1=www.example.com/more/page=                                ^|
echo ^|           4- link2=/test                                                     ^|
echo  ================================================================================
echo.
echo.
echo.
set /p first_part_website=link1 :
set /p second_part_website=link2 (if there is nothing after the page number just press enter):
IF "%second_part_website%" == "" (
    set second_part_website="404**"
)

echo.
echo.
echo.

set /p project_name=Give your project a Name (you will find all your files on the outputFiles/{given name}) :
md outputFiles\%project_name%
echo.
set /p n_page1=First page number :
set /p n_page2=Last page number  :
echo.
echo.
echo.
echo  =============================================================================\
echo  ==============================================================================\
echo  ===============================================================================\
echo  ================================================================================\
echo  =================================================================================\
echo  ==================================================================================\
echo ^On this project we are using the xpath to refer which element we want to extract
echo If u don't know how to get the xpath here is an example : https://youtu.be/JanCuJSAzhc?t=142
echo.
echo.
echo.
timeout /t 0,5 /nobreak >nul

set /p ready=(when u ready press any key) ...
start getPath.txt
set /p ready=(when u ready press any key) ...


set dir=ouputFiles/%project_name%
rem if exist getPath.txt del getPath.txt



echo.
echo.
python "main.py" %*
move results.xlsx outputFiles\%project_name%
start outputFiles\%project_name%\results.xlsx
pause