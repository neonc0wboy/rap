#!/bin/bash

# Execute the PHP command and save the output to a file
php ./php > cipherseeds

# Read the contents of the file into an array using mapfile
mapfile -t col < cipherseeds

# Print each element of the array on a new line and append to a file
for cols in "${col[@]}"; do
  echo "$cols" >> linenums
done

# Read the first line of the file and extract the number
num=$(head -n 1 linenums | grep -o '[0-9]*')

# Read the wordlist file into an array
mapfile -t words < wordlist.txt

# Extract the first word from the array
word=${words[0]}

# Print the extracted values
echo "Number: $num, Word: $word"
