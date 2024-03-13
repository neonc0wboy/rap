#!/bin/bash

# Generate a new seed using the RapSeedBIP39 script
seed=$(./RapSeedBIP39)

# Save the seed to a temporary file
echo $seed > key.tmp

# Append the seed to the seeds file
echo $seed >> seeds

# Get the last line number from the wnum file
num=$(wc -l < ./wnum)

# Create two new wallets with different witness types using the generated seed
./cli-wallet --create-from-key "$(tail -n 1 key.tmp)" --witness-type legacy --file w[${num}]
./cli-wallet --create-from-key "$(tail -n 1 key.tmp)" --witness-type segwit --file w[${num}].segwit

# Remove the temporary file
rm key.tmp
