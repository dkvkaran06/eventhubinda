# 🐳 Docker Push to Docker Hub - Complete Guide

## Your Docker Hub Account
- **Username**: devkaran06
- **Images will be at**: https://hub.docker.com/u/devkaran06

---

## ✅ Step-by-Step: How to Push Images

### Method 1: Using Batch Script (Windows CMD)
```bash
push-docker.bat
```
- Automated process
- Logs in, builds, tags, and pushes
- Shows progress

### Method 2: Using PowerShell Script
```powershell
.\push-docker.ps1
```
- Same functionality as batch script
- Color-coded output
- Progress indicators

### Method 3: Manual Commands
```bash
# Step 1: Login to Docker Hub
docker login -u devkaran06

# Step 2: Build frontend
docker build -t eventhubinda-frontend:latest .

# Step 3: Build backend
docker build -t eventhubinda-backend:latest ./backend

# Step 4: Tag frontend images
docker tag eventhubinda-frontend:latest devkaran06/eventhubinda-frontend:latest
docker tag eventhubinda-frontend:latest devkaran06/eventhubinda-frontend:v1.0

# Step 5: Tag backend images
docker tag eventhubinda-backend:latest devkaran06/eventhubinda-backend:latest
docker tag eventhubinda-backend:latest devkaran06/eventhubinda-backend:v1.0

# Step 6: Push frontend
docker push devkaran06/eventhubinda-frontend:latest
docker push devkaran06/eventhubinda-frontend:v1.0

# Step 7: Push backend
docker push devkaran06/eventhubinda-backend:latest
docker push devkaran06/eventhubinda-backend:v1.0

# Step 8: Cleanup (logout)
docker logout
```

---

## 📦 Final Docker Hub URLs

After successful push, your images will be at:

**Frontend:**
- `devkaran06/eventhubinda-frontend:latest`
- `devkaran06/eventhubinda-frontend:v1.0`
- View: https://hub.docker.com/r/devkaran06/eventhubinda-frontend

**Backend:**
- `devkaran06/eventhubinda-backend:latest`
- `devkaran06/eventhubinda-backend:v1.0`
- View: https://hub.docker.com/r/devkaran06/eventhubinda-backend

---

## 🚀 Using Images Later

### Pull and Run Frontend
```bash
docker pull devkaran06/eventhubinda-frontend:latest
docker run -p 80:80 devkaran06/eventhubinda-frontend:latest
```

### Pull and Run Backend
```bash
docker pull devkaran06/eventhubinda-backend:latest
docker run -p 5000:5000 devkaran06/eventhubinda-backend:latest
```

### Docker Compose with Hub Images
Create `docker-compose-hub.yml`:
```yaml
version: '3.8'

services:
  frontend:
    image: devkaran06/eventhubinda-frontend:latest
    ports:
      - "80:80"
    depends_on:
      - backend

  backend:
    image: devkaran06/eventhubinda-backend:latest
    ports:
      - "5000:5000"
    environment:
      - NODE_ENV=production
```

Run with:
```bash
docker-compose -f docker-compose-hub.yml up
```

---

## 📋 GitHub Actions Integration

Once images are on Docker Hub, update GitHub Actions secrets:

**Settings → Secrets → Add**:
```
DOCKER_HUB_USERNAME = devkaran06
DOCKER_HUB_TOKEN = (generate token, not password)
```

This enables automatic Docker pushes on every commit to main.

---

## ⚠️ Security Notes

### Immediate Actions Required:
1. **🔐 Rotate Docker Hub Password**
   - Go to: https://hub.docker.com/settings/security
   - Change password immediately

2. **📝 Generate Access Token**
   - Go to: https://hub.docker.com/settings/security
   - Create new Personal Access Token
   - Use token instead of password in GitHub Actions

3. **🔒 Remove Credentials from Chat**
   - Don't share passwords in future communications
   - Use environment variables or secret managers

### Best Practices:
```bash
# Never commit credentials
echo "DOCKER_PASSWORD=***" >> .env  # ❌ Bad
export DOCKER_PASSWORD="***"         # ✓ Better

# Use GitHub Actions secrets
# Set in: Settings → Secrets & variables → Actions
# Reference in workflow: ${{ secrets.DOCKER_HUB_PASSWORD }}
```

---

## 🐛 Troubleshooting

### "Login failed"
```bash
# Verify credentials
docker login -u devkaran06

# If token-based:
docker login -u devkaran06 --password-stdin < token.txt
```

### "Build failed"
```bash
# Check Docker daemon
docker ps

# Rebuild with no cache
docker build --no-cache -t eventhubinda-frontend:latest .

# Check available disk space
docker system df
```

### "Push failed"
```bash
# Check network
ping docker.io

# Verify authentication
docker logout && docker login -u devkaran06

# Try pushing single image
docker push devkaran06/eventhubinda-frontend:latest
```

### "Permission denied"
```bash
# Run as admin (Windows)
# Run with sudo (Linux/Mac)

# Or add current user to docker group (Linux)
sudo usermod -aG docker $USER
```

---

## ✅ Verification

After pushing, verify images exist:

**Check locally:**
```bash
docker images | grep devkaran06
```

**Check on Docker Hub:**
1. Go to: https://hub.docker.com/r/devkaran06/eventhubinda-frontend
2. Go to: https://hub.docker.com/r/devkaran06/eventhubinda-backend
3. Verify tags are present (latest, v1.0)

---

## 📚 Next Steps

1. ✅ Push Docker images
2. ✅ Rotate Docker Hub password
3. ✅ Generate access token
4. ⏳ Configure GitHub Actions secrets
5. ⏳ Push code to GitHub
6. ⏳ Test automatic Docker builds

---

**Ready to push? Run:** `push-docker.bat` or `.\push-docker.ps1`
