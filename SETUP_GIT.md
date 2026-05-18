# Git & GitHub Setup Instructions

This document outlines the steps to set up the eventhubinda repository for GitHub and push to remote.

## ✅ Project Status

- ✓ Local git repository already initialized
- ✓ GitHub Actions workflows configured (`.github/workflows/ci-cd.yml`)
- ✓ Docker setup complete (Dockerfile + docker-compose.yml)
- ✓ README updated with comprehensive documentation

## 🔄 Git Commands to Run

### 1. Check Current Status
```bash
git status
git branch -a
```

### 2. Ensure Main Branch
```bash
git branch -M main
```

### 3. Add Remote (if not already added)
```bash
git remote add origin https://github.com/dkvkaran06/eventhubinda.git
# OR if already exists:
git remote set-url origin https://github.com/dkvkaran06/eventhubinda.git
```

### 4. Stage Updated Files
```bash
git add .
```

### 5. Create Commit
```bash
git commit -m "Initial commit: setup eventhubinda with GitHub Actions and Docker"
```

### 6. Push to GitHub
```bash
git push -u origin main
```

## 🔑 GitHub Secrets Setup

After pushing to GitHub, configure these secrets in repository settings:

**Navigate**: Settings → Secrets and variables → Actions → New repository secret

### Required Secrets:
1. **DOCKER_HUB_USERNAME** - Your Docker Hub username
2. **DOCKER_HUB_TOKEN** - Docker Hub access token
3. **VITE_API_URL** - Backend API URL (e.g., https://api.example.com)
4. **VITE_RAZORPAY_KEY_ID** - Razorpay payment key
5. **VITE_FIREBASE_API_KEY** - Firebase API key
6. **VITE_FIREBASE_AUTH_DOMAIN** - Firebase auth domain
7. **VITE_FIREBASE_PROJECT_ID** - Firebase project ID
8. **VITE_FIREBASE_STORAGE_BUCKET** - Firebase storage bucket
9. **VITE_FIREBASE_MESSAGING_SENDER_ID** - Firebase messaging sender ID
10. **VITE_FIREBASE_APP_ID** - Firebase app ID

## 🐳 Docker Configuration

### Build Locally
```bash
# Build frontend image
docker build -t eventhubinda-frontend:latest .

# Build backend image
docker build -t eventhubinda-backend:latest ./backend

# Run with Docker Compose
docker-compose up --build
```

### Push to Docker Hub
```bash
# Tag images
docker tag eventhubinda-frontend:latest USERNAME/eventhubinda-frontend:latest
docker tag eventhubinda-backend:latest USERNAME/eventhubinda-backend:latest

# Login to Docker Hub
docker login

# Push images
docker push USERNAME/eventhubinda-frontend:latest
docker push USERNAME/eventhubinda-backend:latest
```

## ✨ GitHub Actions Workflows

The project includes automated CI/CD:

### Trigger Events:
- Push to `main` or `master` branch
- Pull requests to `main` or `master` branch

### Jobs:
1. **Frontend Build** - Compiles React app with Vite
2. **Backend Check** - Validates backend dependencies
3. **Docker Build & Push** - Creates and pushes Docker images (main branch only)

### View Workflows:
1. Go to GitHub repository
2. Click "Actions" tab
3. Select workflow run to see details

## 📋 First-Time Deployment Checklist

- [ ] Push code to GitHub
- [ ] Set all required secrets in GitHub Actions
- [ ] Verify workflow runs successfully
- [ ] Build Docker images locally
- [ ] Push Docker images to Docker Hub
- [ ] Configure production environment variables
- [ ] Test deployment (if using Render/Vercel)

## 🚨 Troubleshooting

### Authentication Issues
```bash
# Check git config
git config --list

# Set credentials
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Remote Already Exists Error
```bash
# View current remotes
git remote -v

# Update remote URL
git remote set-url origin https://github.com/dkvkaran06/eventhubinda.git
```

### Docker Build Fails
```bash
# Clear Docker cache
docker system prune -a

# Rebuild with no cache
docker build --no-cache -t eventhubinda-frontend:latest .
```

## 📚 Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Documentation](https://docs.docker.com/)
- [GitHub Secrets Documentation](https://docs.github.com/en/actions/security-guides/encrypted-secrets)

---
**Last Updated**: 2026-05-18
