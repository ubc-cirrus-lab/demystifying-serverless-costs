#!/bin/sh

# Create virtual environment and install dependencies
echo "Creating virtual environment and installing dependencies..."
virtualenv venv
venv/bin/pip3 install -r requirements.txt

# Process dataset
echo "Processing dataset..."
cd dataset
../venv/bin/python3 process_public_cold_starts.py
../venv/bin/python3 process_request_usage_rt.py
../venv/bin/python3 process_public_request_tables.py

echo "Dataset processed."
