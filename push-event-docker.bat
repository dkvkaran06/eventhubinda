@echo off
REM Push to devkaran06/event on Docker Hub

cd /d "c:\Users\Dev\Desktop\ticketcharge-hub-main\ticketcharge-hub-main"

echo.
echo ========================================
echo   Docker Push to devkaran06/event
echo ========================================
echo.

set DOCKER_ID=devkaran06
set DOCKER_REPO=event
set DOCKER_PASSWORD=dHEYVPPPP@2023

echo [1/6] Logging into Docker Hub...
echo %DOCKER_PASSWORD% | docker login -u %DOCKER_ID% --password-stdin
if errorlevel 1 (
    echo ❌ Login failed
    pause
    exit /b 1
)
echo ✅ Login successful
echo.

echo [2/6] Building Frontend Image...
docker build -t eventhubinda-frontend:latest .
if errorlevel 1 (
    echo ❌ Frontend build failed
    pause
    exit /b 1
)
echo ✅ Frontend built
echo.

echo [3/6] Building Backend Image...
docker build -t eventhubinda-backend:latest ./backend
if errorlevel 1 (
    echo ❌ Backend build failed
    pause
    exit /b 1
)
echo ✅ Backend built
echo.

echo [4/6] Tagging for devkaran06/event...
docker tag eventhubinda-frontend:latest %DOCKER_ID%/%DOCKER_REPO%:frontend
docker tag eventhubinda-frontend:latest %DOCKER_ID%/%DOCKER_REPO%:frontend-v1.0
docker tag eventhubinda-backend:latest %DOCKER_ID%/%DOCKER_REPO%:backend
docker tag eventhubinda-backend:latest %DOCKER_ID%/%DOCKER_REPO%:backend-v1.0
echo ✅ Tagged
echo.

echo [5/6] Pushing Frontend...
docker push %DOCKER_ID%/%DOCKER_REPO%:frontend
docker push %DOCKER_ID%/%DOCKER_REPO%:frontend-v1.0
if errorlevel 1 (
    echo ❌ Push failed
    pause
    exit /b 1
)
echo ✅ Frontend pushed
echo.

echo [6/6] Pushing Backend...
docker push %DOCKER_ID%/%DOCKER_REPO%:backend
docker push %DOCKER_ID%/%DOCKER_REPO%:backend-v1.0
if errorlevel 1 (
    echo ❌ Push failed
    pause
    exit /b 1
)
echo ✅ Backend pushed
echo.

echo ========================================
echo   ✅ SUCCESS!
echo ========================================
echo.
echo Repository: https://hub.docker.com/r/%DOCKER_ID%/%DOCKER_REPO%
echo.
echo Images pushed:
echo   - %DOCKER_ID%/%DOCKER_REPO%:frontend
echo   - %DOCKER_ID%/%DOCKER_REPO%:backend
echo.
docker logout
pause
