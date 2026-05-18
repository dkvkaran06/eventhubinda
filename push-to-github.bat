@echo off
REM Push EventHub India to GitHub

cd /d "c:\Users\Dev\Desktop\ticketcharge-hub-main\ticketcharge-hub-main"

echo.
echo ==========================================
echo   Pushing to GitHub
echo ==========================================
echo.

REM Check if git is available
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed
    pause
    exit /b 1
)

echo [1/5] Checking git status...
git status
echo.

echo [2/5] Adding all files...
git add .
echo ✅ Files staged
echo.

echo [3/5] Creating commit...
git commit -m "Initial commit: EventHub India with GitHub Actions and Docker

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"
if errorlevel 1 (
    echo WARNING: Commit may have failed or nothing to commit
)
echo.

echo [4/5] Ensuring main branch...
git branch -M main
echo ✅ Branch: main
echo.

echo [5/5] Pushing to GitHub...
echo Setting remote...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/dkvkaran06/eventhubinda.git
echo Pushing...
git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ Push failed. Try one of these:
    echo.
    echo Option 1: Use GitHub Desktop
    echo Option 2: Use GitHub CLI: gh auth login
    echo Option 3: Use SSH key setup
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
echo 1. Go to: https://github.com/dkvkaran06/eventhubinda/settings/secrets/actions
echo 2. Add GitHub Secrets:
echo    - DOCKER_HUB_USERNAME = devkaran06
echo    - DOCKER_HUB_TOKEN = (from https://hub.docker.com/settings/security)
echo 3. Go to Actions tab and re-run the workflow
echo.
pause
