#!/bin/bash

# Smart Refrigerator Project Startup Script (Linux/Mac)

echo "===================================="
echo "Smart Refrigerator - Development"
echo "===================================="
echo ""

# Check Conda environment
if ! conda env list | grep -q "intelligent_refrigerator"; then
    echo "[ERROR] Conda environment not found. Please run setup first."
    exit 1
fi

# Display menu
echo "Select a service to start:"
echo "1. Backend (FastAPI)"
echo "2. Frontend (Vue3 + Vite)"
echo "3. Both (in separate terminals)"
echo "4. Exit"
echo ""

read -p "Enter choice (1-4): " choice

case $choice in
    1)
        echo ""
        echo "Starting backend service..."
        cd backend
        conda run -n intelligent_refrigerator python main.py
        ;;
    2)
        echo ""
        echo "Starting frontend service..."
        cd frontend
        conda run -n intelligent_refrigerator npm run dev
        ;;
    3)
        echo ""
        echo "Starting backend and frontend services..."
        echo ""
        
        # Start backend in background
        cd backend
        conda run -n intelligent_refrigerator python main.py &
        BACKEND_PID=$!
        
        sleep 3
        
        # Start frontend
        cd ../frontend
        echo "Frontend starting (backend PID: $BACKEND_PID)..."
        conda run -n intelligent_refrigerator npm run dev
        
        # After frontend stops, kill the backend
        kill $BACKEND_PID 2>/dev/null
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please run the script again."
        exit 1
        ;;
esac
