#!/usr/bin/env bash

# Destino: Telegraf (puerto 8186). El bucket lo decide Telegraf, pero la API lo exige.
URL="http://localhost:8186/api/v2/write?bucket=trafico_raw&precision=ns"
DEVICES=("router1" "router2")

rand() {
  python3 - "$@" <<'PY'
import random, sys
low, high = float(sys.argv[1]), float(sys.argv[2])
print(f"{random.uniform(low, high):.2f}")
PY
}

while true; do
  TS=$(date +%s%N)
  BODY=""
  for DEVICE in "${DEVICES[@]}"; do
    TRAFFIC_IN=$(rand 50 200)
    TRAFFIC_OUT=$(rand 40 180)
    LATENCY=$(rand 5 50)
    BODY+="traffic,device=${DEVICE} traffic_in=${TRAFFIC_IN},traffic_out=${TRAFFIC_OUT},latency=${LATENCY} ${TS}"$'\n'
  done
  curl -s -X POST "$URL" --data-binary "$BODY"
  echo "Enviados datos de ${#DEVICES[@]} routers a $(date '+%H:%M:%S')"
  sleep 1
done
