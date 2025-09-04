#!/bin/sh

# Create virtual environment and install dependencies
echo "Creating virtual environment and installing dependencies..."
virtualenv venv
venv/bin/pip3 install -r requirements.txt


# Convert Jupyter notebooks into Python scripts
venv/bin/jupyter nbconvert --to script billing/Serverless_vs_Iaas_CaaS.ipynb
venv/bin/jupyter nbconvert --to script billing/Resource_Prices.ipynb
venv/bin/jupyter nbconvert --to script billing/Billable_Resources.ipynb
venv/bin/jupyter nbconvert --to script billing/Utilization_Rates.ipynb
venv/bin/jupyter nbconvert --to script billing/Billables_Diff.ipynb
venv/bin/jupyter nbconvert --to script billing/Invocation_Fees_and_Billing_Granularities.ipynb

venv/bin/jupyter nbconvert --to script serving-architecture/Concurrency_Models.ipynb
venv/bin/jupyter nbconvert --to script serving-architecture/Serving_Architecture.ipynb
venv/bin/jupyter nbconvert --to script serving-architecture/Keep_Alive.ipynb

venv/bin/jupyter nbconvert --to script os-scheduling/Overallocation_AWS.ipynb
venv/bin/jupyter nbconvert --to script os-scheduling/Overallocation_GCP.ipynb
venv/bin/jupyter nbconvert --to script os-scheduling/Request_CPU_Time.ipynb
venv/bin/jupyter nbconvert --to script os-scheduling/Bandwidth_Control.ipynb
venv/bin/jupyter nbconvert --to script os-scheduling/Scheduler_Profiling_AWS.ipynb
venv/bin/jupyter nbconvert --to script os-scheduling/Scheduler_Profiling_GCP.ipynb
venv/bin/jupyter nbconvert --to script os-scheduling/Scheduler_Profiling_IBM.ipynb
venv/bin/jupyter nbconvert --to script os-scheduling/Scheduler_Profiling_CFS_vs_EEVDF.ipynb



# Run
cd billing
../venv/bin/python3 Serverless_vs_Iaas_CaaS.py
../venv/bin/python3 Resource_Prices.py
../venv/bin/python3 Billable_Resources.py
../venv/bin/python3 Utilization_Rates.py
../venv/bin/python3 Billables_Diff.py
../venv/bin/python3 Invocation_Fees_and_Billing_Granularities.py

cd ..
cd serving-architecture
../venv/bin/python3 Concurrency_Models.py
../venv/bin/python3 Serving_Architecture.py
../venv/bin/python3 Keep_Alive.py

cd ..
cd os-scheduling
../venv/bin/python3 Overallocation_AWS.py
../venv/bin/python3 Overallocation_GCP.py
../venv/bin/python3 Request_CPU_Time.py
../venv/bin/python3 Bandwidth_Control.py
../venv/bin/python3 Scheduler_Profiling_AWS.py
../venv/bin/python3 Scheduler_Profiling_GCP.py
../venv/bin/python3 Scheduler_Profiling_IBM.py
../venv/bin/python3 Scheduler_Profiling_CFS_vs_EEVDF.py

echo "Done."
