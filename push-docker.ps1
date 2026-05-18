#!/usr/bin/env pwsh
# EventHub India - Docker Build & Push Script

Set-Location "c:\Users\Dev\Desktop\ticketcharge-hub-main\ticketcharge-hub-main"

# Configuration
$DOCKER_ID = "devkaran06"
$DOCKER_PASSWORD = "dHEYVPPPP@2023"
$FRONTEND_IMAGE = "eventhubinda-frontend"
$BACKEND_IMAGE = "eventhubinda-backend"

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  EventHub India - Docker Push Setup" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

# Step 1: Docker Login
Write-Host "[1/5] Logging into Docker Hub..." -ForegroundColor Yellow
$DOCKER_PASSWORD | docker login -u $DOCKER_ID --password-stdin
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ ERROR: Docker login failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Docker login successful" -ForegroundColor Green

# Step 2: Build Frontend
Write-Host "`n[2/5] Building Frontend Image..." -ForegroundColor Yellow
docker build -t ${FRONTEND_IMAGE}:latest .
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ ERROR: Frontend build failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Frontend image built successfully" -ForegroundColor Green

# Step 3: Build Backend
Write-Host "`n[3/5] Building Backend Image..." -ForegroundColor Yellow
docker build -t ${BACKEND_IMAGE}:latest ./backend
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ ERROR: Backend build failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Backend image built successfully" -ForegroundColor Green

# Step 4: Tag Images
Write-Host "`n[4/5] Tagging Images..." -ForegroundColor Yellow
docker tag ${FRONTEND_IMAGE}:latest ${DOCKER_ID}/${FRONTEND_IMAGE}:latest
docker tag ${FRONTEND_IMAGE}:latest ${DOCKER_ID}/${FRONTEND_IMAGE}:v1.0
docker tag ${BACKEND_IMAGE}:latest ${DOCKER_ID}/${BACKEND_IMAGE}:latest
docker tag ${BACKEND_IMAGE}:latest ${DOCKER_ID}/${BACKEND_IMAGE}:v1.0
Write-Host "✓ Images tagged successfully" -ForegroundColor Green

# Step 5: Push Images
Write-Host "`n[5/5] Pushing Images to Docker Hub..." -ForegroundColor Yellow

Write-Host "`nPushing Frontend (latest)..." -ForegroundColor Cyan
docker push ${DOCKER_ID}/${FRONTEND_IMAGE}:latest
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Frontend push failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Pushing Frontend (v1.0)..." -ForegroundColor Cyan
docker push ${DOCKER_ID}/${FRONTEND_IMAGE}:v1.0
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Frontend v1.0 push failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Pushing Backend (latest)..." -ForegroundColor Cyan
docker push ${DOCKER_ID}/${BACKEND_IMAGE}:latest
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Backend push failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Pushing Backend (v1.0)..." -ForegroundColor Cyan
docker push ${DOCKER_ID}/${BACKEND_IMAGE}:v1.0
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Backend v1.0 push failed!" -ForegroundColor Red
    exit 1
}

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "  ✅ Docker Push Complete!" -ForegroundColor Green
Write-Host "========================================`n" -ForegroundColor Green

Write-Host "Frontend Images:" -ForegroundColor Cyan
Write-Host "  Latest: ${DOCKER_ID}/${FRONTEND_IMAGE}:latest" -ForegroundColor White
Write-Host "  v1.0:   ${DOCKER_ID}/${FRONTEND_IMAGE}:v1.0" -ForegroundColor White

Write-Host "`nBackend Images:" -ForegroundColor Cyan
Write-Host "  Latest: ${DOCKER_ID}/${BACKEND_IMAGE}:latest" -ForegroundColor White
Write-Host "  v1.0:   ${DOCKER_ID}/${BACKEND_IMAGE}:v1.0" -ForegroundColor White

Write-Host "`nView at: https://hub.docker.com/u/${DOCKER_ID}" -ForegroundColor Yellow
Write-Host "`nDocker Logout (cleanup):" -ForegroundColor Cyan
Write-Host "  docker logout" -ForegroundColor White
