@echo off
REM Smart Refrigerator Project Startup Script

echo ====================================
echo Smart Refrigerator - Development
echo ====================================
echo.

REM Check Conda environment
conda info --envs | findstr "intelligent_refrigerator" >nul
if errorlevel 1 (
    echo [ERROR] Conda environment not found. Please run setup first.
    exit /b 1
)

REM Get user choice
echo.
echo Select a service to start:
echo 1. Backend (FastAPI)
echo 2. Frontend (Vue3 + Vite)
echo 3. Both (in separate windows)
echo 4. Exit
echo.

set /p choice="Enter choice (1-4): "

if "%choice%"=="1" (
    echo.
    echo Starting backend service...
    cd /d %~dp0backend
    call conda run -n intelligent_refrigerator python main.py
) else if "%choice%"=="2" (
    echo.
    echo Starting frontend service...
    cd /d %~dp0frontend
    call conda run -n intelligent_refrigerator npm run dev
) else if "%choice%"=="3" (
    echo.
    echo Starting backend and frontend services...
    echo.
    start cmd /k "cd /d %~dp0backend && title Backend - Intelligent Refrigerator && conda run -n intelligent_refrigerator python main.py"
    
    timeout /t 3 /nobreak
    start cmd /k "cd /d %~dp0frontend && title Frontend - Intelligent Refrigerator && conda run -n intelligent_refrigerator npm run dev"
    
    echo.
    echo Services started in separate windows.
    echo Backend: http://localhost:8000
    echo Frontend: http://localhost:5173
    echo.
) else if "%choice%"=="4" (
    echo Exiting...
    exit /b 0
) else (
    echo Invalid choice. Please run the script again.
    exit /b 1
)
