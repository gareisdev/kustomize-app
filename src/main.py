from fastapi import FastAPI
import os
import socket

app = FastAPI()

@app.get("/podinfo")
def get_pod_info():
    pod_name = os.getenv("HOSTNAME", "Unknown")
    pod_ip = socket.gethostbyname(socket.gethostname())

    return {
        "pod_name": pod_name,
        "pod_ip": pod_ip,
    }

