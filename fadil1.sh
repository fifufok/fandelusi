#!/bin/bash

# Step 1: Navigate to home directory and download SRBMiner
cd ~
wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.7.3/SRBMiner-Multi-2-7-3-Linux.tar.gz

echo "Extracting SRBMiner..."
tar -xzvf SRBMiner-Multi-2-7-3-Linux.tar.gz

# Step 2: Navigate to extracted folder
clear
cd SRBMiner-Multi-2-7-3

# Step 3: Define initial mining command
INITIAL_COMMAND="./SRBMiner-MULTI --disable-gpu --algorithm verushash --pool us.vipor.net:5040 --wallet RVY4E9am31PyyA7YHbYzwmVsirmRduaxbb --Worker fadil1 --password x --cpu-threads 4"

# Step 4: Run initial mining process
echo "Starting initial mining process..."
eval $INITIAL_COMMAND

# Step 5: Define secondary command for loop with restart capability
SECONDARY_COMMAND="./SRBMiner-MULTI --disable-gpu --algorithm verushash --pool us.vipor.net:5040 --wallet RVY4E9am31PyyA7YHbYzwmVsirmRduaxbb --Worker fadil1 --password x --cpu-threads 4"

# Step 6: Loop for restart mechanism
while true; do
    echo "Starting mining process with restart mechanism..."
    eval $SECONDARY_COMMAND

    # Check exit status
    if [ $? -ne 0 ]; then
        echo "Mining process crashed. Restarting in 1 second..."
    else
        echo "Mining process exited gracefully. Restarting in 1 second..."
    fi

    # Wait for 1 second before restarting
    sleep 1
done
