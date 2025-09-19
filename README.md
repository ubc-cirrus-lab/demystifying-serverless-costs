[![DOI](https://zenodo.org/badge/1046588619.svg)](https://doi.org/10.5281/zenodo.17162822)
# Demystifying Serverless Costs
This repository contains the artifacts for EuroSys '26 Paper: "Demystifying Serverless Costs on Public Platforms: Bridging Billing, Architecture, and OS Scheduling."
This repository provides the data and figures presented in the paper and notebooks, scripts, and datasets to reproduce the results.

## Directory Structure

* The [`billing`](./billing) directory contains notebooks for analyzing current serverless billing models and practices.
* The [`serving-architecture`](./serving-architecture) directory contains notebooks for analyzing the hidden cost of modern serverless serving architectures.
* The [`os-scheduling`](./os-scheduling) directory contains notebooks for analyzing the impact of OS scheduling on serverless performance and costs.
* The [`dataset`](./dataset) directory contains released profiling data sets and scripts:
  * [concurrency_models](./dataset/concurrency_models): Request logs under varying rps and concurrency models.
  * [serving_architecture](./dataset/serving_architecture): Request logs of empty functions.
  * [keep_alive](./dataset/keep_alive): Keep-alive probabilities of functions hosted on three serverless platforms.
  * [cpu_overallocation](./dataset/cpu_overallocation): Request logs under varying fractional CPU allocations.
  * [scheduler_profiling](./dataset/scheduler_profiling): Scheduling setting profiling data of three serverless platforms and in-house VMs.
  * Scripts to download and process Huawei serverless traces used in the analysis.


## Getting Started
### System Requirements
* Python 3.10 or higher
* Dependencies: virtualenv, wget, unzip, git
* Python Packages: [`requirements.txt`](./requirements.txt)
* Storage: 350GB available disk space for traces and processed data sets
* Memory: Minimum 120GB RAM for running analysis notebooks and scripts

### Steps
1. Clone the artifact repository
```
git clone https://github.com/ubc-cirrus-lab/demystifying-serverless-costs.git
```
2. Define storage location for traces and datasets in `data.env` (default is `/data/huawei_traces`). The original traces and processed data will be stored in this directory.
3. Download Huawei serverless traces:
```
sh download_traces.sh
```
*Note: this may take a while depending on the network speed.*

4. Process traces  (this may take a while depending on the machine specs):
```
sh prepare_data.sh
```
*Note: Processing time varies based on system specifications.*

5. Execute the all-in-one script to reproduce all results:
```
sh all_in_one_script.sh
```

6. Alternatively, explore individual analysis notebooks in their respective directories.

### Estimated Execution Time
Based on testing with a server with the AMD Epyc 7642 processor, 256GB RAM, HDD storage, and 1 Gigabit Ethernet connection:
* Download the Huawei serverless traces (public request tables and public cold starts): ~90 minutes
* Data processing and preparation: ~400 minutes
* Analysis execution: ~90 minutes
  * Billable resources: ~25 minutes
  * Utilization rates: ~30 minutes
  * Billable differences: ~30 minutes
  * Serving architecture analysis: ~2 minutes
  * OS scheduling analysis: ~3 minutes

The total estimated runtime is around 9.5 hours for complete reproduction from raw data to final results. Actual runtime will vary based on your system's processor, storage type, and network bandwidth.

### Viewing Results
Individual notebooks: Results and figures are generated within their respective analysis directories (e.g., [`billing/figures`](./billing/figures)) and displayed inline in the self-explanatory notebooks.

All-in-one script: Figures are saved to their respective analysis directories (e.g., [`billing/figures`](./billing/figures)), while numerical results are printed to standard output.

### Small Test Script (Optional)
For quick validation of the artifact functionality, a small test script is provided in [`small_test.sh`](./small_test.sh). This test script automatically downloads a subset of traces, processes the data, and executes all analysis codes. It can run on commodity hardware (e.g., regular desktops/laptops) and complete in approximately 10 minutes. 

Run the all-in-one script for the small test:
```
sh small_test.sh
```

Please note that this small test is intended solely for quick verification of the artifact functionality and uses only a very limited subset of the full dataset, so the results will differ from those presented in the paper, which are based on complete dataset analysis.
