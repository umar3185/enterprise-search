@REM @echo off

@REM set NODE_OPTIONS=--max_old_space_size=8192

@REM echo.
@REM echo Restoring backend python packages
@REM echo.
@REM call python -m pip install -r requirements.txt
@REM if "%errorlevel%" neq "0" (
@REM     echo Failed to restore backend python packages
@REM     exit /B %errorlevel%
@REM )

@REM echo.
@REM echo Restoring frontend npm packages
@REM echo.
@REM cd frontend
@REM call npm install
@REM if "%errorlevel%" neq "0" (
@REM     echo Failed to restore frontend npm packages
@REM     exit /B %errorlevel%
@REM )

@REM echo.
@REM echo Building frontend
@REM echo.
@REM call npm run build
@REM if "%errorlevel%" neq "0" (
@REM     echo Failed to build frontend
@REM     exit /B %errorlevel%
@REM )

@REM echo.    
@REM echo Starting backend    
@REM echo.    
@REM cd ..  
start http://127.0.0.1:50505
call python -m uvicorn enterprise_search_app:app  --port 50505 --reload
if "%errorlevel%" neq "0" (    
    echo Failed to start backend    
    exit /B %errorlevel%    
) 
