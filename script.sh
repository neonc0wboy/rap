#!/bin/bash

# Run the translate script and store its output in a variable
translated_text=$(./translate)

# Print the translated text
echo "$translated_text"

# Run the RapTextEng script and store its output in a variable
rap_text=$(./RapTextEng)

# Print the output of RapTextEng
echo "$rap_text"
