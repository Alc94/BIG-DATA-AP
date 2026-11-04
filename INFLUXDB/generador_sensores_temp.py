import time
import random
from influxdb_client import InfluxDBClient, Point
from influxdb_client.client.write_api import SYNCHRONOUS

# Configuración de conexión
URL = "http://localhost:8086"
TOKEN = "rargKbWEZmdCz-O1PEYr5IEQGNrJrD0g9VR-iVtT2y69gMk1AEqC3Te6UM1pR1H0Vpmvvh3Tm9xc5GTZbg4EZw=="
ORG = "IABD"
BUCKET = "sensores"

# Inicializar cliente
client = InfluxDBClient(url=URL, token=TOKEN, org="IABD")
write_api = client.write_api(write_options=SYNCHRONOUS)

print("🚀 Enviando datos de telemetría a InfluxDB 2.7 (Presiona Ctrl+C para detener)...")

try:
    while True:
        # Generar valores simulados
        temp = round(random.uniform(18.0, 35.0), 2)
        hum = round(random.uniform(40.0, 80.0), 2)
        
        # Construir punto de datos (Line Protocol)
        point = Point("clima") \
            .tag("ubicacion", "sevilla") \
            .field("temperatura", temp) \
            .field("humedad", hum)
        
        # Enviar a InfluxDB
        write_api.write(bucket=BUCKET, org=ORG, record=point)
        print(f"Enviado -> temperatura={temp}ºC, humedad={hum}%")
        
        time.sleep(2)  # Pausa de 2 segundos entre lecturas

except KeyboardInterrupt:
    print("\nSimulación finalizada.")
    client.close()
