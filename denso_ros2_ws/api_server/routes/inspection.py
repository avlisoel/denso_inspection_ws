from fastapi import APIRouter
from services.ros_launcher import run_inspection

router = APIRouter()

@router.post("/run_inspection/{name}")
def trigger_inspection(name: str):
    result = run_inspection(name)
    return result