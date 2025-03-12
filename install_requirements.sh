#!/bin/bash

# Infinite loop to install requirements every 10 seconds
while true; do
  echo "Installing dependencies from scratch..."
  pip install --upgrade --force-reinstall --trusted-host pypi-server:8080 --no-cache-dir -r /app/requirements.txt  --verbose 
  # Install requirements - reinstall, dont cache and trust http host "pypi-server"
  python3 /app/app.py
  sleep 10  # Wait for 10 seconds before reinstalling
done
