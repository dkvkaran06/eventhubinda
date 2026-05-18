#!/bin/bash
# Instant Docker Build & Push - No GitHub Needed
# Run this locally to push images immediately

#!/usr/bin/env bash

DOCKER_ID="devkaran06"
FRONTEND_IMAGE="eventhubinda-frontend"
BACKEND_IMAGE="eventhubinda-backend"

echo ""
echo "========================================="
echo "  EventHub India - Docker Build & Push"
echo "========================================="
echo ""

# Step 1: Login
echo "[1/5] Logging into Docker Hub..."
docker login -u $DOCKER_ID
if [ $? -ne 0 ]; then
    echo "❌ Login failed"
    exit 1
fi
echo "✓ Login successful"

# Step 2: Build Frontend
echo ""
echo "[2/5] Building Frontend Image..."
docker build -t ${FRONTEND_IMAGE}:latest .
if [ $? -ne 0 ]; then
    echo "❌ Frontend build failed"
    exit 1
fi
echo "✓ Frontend built"

# Step 3: Build Backend
echo ""
echo "[3/5] Building Backend Image..."
docker build -t ${BACKEND_IMAGE}:latest ./backend
if [ $? -ne 0 ]; then
    echo "❌ Backend build failed"
    exit 1
fi
echo "✓ Backend built"

# Step 4: Tag Images
echo ""
echo "[4/5] Tagging Images..."
docker tag ${FRONTEND_IMAGE}:latest ${DOCKER_ID}/${FRONTEND_IMAGE}:latest
docker tag ${FRONTEND_IMAGE}:latest ${DOCKER_ID}/${FRONTEND_IMAGE}:v1.0
docker tag ${BACKEND_IMAGE}:latest ${DOCKER_ID}/${BACKEND_IMAGE}:latest
docker tag ${BACKEND_IMAGE}:latest ${DOCKER_ID}/${BACKEND_IMAGE}:v1.0
echo "✓ Images tagged"

# Step 5: Push
echo ""
echo "[5/5] Pushing to Docker Hub..."

echo "Pushing frontend:latest..."
docker push ${DOCKER_ID}/${FRONTEND_IMAGE}:latest
echo "Pushing frontend:v1.0..."
docker push ${DOCKER_ID}/${FRONTEND_IMAGE}:v1.0

echo "Pushing backend:latest..."
docker push ${DOCKER_ID}/${BACKEND_IMAGE}:latest
echo "Pushing backend:v1.0..."
docker push ${DOCKER_ID}/${BACKEND_IMAGE}:v1.0

echo ""
echo "========================================="
echo "  ✅ Docker Push Complete!"
echo "========================================="
echo ""
echo "View at: https://hub.docker.com/u/${DOCKER_ID}"
echo ""
