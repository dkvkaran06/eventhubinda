# 🚀 EventHub India - Complete Deployment Guide

## Project: eventhubinda
**Repository**: https://github.com/dkvkaran06/eventhubinda.git

---

## 📋 Table of Contents
1. [Local Development](#-local-development)
2. [GitHub Setup](#-github-setup)
3. [GitHub Actions](#-github-actions)
4. [Docker Deployment](#-docker-deployment)
5. [Production Deployment](#-production-deployment)

---

## 💻 Local Development

### Installation
```bash
# Clone and setup
git clone https://github.com/dkvkaran06/eventhubinda.git
cd eventhubinda
npm install --legacy-peer-deps
cd backend && npm install && cd ..

# Environment configuration
cp .env.example .env
# Edit .env with your values
```

### Development Mode
```bash
# Terminal 1: Frontend (Vite)
npm run dev

# Terminal 2: Backend (from backend directory)
cd backend && npm start

# Terminal 3: Full stack with Docker Compose
docker-compose up
```

### Build for Production
```bash
npm run build  # Creates dist/ folder
npm run preview  # Test production build locally
```

---

## 🐙 GitHub Setup

### Step 1: Create Repository on GitHub
1. Go to [GitHub New Repository](https://github.com/new)
2. Repository name: `eventhubinda`
3. Click "Create repository"

### Step 2: Configure Local Git
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 3: Update and Commit
```bash
# Navigate to project
cd /path/to/eventhubinda

# Update README
echo "# eventhubinda" > README.md

# Initialize git (if needed)
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: EventHub India - Full stack app with GitHub Actions & Docker"

# Create/switch to main branch
git branch -M main

# Add remote
git remote add origin https://github.com/dkvkaran06/eventhubinda.git

# Push to GitHub
git push -u origin main
```

### Step 4: Configure GitHub Secrets
**Location**: Repository Settings → Secrets and variables → Actions

Add these secrets:
```
DOCKER_HUB_USERNAME          # Your Docker Hub username
DOCKER_HUB_TOKEN             # Docker Hub personal access token
VITE_API_URL                 # Backend API URL
VITE_RAZORPAY_KEY_ID         # Razorpay payment key
VITE_FIREBASE_API_KEY        # Firebase credentials...
VITE_FIREBASE_AUTH_DOMAIN
VITE_FIREBASE_PROJECT_ID
VITE_FIREBASE_STORAGE_BUCKET
VITE_FIREBASE_MESSAGING_SENDER_ID
VITE_FIREBASE_APP_ID
```

---

## ⚙️ GitHub Actions

### Workflow File
**Location**: `.github/workflows/ci-cd.yml`

### What It Does

**On every push to main/master:**

1. **Frontend Build Job** ✓
   - Checkout code
   - Setup Node.js 20
   - Install dependencies
   - Build React app with Vite
   - Upload artifact

2. **Backend Check Job** ✓
   - Validate backend dependencies
   - Ensure compatibility

3. **Docker Build & Push** ✓ (main branch only)
   - Build frontend Docker image
   - Build backend Docker image
   - Push to Docker Hub
   - Tags: `latest` and `build-number`

### View Workflow Runs
1. Go to repository → Actions tab
2. Click on workflow run to see details
3. Download artifacts if needed

### Troubleshoot Workflow
- Check logs in Actions tab
- Verify secrets are set correctly
- Ensure Docker Hub credentials are valid

---

## 🐳 Docker Deployment

### Local Docker Build

```bash
# Build frontend
docker build -t eventhubinda-frontend:latest .

# Build backend
docker build -t eventhubinda-backend:latest ./backend

# Run frontend (exposes port 80)
docker run -p 80:80 eventhubinda-frontend:latest

# Run backend (exposes port 5000)
docker run -p 5000:5000 eventhubinda-backend:latest
```

### Docker Compose
```bash
# Build and run all services
docker-compose up --build

# Run in background
docker-compose up -d

# Stop services
docker-compose down

# View logs
docker-compose logs -f
```

### Push to Docker Hub
```bash
# Login
docker login

# Tag images
docker tag eventhubinda-frontend:latest YOUR_USERNAME/eventhubinda-frontend:latest
docker tag eventhubinda-backend:latest YOUR_USERNAME/eventhubinda-backend:latest

# Push
docker push YOUR_USERNAME/eventhubinda-frontend:latest
docker push YOUR_USERNAME/eventhubinda-backend:latest
```

---

## 🌐 Production Deployment

### Option 1: Render.com

1. **Connect Repository**
   - Go to [render.com](https://render.com)
   - Connect GitHub account
   - Select eventhubinda repository

2. **Create Web Service**
   - New Web Service from Docker
   - Select repository
   - Configure environment
   - Deploy

3. **Configure Environment**
   - Add all required environment variables
   - Set Docker command

### Option 2: Vercel (Frontend Only)

1. **Import Project**
   - Go to [vercel.com](https://vercel.com/new)
   - Import GitHub repository

2. **Configure Build**
   - Build command: `npm run build`
   - Output directory: `dist`

3. **Environment Variables**
   - Add VITE_* variables
   - Deploy

### Option 3: Docker Swarm / Kubernetes

```bash
# Docker Swarm
docker stack deploy -c docker-compose.yml eventhubinda

# Kubernetes (requires deployment.yaml)
kubectl apply -f k8s/deployment.yaml
```

---

## 📊 Project Structure

```
eventhubinda/
├── .github/
│   └── workflows/
│       └── ci-cd.yml              # GitHub Actions workflow
├── backend/
│   ├── src/                       # Backend source
│   ├── package.json
│   └── Dockerfile                 # Backend container
├── src/                           # Frontend React components
├── public/                        # Static assets
├── Dockerfile                     # Frontend container
├── docker-compose.yml             # Multi-container setup
├── package.json                   # Frontend dependencies
├── vite.config.ts                 # Vite configuration
├── tsconfig.json                  # TypeScript config
├── tailwind.config.ts             # Tailwind CSS config
├── nginx.conf                     # Nginx configuration
└── README.md                      # Documentation
```

---

## 🔒 Security Checklist

- [ ] No credentials in source code
- [ ] Secrets configured in GitHub
- [ ] Environment variables separate from code
- [ ] `.gitignore` includes sensitive files
- [ ] Database credentials in secure vault
- [ ] API keys rotated regularly
- [ ] HTTPS enabled for production
- [ ] Docker images scanned for vulnerabilities

---

## 🐛 Troubleshooting

### Git Push Fails
```bash
# Check remote
git remote -v

# Update remote
git remote set-url origin https://github.com/dkvkaran06/eventhubinda.git

# Try push again
git push -u origin main
```

### Docker Image Build Fails
```bash
# Check Node version
node --version  # Should be 20+

# Clear cache
docker system prune -a

# Rebuild with verbose output
docker build --progress=plain -t eventhubinda-frontend:latest .
```

### GitHub Actions Secrets Not Working
- Verify secret names match workflow file
- Check organization vs repository secrets
- Regenerate tokens if expired
- Commit changes to trigger workflow

---

## 📞 Support

For issues or questions:
1. Check GitHub Issues
2. Review workflow logs in Actions tab
3. Verify environment variables
4. Test locally before pushing

---

## 📚 Resources

- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Docker Docs](https://docs.docker.com/)
- [Vite Docs](https://vitejs.dev/)
- [Express.js Docs](https://expressjs.com/)

---

**Last Updated**: 2026-05-18  
**Status**: ✅ Ready for Production
