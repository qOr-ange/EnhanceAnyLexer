@echo off
cd %CURRENT_DIRECTORY%

:: config this as you please.
set PROJECT=EnhanceAnyLexer
set ARCH=x64
set CC=gcc

set NPPPATH=%CD%\%ARCH%
set PLUGIN_DIR=%NPPPATH%\plugins\%PROJECT%

if not exist "%PLUGIN_DIR%" (
    mkdir "%PLUGIN_DIR%"
)

set PLUGIN_PATH=%PLUGIN_DIR%\%PROJECT%.dll

set COMPILER_FLAGS=-prod -d static_boehm -gc boehm -keepc -enable-globals -shared -d no_backtrace -cflags -static-libgcc

if "%ARCH%"=="x64" (
    if "%CC%"=="gcc" (
        v -cc %CC% %COMPILER_FLAGS% -o %PLUGIN_PATH% .
    )
) else (
    if "%CC%"=="gcc" (
        set PATH=D:\ProgramData\Compiler\mingw32\bin
        v -cc %CC% -m32 -g %COMPILER_FLAGS% -o %PLUGIN_PATH% .
        set PATH=
    )
)
pause
