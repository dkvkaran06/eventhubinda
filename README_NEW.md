# eventhubinda

**A comprehensive event management and ticketing platform**

## 📋 Project Overview
EventHub India is a full-stack web application for event management, ticket booking, and payment processing. Built with modern technologies for scalability and performance.

## 🏗️ Architecture

### Frontend
- **Framework**: React 18 + TypeScript
- **Build Tool**: Vite
- **Styling**: Tailwind CSS
- **State Management**: Context API / Redux
- **HTTP Client**: Axios

### Backend
- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: MongoDB
- **ORM**: Mongoose
- **Authentication**: JWT + Firebase

### DevOps
- **Containerization**: Docker & Docker Compose
- **CI/CD**: GitHub Actions
- **Hosting**: Render / Vercel
- **Reverse Proxy**: Nginx

## 🚀 Quick Start

### Prerequisites
- Node.js 20+
- npm or yarn
- Docker & Docker Compose (for containerized setup)

### Installation

```bash
# Clone repository
git clone https://github.com/dkvkaran06/eventhubinda.git
cd eventhubinda

# Install dependencies
npm install --legacy-peer-deps

# Install backend dependencies
cd backend
npm install
cd ..
```

### Environment Setup

Create `.env` file in root directory with required variables:
```env
VITE_API_URL=http://localhost:5000
VITE_RAZORPAY_KEY_ID=your_key
VITE_FIREBASE_API_KEY=your_key
# See .env.example for complete list
```

### Development

```bash
# Frontend only
npm run dev

# Full stack with Docker Compose
docker-compose up
```

### Build

```bash
# Build frontend
npm run build

# Build Docker images
docker build -t ticketcharge-frontend .
docker build -t ticketcharge-backend ./backend
```

## 📦 GitHub Actions & CI/CD

This project includes automated workflows:
- ✅ Frontend build & test on every push
- ✅ Backend validation
- ✅ Docker image build & push to Docker Hub (main branch only)
- 🔐 Secrets required: `DOCKER_HUB_USERNAME`, `DOCKER_HUB_TOKEN`, Firebase/Razorpay keys

## 📁 Project Structure

```
eventhubinda/
├── src/              # Frontend React components
├── backend/          # Express.js backend API
├── public/           # Static assets
├── dist/             # Built frontend (generated)
├── Dockerfile        # Frontend container
├── docker-compose.yml
├── .github/workflows/ # CI/CD pipelines
└── README.md         # This file
```

## 🐳 Docker Deployment

### Using Docker Compose
```bash
docker-compose up --build
```

### Manual Docker Build
```bash
# Build frontend
docker build -t my-registry/eventhubin-frontend:latest .

# Build backend
docker build -t my-registry/eventhubin-backend:latest ./backend

# Push to registry
docker push my-registry/eventhubin-frontend:latest
docker push my-registry/eventhubin-backend:latest
```

## 📝 Available Scripts

- `npm run dev` - Start Vite dev server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint

## 🔑 Required Environment Variables

See `.env.example` for comprehensive list. Critical ones:
- `VITE_API_URL` - Backend API URL
- `VITE_RAZORPAY_KEY_ID` - Payment gateway key
- Firebase configuration variables

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📄 License

This project is licensed under MIT - see LICENSE file for details

## 👤 Author

Developed by Dev Team @ EventHub India
