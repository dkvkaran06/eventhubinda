# 🔧 GITHUB SECRETS SETUP - Complete Guide

## ❌ ERROR: "Username and password required"

This means GitHub Secrets `DOCKER_HUB_USERNAME` and `DOCKER_HUB_TOKEN` are NOT configured.

---

## ✅ SOLUTION - Add Secrets in 3 Steps

### **STEP 1: Generate Docker Hub Token** 🔑

1. Go to: https://hub.docker.com/settings/security
2. Click **"New Personal Access Token"**
3. Name it: `github-actions`
4. Select permissions: **Read & Write**
5. Click **Generate**
6. **COPY THE TOKEN** (you won't see it again!)

Save it somewhere safe - you'll use it in Step 2.

---

### **STEP 2: Add Secrets to GitHub** 🐙

**Go to**: https://github.com/dkvkaran06/eventhubinda/settings/secrets/actions

#### **Add Secret #1:**
```
Name:  DOCKER_HUB_USERNAME
Value: devkaran06
```
Click **Add secret**

#### **Add Secret #2:**
```
Name:  DOCKER_HUB_TOKEN
Value: (paste the token from Step 1)
```
Click **Add secret**

**Result**: You should see both secrets listed now ✅

---

### **STEP 3: Re-run the Failed Workflow** 🔄

1. Go to: https://github.com/dkvkaran06/eventhubinda/actions
2. Click on the **red X workflow** (Initial commit: EventHub India)
3. Click **"Re-run jobs"** (top right button)
4. Wait 10-15 minutes

**Then**: ✅ Docker images will push to Docker Hub!

---

## 📸 Visual Step-by-Step

### **Where to Add Secrets:**

```
GitHub Repo
   ↓
Settings (gear icon)
   ↓
Secrets and variables
   ↓
Actions
   ↓
New repository secret (button)
   ↓
Add DOCKER_HUB_USERNAME
   ↓
Add DOCKER_HUB_TOKEN
```

---

## ✨ What Happens After

**When workflow re-runs:**
1. ✅ Frontend build → Success
2. ✅ Backend check → Success
3. ✅ Docker login → Success (now has credentials)
4. ✅ Build frontend image → Success
5. ✅ Push to Docker Hub → Success
6. ✅ Build backend image → Success
7. ✅ Push to Docker Hub → Success

**Final Result**: 
```
https://hub.docker.com/r/devkaran06/eventhubinda-frontend
https://hub.docker.com/r/devkaran06/eventhubinda-backend
```

---

## 🎯 Quick Checklist

- [ ] Visit: https://hub.docker.com/settings/security
- [ ] Generate new Personal Access Token
- [ ] Copy the token
- [ ] Go to: https://github.com/dkvkaran06/eventhubinda/settings/secrets/actions
- [ ] Add `DOCKER_HUB_USERNAME` = `devkaran06`
- [ ] Add `DOCKER_HUB_TOKEN` = (paste token)
- [ ] Go to: https://github.com/dkvkaran06/eventhubinda/actions
- [ ] Re-run the failed workflow
- [ ] Wait 10-15 minutes
- [ ] ✅ Check Docker Hub for images

---

## 🔐 Security Notes

✅ Use Personal Access Token (not password)  
✅ Tokens can be revoked anytime  
✅ Secrets are encrypted by GitHub  
✅ Secrets are never shown in logs  

---

## ⚠️ If Token Copy Fails

If you lose the token during Step 1, you must **delete it** and **create a new one**:

1. Go to: https://hub.docker.com/settings/security
2. Find the token
3. Click trash icon to delete
4. Create new token
5. Copy it immediately
6. Update GitHub secret

---

## 🚀 After Secrets Are Added

Your workflow will:
- Automatically run on every push to `main`
- Build Docker images
- Push to Docker Hub
- Show status in GitHub Actions tab

**View at**: https://hub.docker.com/r/devkaran06

---

**Status**: Ready to add secrets  
**Time to complete**: 5 minutes  
**Next step**: Follow the steps above!
