#!/bin/sh

# Create virtual environment and install dependencies
echo "Creating virtual environment and installing dependencies..."
virtualenv venv
venv/bin/pip3 install -r requirements.txt


SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Get trace data dir from SCRIPT_DIR/../data.env
TRACE_DATA_DIR="$(grep TRACE_DATA_DIR "$SCRIPT_DIR/data.env" | cut -d '=' -f2)"
# Append a subdir to the trace data dir for this specific small test case
TRACE_DATA_DIR="$TRACE_DATA_DIR/small_test"
echo "Trace data path: $TRACE_DATA_DIR"

# download public_request_tables dataset
OUTDIR="$TRACE_DATA_DIR/public_request_tables"
mkdir -p "$OUTDIR"
cd "$OUTDIR"
mkdir R5
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R5/R5.zip
unzip -o -j R5.zip "*.csv" -d R5

# download public_cold_starts dataset
OUTDIR="$TRACE_DATA_DIR/public_cold_starts"
mkdir -p "$OUTDIR"
cd "$OUTDIR"
mkdir R5
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/cold_start/R5.zip
unzip -o -j R5.zip "*.csv" -d R5

echo "Datasets downloaded."
cd "$SCRIPT_DIR"

# modify data.env to point to the small test trace data dir
# back up original data.env to data.env.tmp
cp "$SCRIPT_DIR/data.env" "$SCRIPT_DIR/data.env.tmp"
# change TRACE_DATA_DIR in data.env to the small test trace data dir
sed -i "s|^TRACE_DATA_DIR=.*$|TRACE_DATA_DIR=$TRACE_DATA_DIR|" "$SCRIPT_DIR/data.env"
# Restore data.env to point to the original trace data dir after the script ends
trap 'mv "$SCRIPT_DIR/data.env.tmp" "$SCRIPT_DIR/data.env"' EXIT

# Process dataset
echo "Processing dataset..."
cd dataset
../venv/bin/python3 process_public_cold_starts.py R5
../venv/bin/python3 process_request_usage_rt.py R5
../venv/bin/python3 process_public_request_tables.py R5

echo "Dataset processed."

# Run all in one script
cd ..
sh all_in_one_script.sh

echo "Small test completed."
