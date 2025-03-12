#!/bin/bash

# Infinite loop to install requirements every 10 seconds
while true; do
  echo "Installing dependencies from scratch..."
  pip install --no-cache-dir -r /app/requirements.txt  # Install requirements
  sleep 10  # Wait for 10 seconds before reinstalling
done
