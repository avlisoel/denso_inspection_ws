# Cobotta Inspection Demo

This project uses a FastAPI server to trigger inspection routines on a Cobotta robot.

## Features
- API-driven trajectory selection
- ROS 2 integration
- Image capture and cloud upload

## Usage

### 1. Run your FastAPI server
```bash
python -m uvicorn main:app --host 0.0.0.0 --port 8000
```

### 2. Call your api
```bash
curl -X POST http://localhost:8000/run_inspection/battery
```
or

```bash 
Invoke-WebRequest -Uri http://localhost:8000/run_inspection/battery -Method POST 
```