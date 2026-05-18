@echo off
REM ============================================================
REM EventHub India - Complete Docker Push & GitHub Actions Fix
REM ============================================================

setlocal enabledelayedexpansion

cd /d "c:\Users\Dev\Desktop\ticketcharge-hub-main\ticketcharge-hub-main"

cls
echo.
echo ============================================================
echo    EventHub India - Docker Build, Push & GitHub Fix
echo ============================================================
echo.

REM ============================================================
REM STEP 1: Check Docker
REM ============================================================
echo [STEP 1] Checking Docker Status...
docker --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ ERROR: Docker is not installed or not in PATH
    echo.
    echo SOLUTION:
    echo   1. Install Docker Desktop from https://docker.com
    echo   2. Restart your computer
    echo   3. Run this script again
    echo.
    pause
    exit /b 1
)
echo ✅ Docker found

docker ps >nul 2>&1
if errorlevel 1 (
    echo.
    echo ⚠️  WARNING: Docker daemon not running
    echo.
    echo SOLUTION:
    echo   1. Open Docker Desktop application
    echo   2. Wait for it to fully start (watch for whale icon)
    echo   3. Run this script again
    echo.
    pause
    exit /b 1
)
echo ✅ Docker daemon is running
echo.

REM ============================================================
REM STEP 2: Verify Project Files
REM ============================================================
echo [STEP 2] Checking Project Files...
if not exist "Dockerfile" (
    echo ❌ ERROR: Dockerfile not found
    pause
    exit /b 1
)
echo ✅ Dockerfile found

if not exist "backend\Dockerfile" (
    echo ❌ ERROR: backend/Dockerfile not found
    pause
    exit /b 1
)
echo ✅ backend/Dockerfile found

if not exist "package.json" (
    echo ❌ ERROR: package.json not found
    pause
    exit /b 1
)
echo ✅ package.json found
echo.

REM ============================================================
REM STEP 3: Docker Login
REM ============================================================
echo [STEP 3] Logging into Docker Hub...
echo Username: devkaran06
set DOCKER_ID=devkaran06
set DOCKER_PASSWORD=dHEYVPPPP@2023

echo %DOCKER_PASSWORD% | docker login -u %DOCKER_ID% --password-stdin >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ ERROR: Docker login failed
    echo.
    echo SOLUTIONS:
    echo   1. Check credentials are correct:
    echo      Username: devkaran06
    echo      Password: dHEYVPPPP@2023
    echo   2. Check Docker Hub account is active
    echo   3. Try: docker logout, then run this script again
    echo   4. Or generate token at: https://hub.docker.com/settings/security
    echo.
    pause
    exit /b 1
)
echo ✅ Docker login successful
echo.

REM ============================================================
REM STEP 4: Build Frontend
REM ============================================================
echo [STEP 4] Building Frontend Docker Image...
echo.
docker build -t eventhubinda-frontend:latest . 2>&1
if errorlevel 1 (
    echo.
    echo ❌ ERROR: Frontend build failed
    echo.
    echo SOLUTIONS:
    echo   1. Run: npm install --legacy-peer-deps
    echo   2. Check node_modules exist
    echo   3. Check src/ folder exists
    echo   4. Run this script again
    echo.
    pause
    exit /b 1
)
echo.
echo ✅ Frontend image built successfully
echo.

REM ============================================================
REM STEP 5: Build Backend
REM ============================================================
echo [STEP 5] Building Backend Docker Image...
echo.
docker build -t eventhubinda-backend:latest ./backend 2>&1
if errorlevel 1 (
    echo.
    echo ❌ ERROR: Backend build failed
    echo.
    echo SOLUTIONS:
    echo   1. Run: cd backend ^&^& npm install
    echo   2. Check backend/Dockerfile exists
    echo   3. Check backend/package.json exists
    echo   4. Run this script again
    echo.
    pause
    exit /b 1
)
echo.
echo ✅ Backend image built successfully
echo.

REM ============================================================
REM STEP 6: Tag Images
REM ============================================================
echo [STEP 6] Tagging Images...
docker tag eventhubinda-frontend:latest %DOCKER_ID%/eventhubinda-frontend:latest
docker tag eventhubinda-frontend:latest %DOCKER_ID%/eventhubinda-frontend:v1.0
docker tag eventhubinda-backend:latest %DOCKER_ID%/eventhubinda-backend:latest
docker tag eventhubinda-backend:latest %DOCKER_ID%/eventhubinda-backend:v1.0
echo ✅ Images tagged
echo.

REM ============================================================
REM STEP 7: Push Frontend
REM ============================================================
echo [STEP 7] Pushing Frontend to Docker Hub...
echo.
docker push %DOCKER_ID%/eventhubinda-frontend:latest
if errorlevel 1 (
    echo ❌ ERROR: Frontend push failed
    pause
    exit /b 1
)

docker push %DOCKER_ID%/eventhubinda-frontend:v1.0
if errorlevel 1 (
    echo ❌ ERROR: Frontend v1.0 push failed
    pause
    exit /b 1
)
echo ✅ Frontend pushed successfully
echo.

REM ============================================================
REM STEP 8: Push Backend
REM ============================================================
echo [STEP 8] Pushing Backend to Docker Hub...
echo.
docker push %DOCKER_ID%/eventhubinda-backend:latest
if errorlevel 1 (
    echo ❌ ERROR: Backend push failed
    pause
    exit /b 1
)

docker push %DOCKER_ID%/eventhubinda-backend:v1.0
if errorlevel 1 (
    echo ❌ ERROR: Backend v1.0 push failed
    pause
    exit /b 1
)
echo ✅ Backend pushed successfully
echo.

REM ============================================================
REM STEP 9: GitHub Actions Setup
REM ============================================================
echo ============================================================
echo [STEP 9] GitHub Actions - Setup Instructions
echo ============================================================
echo.
echo ✅ Docker images pushed successfully!
echo.
echo NOW DO THIS FOR GITHUB ACTIONS:
echo.
echo 1. Go to: https://github.com/dkvkaran06/eventhubinda/settings/secrets/actions
echo.
echo 2. Add Secret 1:
echo    Name:  DOCKER_HUB_USERNAME
echo    Value: devkaran06
echo.
echo 3. Add Secret 2:
echo    Name:  DOCKER_HUB_TOKEN
echo    Value: (generate from https://hub.docker.com/settings/security)
echo.
echo 4. Go to: https://github.com/dkvkaran06/eventhubinda/actions
echo.
echo 5. Click the failed workflow (red X)
echo.
echo 6. Click "Re-run jobs" button
echo.
echo.

REM ============================================================
REM FINAL SUMMARY
REM ============================================================
echo ============================================================
echo    ✅ SUCCESS - DOCKER PUSH COMPLETE!
echo ============================================================
echo.
echo Frontend Image:
echo   https://hub.docker.com/r/%DOCKER_ID%/eventhubinda-frontend
echo.
echo Backend Image:
echo   https://hub.docker.com/r/%DOCKER_ID%/eventhubinda-backend
echo.
echo Docker Hub Profile:
echo   https://hub.docker.com/u/%DOCKER_ID%
echo.
echo Next: Follow the GitHub Actions setup instructions above
echo.
pause
