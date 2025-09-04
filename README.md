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
* Storage: 200GB available disk space for traces and processed data sets
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

5. Explore individual analysis notebooks in their respective directories.

6. Alternatively, execute the all-in-one script to reproduce all results:
```
sh all_in_one_script.sh
```

### Viewing Results
Individual notebooks: Results and figures are generated within their respective analysis directories (`figures`) and displayed inline in the self-explanatory notebooks.

All-in-one script: Figures are saved to their respective analysis directories (`figures`), while numerical results are printed to standard output.
