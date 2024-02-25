php ./ph > cipherseeds

python3 -c "col = []

# Open the file
with open('cipherseeds') as words:
     for word in words:
       col.append(word)

# Print the resulting array
for cols in col:
  print(cols)" >> linenums

cat linenums 

set word $(sed -n 'p' wordlist.txt )
  # ['word1', 'word2', 'word3', 'word4']"
#words = 
#for $word in $words:
#= $(head -n 1 cipherseeds | grep [0-9])
