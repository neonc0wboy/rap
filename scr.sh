#!/bin/bash

# Generate a new seed using the RapSeedBIP39 script
if ! seed=$(./RapSeedBIP39); then
    echo "Error generating seed"
    exit 1
fi

# Save the seed to a temporary file
echo "$seed" > key.tmp

# Append the seed to the seeds file
echo "$seed" >> seeds

# Get the last line number from the wnum file
if ! num=$(wc -l < ./wnum); then
    echo "Error getting line number from wnum"
    exit 1
fi

