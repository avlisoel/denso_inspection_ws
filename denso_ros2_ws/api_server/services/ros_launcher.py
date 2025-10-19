import subprocess

def run_inspection(name: str):
    try:
        result = subprocess.run(
            ["ros2", "run", "cobotta_inspection", "inspection_executor", name],
            capture_output=True,
            text=True,
            check=True
        )
        return {"status": "success", "output": result.stdout}
    except subprocess.CalledProcessError as e:
        return {"status": "error", "message": e.stderr}