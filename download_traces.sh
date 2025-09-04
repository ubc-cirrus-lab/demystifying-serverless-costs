#!/bin/sh

# Create virtual environment and install dependencies
echo "Creating virtual environment and installing dependencies..."
virtualenv venv
venv/bin/pip3 install -r requirements.txt

# Download traces
echo "Downloading traces..."
sh dataset/download_dataset_public_request_tables.sh
sh dataset/download_dataset_public_request_tables.sh

echo "Traces downloaded."
