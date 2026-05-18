# 📋 Complete Commands Reference

## 🚀 START HERE - Pick Your Method

### **Method 1: Docker Compose (Recommended) ⭐**
```bash
docker-compose up --build
```
**What happens:**
- Frontend runs on http://localhost (port 80)
- Backend runs on http://localhost:5000
- Both services start together
- Stop with: `docker-compose down`

---

### **Method 2: Frontend Dev Server**
```bash
npm install --legacy-peer-deps
npm run dev
```
**What happens:**
- Frontend only on http://localhost:5173
- Hot reload for development
- Backend must run separately
- Stop with: `Ctrl+C`

---

### **Method 3: Full Stack Manual**
```bash
# Terminal 1: Frontend
npm install --legacy-peer-deps
npm run dev

# Terminal 2: Backend
cd backend
npm install
npm start
```

---

## 🐳 Docker Commands

### Build Docker Images
```bash
# Build frontend image
docker build -t eventhubinda-frontend:latest .

# Build backend image
docker build -t eventhubinda-backend:latest ./backend
```

### Tag Images for Docker Hub
```bash
# Frontend tags
docker tag eventhubinda-frontend:latest devkaran06/eventhubinda-frontend:latest
docker tag eventhubinda-frontend:latest devkaran06/eventhubinda-frontend:v1.0

# Backend tags
docker tag eventhubinda-backend:latest devkaran06/eventhubinda-backend:latest
docker tag eventhubinda-backend:latest devkaran06/eventhubinda-backend:v1.0
```

### Push to Docker Hub
```bash
# Login (use password or token)
docker login -u devkaran06

# Push frontend
docker push devkaran06/eventhubinda-frontend:latest
docker push devkaran06/eventhubinda-frontend:v1.0

# Push backend
docker push devkaran06/eventhubinda-backend:latest
docker push devkaran06/eventhubinda-backend:v1.0

# Logout after pushing
docker logout
```

### Run Individual Containers
```bash
# Frontend container
docker run -p 80:80 devkaran06/eventhubinda-frontend:latest

# Backend container
docker run -p 5000:5000 devkaran06/eventhubinda-backend:latest
```

### Docker Compose Commands
```bash
# Start services (build if needed)
docker-compose up --build

# Start in background
docker-compose up -d --build

# Stop services
docker-compose down

# View logs
docker-compose logs -f

# Rebuild specific service
docker-compose up --build backend
```

---

## 📦 NPM Scripts

### Development
```bash
# Install dependencies
npm install --legacy-peer-deps

# Start dev server
npm run dev

# Start linting
npm run lint
```

### Backend Commands
```bash
cd backend

# Install dependencies
npm install

# Start backend server
npm start

# Install production only
npm install --omit=dev
```

### Production Build
```bash
# Build frontend
npm run build

# Preview production build
npm run preview

# Build and preview
npm run build && npm run preview
```

---

## 🔄 Git & GitHub Commands

### Initial Setup
```bash
# Configure git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Initialize repo (if needed)
git init
```

### Add Remote
```bash
# Add GitHub remote
git remote add origin https://github.com/dkvkaran06/eventhubinda.git

# Or update existing remote
git remote set-url origin https://github.com/dkvkaran06/eventhubinda.git

# Verify remote
git remote -v
```

### First Push to GitHub
```bash
# Stage all files
git add .

# Create commit
git commit -m "Initial commit: EventHub India with GitHub Actions and Docker"

# Ensure main branch
git branch -M main

# Push to GitHub
git push -u origin main
```

### Regular Git Workflow
```bash
# Check status
git status

# Stage specific file
git add filename.txt

# Stage all changes
git add .

# Create commit
git commit -m "Descriptive message"

# Push to remote
git push

# Pull latest changes
git pull

# Create new branch
git checkout -b feature-name

# Switch branch
git checkout main

# Merge branch
git merge feature-name
```

---

## 🔑 GitHub Actions Setup

### Add Secrets
**Location:** Repository → Settings → Secrets and variables → Actions → New repository secret

```
DOCKER_HUB_USERNAME = devkaran06
DOCKER_HUB_TOKEN = (generate from Docker Hub)
VITE_API_URL = (your backend URL)
VITE_RAZORPAY_KEY_ID = (your key)
VITE_FIREBASE_API_KEY = (your key)
VITE_FIREBASE_AUTH_DOMAIN = (your domain)
VITE_FIREBASE_PROJECT_ID = (your project)
VITE_FIREBASE_STORAGE_BUCKET = (your bucket)
VITE_FIREBASE_MESSAGING_SENDER_ID = (your ID)
VITE_FIREBASE_APP_ID = (your ID)
```

### View Workflows
```bash
# List recent workflow runs
git log --oneline

# After push to main, check Actions tab on GitHub
# https://github.com/dkvkaran06/eventhubinda/actions
```

---

## 🌐 Access URLs

### Development Servers
- Frontend Dev: http://localhost:5173
- Backend Dev: http://localhost:5000
- Docker Frontend: http://localhost
- Docker Compose: http://localhost

### External Services
- Docker Hub: https://hub.docker.com/u/devkaran06
- GitHub Repo: https://github.com/dkvkaran06/eventhubinda
- GitHub Actions: https://github.com/dkvkaran06/eventhubinda/actions

---

## 🔐 Environment Variables

### Create .env file
```bash
cp .env.example .env
```

### Edit .env
```env
# API Configuration
VITE_API_URL=http://localhost:5000

# Payment Gateway
VITE_RAZORPAY_KEY_ID=your_razorpay_key

# Firebase Configuration
VITE_FIREBASE_API_KEY=your_firebase_key
VITE_FIREBASE_AUTH_DOMAIN=your-project.firebaseapp.com
VITE_FIREBASE_PROJECT_ID=your-project-id
VITE_FIREBASE_STORAGE_BUCKET=your-bucket.appspot.com
VITE_FIREBASE_MESSAGING_SENDER_ID=your-sender-id
VITE_FIREBASE_APP_ID=your-app-id

# Backend (if in separate directory)
NODE_ENV=development
DATABASE_URL=your_database_url
```

---

## 🛠️ Common Tasks

### Check if Services are Running
```bash
# Check local dev servers
curl http://localhost:5173
curl http://localhost:5000

# Check Docker container
docker ps

# Check Docker logs
docker logs container_id
```

### Clean Up Docker
```bash
# Remove stopped containers
docker container prune

# Remove unused images
docker image prune

# Remove everything (careful!)
docker system prune -a
```

### Troubleshoot Port Already in Use
```bash
# Windows: Find process on port
netstat -ano | findstr :5173
taskkill /PID <PID> /F

# Linux/Mac: Find process on port
lsof -i :5173
kill -9 <PID>
```

### Force Rebuild
```bash
# Remove node_modules and package-lock
rm -r node_modules
rm package-lock.json

# Reinstall
npm install --legacy-peer-deps

# Rebuild Docker images
docker build --no-cache -t eventhubinda-frontend:latest .
```

---

## 📊 Quick Command Summary

| Task | Command |
|------|---------|
| **Start Everything** | `docker-compose up --build` |
| **Start Frontend Dev** | `npm run dev` |
| **Build for Production** | `npm run build` |
| **Push Docker Images** | `push-docker.bat` or `.\push-docker.ps1` |
| **Push to GitHub** | `git push -u origin main` |
| **View Git Status** | `git status` |
| **Create Commit** | `git commit -m "message"` |
| **Check Services** | `docker ps` |
| **Stop Everything** | `docker-compose down` |

---

**Last Updated:** 2026-05-18  
**Status:** ✅ Ready to Deploy
