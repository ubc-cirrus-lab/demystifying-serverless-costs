import os
import pandas as pd


CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
# Get trace data dir from CURRENT_DIR/../data.env
with open(os.path.join(CURRENT_DIR, '../data.env')) as f:
    for line in f:
        if line.startswith('TRACE_DATA_DIR'):
            TRACE_DATA_DIR = line.split('=')[1].strip()
            break
TRACE_DATA_DIR = os.path.join(TRACE_DATA_DIR, 'public_request_tables')
print("Using TRACE_DATA_DIR:", TRACE_DATA_DIR)
# Schema URL: https://github.com/sir-lab/data-release/blob/main/README_data_release_2025.md#huawei-public-request-tables
REGIONS = ['R1', 'R2', 'R3', 'R4', 'R5']
# Directory structure
# TRACE_DATA_DIR/R1/*.csv
# TRACE_DATA_DIR/R2/*.csv
# ...


SELECTED_COLUMNS = [
    'podID',
    'memory_usage',
    'cpu_usage',
    'runtimeCost',
]


total_rows = 0

all_data = []

for region in REGIONS:
    csv_files = [f for f in os.listdir(os.path.join(TRACE_DATA_DIR, region))
                 if f.endswith('.csv')]

    for idx, filename in enumerate(csv_files, start=1):
        filepath = os.path.join(TRACE_DATA_DIR, region, filename)
        print(f"Processing Region {region} file {filename} ({idx}/{len(csv_files)})")

        df = pd.read_csv(filepath, usecols=SELECTED_COLUMNS)
        total_rows += len(df)
        all_data.append(df)
        print(f"  Current total rows: {total_rows}")

print("Combining all data...")
data = pd.concat(all_data, ignore_index=True)

print("Saving processed data...")

output_path = os.path.join(TRACE_DATA_DIR, 'huawei_25_traces_request_usage_rt.pkl')
data.to_pickle(output_path)

print(f"Processed data saved to {output_path}")

with open(os.path.join(CURRENT_DIR, "huawei_25_traces_request_usage_rt.log"), "w") as log_file:
    log_file.write(f"Total rows: {total_rows}\n")
    log_file.write(f"Final combined data shape: {data.shape}\n")
