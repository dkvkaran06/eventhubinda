@echo off
REM Push EventHub India to GitHub

cd /d "c:\Users\Dev\Desktop\ticketcharge-hub-main\ticketcharge-hub-main"

echo.
echo ==========================================
echo   Pushing to GitHub
echo ==========================================
echo.

REM Check git is available
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git not installed
    pause
    exit /b 1
)

echo [1/5] Git Status...
git status
echo.

echo [2/5] Adding all files...
git add .
echo ✅ Files added
echo.

echo [3/5] Creating commit...
git commit -m "Initial commit: EventHub India - Complete setup with GitHub Actions and Docker

- Docker support for frontend and backend
- GitHub Actions CI/CD pipeline
- Docker Hub integration (devkaran06/event)
- Comprehensive documentation
- Automated build and push scripts

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"

if errorlevel 1 (
    echo NOTE: Commit may have failed or nothing to commit
)
echo.

echo [4/5] Setting up main branch...
git branch -M main
echo ✅ Branch: main
echo.

echo [5/5] Pushing to GitHub...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/dkvkaran06/eventhubinda.git
git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ Push failed - Try one of these:
    echo.
    echo Option 1: Use GitHub CLI (gh auth login)
    echo Option 2: Generate Personal Access Token
    echo Option 3: Configure SSH key
    echo.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo   ✅ SUCCESS - Pushed to GitHub!
echo ==========================================
echo.
echo Repository: https://github.com/dkvkaran06/eventhubinda
echo.
echo Next Steps:
echo 1. Go to GitHub Settings Secrets
echo 2. Add DOCKER_HUB_USERNAME = devkaran06
echo 3. Add DOCKER_HUB_TOKEN (from Docker Hub)
echo 4. Go to Actions and re-run workflow
echo.
pause
