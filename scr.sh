#!/bin/bash

seed=$(./RapSeedBIP39)
echo $seed > key.tmp
echo $seed >> seeds 
num=$(tail -n 1 ./wnum)

cli-wallet --create-from-key "$(tail -n 1 key.tmp)" --witness-type legacy w[i]
cli-wallet --create-from-key "$(tail -n 1 key.tmp)" --witness-type segwit w[i+1]
