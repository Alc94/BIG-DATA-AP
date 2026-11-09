import random
import time
import urllib.request

URL = "http://localhost:8186/api/v2/write?bucket=trafico_raw&precision=ns"
DEVICES = ["router1", "router2"]

while True:
    ts = time.time_ns()
    lines = []
    for device in DEVICES:
        traffic_in = round(random.uniform(50, 200), 2)
        traffic_out = round(random.uniform(40, 180), 2)
        latency = round(random.uniform(5, 50), 2)
        lines.append(
            f"traffic,device={device} traffic_in={traffic_in},"
            f"traffic_out={traffic_out},latency={latency} {ts}"
        )
    body = ("\n".join(lines) + "\n").encode()
    req = urllib.request.Request(URL, data=body, method="POST")
    urllib.request.urlopen(req)
    print(f"Enviados datos de {len(DEVICES)} routers")
    time.sleep(1)
