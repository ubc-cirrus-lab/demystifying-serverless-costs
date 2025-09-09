import pandas as pd
import os
import re
import sys

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

# If exactly one CLI arg is provided and it matches a known region, override
SUFFIX = ""
if len(sys.argv) == 2:
    if sys.argv[1] in REGIONS:
        REGIONS = [sys.argv[1]]
        SUFFIX = f"_{sys.argv[1]}"
        print(f"Processing only region {sys.argv[1]}")
    else:
        print(f"Unknown region {sys.argv[1]}, processing all regions")
print("Regions to process:", REGIONS)

# Collect all DataFrames first, then concatenate once
dataframes = []

pod_flavor_re = re.compile(r'(.+)-(\d+)-(\d+)-.+')

def parse_pod_flavor_safe(pod_id):
    """Safely parse podID with error handling, returns None if parsing fails"""
    try:
        match = pod_flavor_re.match(pod_id)
        if match:
            groups = match.groups()[1:]
            return (int(groups[0]), int(groups[1]))
        else:
            return None
    except (ValueError, IndexError, AttributeError):
        return None

original_total_rows = 0
processed_total_rows = 0

for region in REGIONS:
    files = os.listdir(os.path.join(TRACE_DATA_DIR, region))
    for file in files:
        if file.endswith('.csv'):
            print("Reading file: ", region, file)
            df = pd.read_csv(os.path.join(TRACE_DATA_DIR, region, file))
            initial_rows = len(df)
            # print out the progress with file number
            file_idx = files.index(file) + 1
            print(f"Processing file {file_idx}/{len(files)} ({region}/{file}):")

            df = df.dropna()
            T0 = df['time_worker'].min()
            TIME_WINDOW_SECONDS = 1e10
            df = df[(df['time_worker'] >= T0) & (df['time_worker'] <= T0 + TIME_WINDOW_SECONDS)]
            df = df[['podID', 'runtimeCost', 'cpu_usage', 'memory_usage']] # filter out unnecessary columns
            
            # parse pod flavor with safe error handling using apply
            df['podFlavor'] = df['podID'].apply(parse_pod_flavor_safe)
            
            # Remove rows where podFlavor parsing failed (returned None)
            original_total_rows += initial_rows
            df = df.dropna(subset=['podFlavor'])
            failed_rows = initial_rows - len(df)
            if failed_rows > 0:
                print(f"{failed_rows} rows had unparseable podIDs and were removed")
            
            df['cpu_cores'] = df['podFlavor'].apply(lambda x: x[0] / 1000)
            df['memory_mb'] = df['podFlavor'].apply(lambda x: x[1])

            # filter out data according to Huawei FunctionGraph resource specification constraints
            # https://support.huaweicloud.com/intl/en-us/usermanual-functiongraph/functiongraph_01_0310.html
            df = df[df['memory_mb'] <= 10240]
            
            # calculation
            df['relative_cpu_usage'] = df['cpu_usage'] / df['cpu_cores']
            df['relative_memory_usage'] = df['memory_usage'] / df['memory_mb']
            df['cpu_time'] = df['cpu_usage'] * df['runtimeCost']
            
            # drop pod flavor column
            df = df.drop(columns=['podFlavor'])
            print(f"Processed {df.shape[0]} rows from {region}/{file}")
            processed_total_rows += df.shape[0]
            dataframes.append(df)

print("Combining all data...")
if dataframes:
    data = pd.concat(dataframes, ignore_index=True)
    print(f"Final combined data shape: {data.shape}")
else:
    print("No data processed!")
    data = pd.DataFrame()
            
print("Saving processed data...")
if not data.empty:
    data.to_pickle(os.path.join(TRACE_DATA_DIR, f'huawei_25_traces_public_request_tables.pkl'))
    print("Processed data saved to ", os.path.join(TRACE_DATA_DIR, f'huawei_25_traces_public_request_tables.pkl'))
else:
    print("No data to save!")

with open(os.path.join(CURRENT_DIR, f"public_request_tables{SUFFIX}.log"), "w") as log_file:
    log_file.write(f"Original total rows: {original_total_rows}\n")
    log_file.write(f"Processed total rows: {processed_total_rows}\n")
    log_file.write(f"Final combined data shape: {data.shape}\n")
