@echo off
REM EventHub India - Docker Build & Push Script

cd /d "c:\Users\Dev\Desktop\ticketcharge-hub-main\ticketcharge-hub-main"

echo.
echo ========================================
echo   EventHub India - Docker Push Setup
echo ========================================
echo.

REM Set variables
set DOCKER_ID=devkaran06
set DOCKER_PASSWORD=dHEYVPPPP@2023
set FRONTEND_IMAGE=eventhubinda-frontend
set BACKEND_IMAGE=eventhubinda-backend

echo [1/4] Logging into Docker Hub...
echo %DOCKER_PASSWORD% | docker login -u %DOCKER_ID% --password-stdin
if errorlevel 1 (
    echo ERROR: Docker login failed!
    exit /b 1
)
echo ✓ Docker login successful

echo.
echo [2/4] Building Frontend Image...
docker build -t %FRONTEND_IMAGE%:latest .
if errorlevel 1 (
    echo ERROR: Frontend build failed!
    exit /b 1
)
echo ✓ Frontend image built

echo.
echo [3/4] Building Backend Image...
docker build -t %BACKEND_IMAGE%:latest ./backend
if errorlevel 1 (
    echo ERROR: Backend build failed!
    exit /b 1
)
echo ✓ Backend image built

echo.
echo [4/4] Tagging and Pushing Images to Docker Hub...

REM Tag frontend
docker tag %FRONTEND_IMAGE%:latest %DOCKER_ID%/%FRONTEND_IMAGE%:latest
docker tag %FRONTEND_IMAGE%:latest %DOCKER_ID%/%FRONTEND_IMAGE%:v1.0

REM Tag backend
docker tag %BACKEND_IMAGE%:latest %DOCKER_ID%/%BACKEND_IMAGE%:latest
docker tag %BACKEND_IMAGE%:latest %DOCKER_ID%/%BACKEND_IMAGE%:v1.0

REM Push frontend
echo Pushing frontend image...
docker push %DOCKER_ID%/%FRONTEND_IMAGE%:latest
docker push %DOCKER_ID%/%FRONTEND_IMAGE%:v1.0
if errorlevel 1 (
    echo ERROR: Frontend push failed!
    exit /b 1
)
echo ✓ Frontend image pushed

echo.
REM Push backend
echo Pushing backend image...
docker push %DOCKER_ID%/%BACKEND_IMAGE%:latest
docker push %DOCKER_ID%/%BACKEND_IMAGE%:v1.0
if errorlevel 1 (
    echo ERROR: Backend push failed!
    exit /b 1
)
echo ✓ Backend image pushed

echo.
echo ========================================
echo   ✅ Docker Push Complete!
echo ========================================
echo.
echo Frontend: %DOCKER_ID%/%FRONTEND_IMAGE%:latest
echo Backend:  %DOCKER_ID%/%BACKEND_IMAGE%:latest
echo.
echo View at: https://hub.docker.com/u/%DOCKER_ID%
echo.
pause
