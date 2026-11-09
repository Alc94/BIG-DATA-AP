#!/usr/bin/env bash
# Crea las bases de datos de la práctica (ejecutar tras "docker compose up -d")
docker exec influxdb3 influxdb3 create database trafico_raw
docker exec influxdb3 influxdb3 create database trafico_5m
