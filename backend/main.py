import logging
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import time

# Configure Structured Logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger(__name__)

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.middleware("http")
async def log_requests(request: Request, call_next):
    start_time = time.time()
    response = await call_next(request)
    process_time = time.time() - start_time
    logger.info(f"Path: {request.url.path} Method: {request.method} Status: {response.status_code} Duration: {process_time:.4f}s")
    return response

@app.get("/health")
def health_check():
    logger.info("Health check requested")
    return {"status": "healthy"}

import os

@app.get("/api/message")
def get_message():
    logger.info("Message API requested")
    
    # Check for Secret Injection
    db_pass = os.environ.get("DB_PASSWORD", "NOT_FOUND")
    secret_status = "Secret Injected!" if db_pass != "NOT_FOUND" else "Secret Missing"
    
    return {
        "message": "Hello Thisis DevOps Assignment from Python Backend! FastAPI + Docker + Docker Compose + GitHub Actions + Terraform + AWS + GCP",
        "secret_status": secret_status
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
