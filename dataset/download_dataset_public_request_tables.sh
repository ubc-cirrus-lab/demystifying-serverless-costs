#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Get trace data dir from SCRIPT_DIR/../data.env
TRACE_DATA_DIR="$(grep TRACE_DATA_DIR "$SCRIPT_DIR/../data.env" | cut -d '=' -f2)"
echo "Trace data path: $TRACE_DATA_DIR"

OUTDIR="$TRACE_DATA_DIR/public_request_tables"
mkdir -p "$OUTDIR"

cd "$OUTDIR"

mkdir R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00000_00009.zip
unzip -j R1_00000_00009.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00010_00019.zip
unzip -j R1_00010_00019.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00020_00029.zip
unzip -j R1_00020_00029.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00030_00039.zip
unzip -j R1_00030_00039.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00040_00049.zip
unzip -j R1_00040_00049.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00050_00059.zip
unzip -j R1_00050_00059.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00060_00069.zip
unzip -j R1_00060_00069.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00070_00079.zip
unzip -j R1_00070_00079.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00080_00089.zip
unzip -j R1_00080_00089.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00090_00099.zip
unzip -j R1_00090_00099.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00100_00109.zip
unzip -j R1_00100_00109.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00110_00119.zip
unzip -j R1_00110_00119.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00120_00129.zip
unzip -j R1_00120_00129.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00130_00139.zip
unzip -j R1_00130_00139.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00140_00149.zip
unzip -j R1_00140_00149.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00150_00159.zip
unzip -j R1_00150_00159.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00160_00169.zip
unzip -j R1_00160_00169.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00170_00179.zip
unzip -j R1_00170_00179.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00180_00189.zip
unzip -j R1_00180_00189.zip "*.csv" -d R1
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R1/R1_00190_00199.zip
unzip -j R1_00190_00199.zip "*.csv" -d R1
mkdir R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00000_00019.zip
unzip -j R2_00000_00019.zip "*.csv" -d R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00020_00039.zip
unzip -j R2_00020_00039.zip "*.csv" -d R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00040_00059.zip
unzip -j R2_00040_00059.zip "*.csv" -d R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00060_00079.zip
unzip -j R2_00060_00079.zip "*.csv" -d R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00080_00099.zip
unzip -j R2_00080_00099.zip "*.csv" -d R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00100_00119.zip
unzip -j R2_00100_00119.zip "*.csv" -d R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00120_00139.zip
unzip -j R2_00120_00139.zip "*.csv" -d R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00140_00159.zip
unzip -j R2_00140_00159.zip "*.csv" -d R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00160_00179.zip
unzip -j R2_00160_00179.zip "*.csv" -d R2
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R2/R2_00180_00199.zip
unzip -j R2_00180_00199.zip "*.csv" -d R2
mkdir R3
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R3/R3_00000_00039.zip
unzip -j R3_00000_00039.zip "*.csv" -d R3
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R3/R3_00040_00079.zip
unzip -j R3_00040_00079.zip "*.csv" -d R3
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R3/R3_00080_00119.zip
unzip -j R3_00080_00119.zip "*.csv" -d R3
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R3/R3_00120_00159.zip
unzip -j R3_00120_00159.zip "*.csv" -d R3
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R3/R3_00160_00199.zip
unzip -j R3_00160_00199.zip "*.csv" -d R3
mkdir R4
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R4/R4_00000_00099.zip
unzip -j R4_00000_00099.zip "*.csv" -d R4
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R4/R4_00100_00199.zip
unzip -j R4_00100_00199.zip "*.csv" -d R4
mkdir R5
wget https://sir-dataset.obs.cn-east-3.myhuaweicloud.com/datasets/cold_start_dataset/per_request/R5/R5.zip
unzip -j R5.zip "*.csv" -d R5
