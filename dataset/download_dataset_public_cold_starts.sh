#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Get trace data dir from SCRIPT_DIR/../data.env
TRACE_DATA_DIR="$(grep TRACE_DATA_DIR "$SCRIPT_DIR/../data.env" | cut -d '=' -f2)"
echo "Trace data path: $TRACE_DATA_DIR"

OUTDIR="$TRACE_DATA_DIR/public_cold_starts"
mkdir -p "$OUTDIR"

cd "$OUTDIR"

mkdir R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/cold_start/R1.zip
unzip -j R1.zip "*.csv" -d R1
mkdir R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/cold_start/R2.zip
unzip -j R2.zip "*.csv" -d R2
mkdir R3
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/cold_start/R3.zip
unzip -j R3.zip "*.csv" -d R3
mkdir R4
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/cold_start/R4.zip
unzip -j R4.zip "*.csv" -d R4
mkdir R5
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/cold_start/R5.zip
unzip -j R5.zip "*.csv" -d R5