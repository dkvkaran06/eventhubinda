# 🚀 Quick Start - How to Run Everything

## **FASTEST WAY: Docker Compose** ⚡
```bash
docker-compose up --build
```
- Starts frontend + backend automatically
- Frontend: http://localhost
- Backend: http://localhost:5000
- Stop: `Ctrl+C` or `docker-compose down`

---

## **FOR DEVELOPMENT: Vite Dev Server** 💻
```bash
npm install --legacy-peer-deps
npm run dev
```
- Frontend only: http://localhost:5173
- Hot reload enabled
- Fast refresh on code changes

---

## **PRODUCTION BUILD** 📦
```bash
npm run build
npm run preview
```
- Optimized production bundle
- Preview: http://localhost:4173
- Output in `dist/` folder

---

## **PUSH DOCKER IMAGES TO DOCKER HUB** 🐳
```bash
# Option A: Windows CMD
push-docker.bat

# Option B: PowerShell
.\push-docker.ps1

# Option C: Manual
docker login -u devkaran06
docker build -t eventhubinda-frontend:latest .
docker build -t eventhubinda-backend:latest ./backend
docker tag eventhubinda-frontend:latest devkaran06/eventhubinda-frontend:latest
docker tag eventhubinda-backend:latest devkaran06/eventhubinda-backend:latest
docker push devkaran06/eventhubinda-frontend:latest
docker push devkaran06/eventhubinda-backend:latest
```

**Your Hub:** https://hub.docker.com/u/devkaran06

---

## **PUSH CODE TO GITHUB** 📤
```bash
git add .
git commit -m "Initial commit: EventHub India"
git branch -M main
git remote add origin https://github.com/dkvkaran06/eventhubinda.git
git push -u origin main
```

**Repo:** https://github.com/dkvkaran06/eventhubinda

---

## **AVAILABLE NPM SCRIPTS** 🛠️

| Command | What it does |
|---------|-------------|
| `npm run dev` | Start Vite dev server (frontend only) |
| `npm run build` | Build for production |
| `npm run preview` | Preview production build |
| `npm run lint` | Run ESLint |

---

## **DOCKER COMMANDS** 🐋

| Command | What it does |
|---------|-------------|
| `docker-compose up` | Start everything |
| `docker-compose down` | Stop everything |
| `docker build -t name:tag .` | Build image |
| `docker run -p port:port image` | Run container |
| `docker login` | Login to Docker Hub |
| `docker push image` | Push to Docker Hub |

---

## **FOLDER STRUCTURE** 📁
```
eventhubinda/
├── src/                 ← Frontend React code
├── backend/            ← Backend Express API
├── public/             ← Static files
├── dist/               ← Build output (generated)
├── Dockerfile          ← Frontend container
├── docker-compose.yml  ← Multi-container setup
├── package.json        ← Dependencies
└── .env                ← Environment variables
```

---

## **PORTS** 🔌

| Service | Port | Access |
|---------|------|--------|
| Frontend (Vite) | 5173 | http://localhost:5173 |
| Frontend (Production) | 80 | http://localhost |
| Backend | 5000 | http://localhost:5000 |

---

## **ENVIRONMENT SETUP** ⚙️
```bash
# Create .env file
cp .env.example .env

# Edit .env with your values:
VITE_API_URL=http://localhost:5000
VITE_RAZORPAY_KEY_ID=your_key
VITE_FIREBASE_API_KEY=your_key
# ... more variables
```

---

## **QUICK CHECKLIST** ✓

- [ ] Run: `docker-compose up --build`
- [ ] Check: Frontend at http://localhost
- [ ] Check: Backend at http://localhost:5000
- [ ] Build: `npm run build`
- [ ] Push Docker: `push-docker.bat`
- [ ] Push Git: `git push -u origin main`
- [ ] Configure GitHub Secrets
- [ ] Verify on GitHub Actions

---

## **NEED HELP?** 📖

- **Local dev**: `npm run dev` + `cd backend && npm start`
- **Full stack**: `docker-compose up --build`
- **Docker Hub**: `push-docker.bat`
- **GitHub**: `git push -u origin main`
- **Docs**: See `DEPLOYMENT_GUIDE.md`

**Status**: Ready to go! 🎉
