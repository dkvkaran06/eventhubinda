@echo off
REM EventHub India - Docker Build & Push Script (Non-Interactive)

cd /d "c:\Users\Dev\Desktop\ticketcharge-hub-main\ticketcharge-hub-main"

echo.
echo ========================================
echo   EventHub India - Docker Push
echo ========================================
echo.

REM Set variables
set DOCKER_ID=devkaran06
set DOCKER_PASSWORD=dHEYVPPPP@2023
set FRONTEND_IMAGE=eventhubinda-frontend
set BACKEND_IMAGE=eventhubinda-backend

echo [1/6] Logging into Docker Hub...
echo %DOCKER_PASSWORD% | docker login -u %DOCKER_ID% --password-stdin
if errorlevel 1 (
    echo.
    echo ERROR: Docker login failed!
    echo Make sure Docker Desktop is running
    echo Make sure credentials are correct
    pause
    exit /b 1
)
echo SUCCESS: Docker login complete
echo.

echo [2/6] Building Frontend Image...
docker build -t %FRONTEND_IMAGE%:latest .
if errorlevel 1 (
    echo ERROR: Frontend build failed!
    pause
    exit /b 1
)
echo SUCCESS: Frontend image built
echo.

echo [3/6] Building Backend Image...
docker build -t %BACKEND_IMAGE%:latest ./backend
if errorlevel 1 (
    echo ERROR: Backend build failed!
    pause
    exit /b 1
)
echo SUCCESS: Backend image built
echo.

echo [4/6] Tagging Images...
docker tag %FRONTEND_IMAGE%:latest %DOCKER_ID%/%FRONTEND_IMAGE%:latest
docker tag %FRONTEND_IMAGE%:latest %DOCKER_ID%/%FRONTEND_IMAGE%:v1.0
docker tag %BACKEND_IMAGE%:latest %DOCKER_ID%/%BACKEND_IMAGE%:latest
docker tag %BACKEND_IMAGE%:latest %DOCKER_ID%/%BACKEND_IMAGE%:v1.0
echo SUCCESS: Images tagged
echo.

echo [5/6] Pushing Frontend Images...
docker push %DOCKER_ID%/%FRONTEND_IMAGE%:latest
docker push %DOCKER_ID%/%FRONTEND_IMAGE%:v1.0
if errorlevel 1 (
    echo ERROR: Frontend push failed!
    pause
    exit /b 1
)
echo SUCCESS: Frontend pushed
echo.

echo [6/6] Pushing Backend Images...
docker push %DOCKER_ID%/%BACKEND_IMAGE%:latest
docker push %DOCKER_ID%/%BACKEND_IMAGE%:v1.0
if errorlevel 1 (
    echo ERROR: Backend push failed!
    pause
    exit /b 1
)
echo SUCCESS: Backend pushed
echo.

echo ========================================
echo   SUCCESS: All Images Pushed!
echo ========================================
echo.
echo Frontend: https://hub.docker.com/r/%DOCKER_ID%/%FRONTEND_IMAGE%
echo Backend:  https://hub.docker.com/r/%DOCKER_ID%/%BACKEND_IMAGE%
echo.
echo Docker Hub: https://hub.docker.com/u/%DOCKER_ID%
echo.
echo Logout:
docker logout
echo.
pause
