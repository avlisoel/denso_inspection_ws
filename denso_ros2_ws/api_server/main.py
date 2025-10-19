from fastapi import FastAPI
from routes import inspection

app = FastAPI()
app.include_router(inspection.router)