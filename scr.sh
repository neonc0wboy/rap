#!/bin/bash

# Generate a new seed using the RapSeedBIP39 script
if ! seed=$(./RapSeedBIP39); then
    echo "Error generating seed"
    exit 1
fi

# Save the seed to a temporary file
if ! echo "$seed" > key.tmp; then
    echo "Error creating temporary file"
    exit 1
fi

# Append the seed to the seeds file
if ! echo "$seed" >> seeds; then
    echo "Error appending seed to seeds file"
    exit 1
fi

# Save the last line number from the wnum file
if ! num=$(wc -l < ./wnum); then
    echo "Error getting line number from wnum"
    exit 1
fi

# Print the line number to the console
echo "Last line number in wnum: $num"
