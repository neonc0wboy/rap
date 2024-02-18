<?php

// Set the path to the wordlist file
$wordlist_path = '/data/data/com.termux/files/home/bkup0412/projects/rap/rap/wordlist.txt';
$wordlist_path1 = '/data/data/com.termux/files/home/bkup0412/projects/rap/rap/wrus.txt';
// Set the number of words in the seed phrase
$num_words = 16;

// Read the wordlist file into an array
$wordlist = file($wordlist_path, FILE_IGNORE_NEW_LINES);
$wordlist1 = file($wordlist_path1, FILE_IGNORE_NEW_LINES);         
// Generate the seed phrase by selecting random words from the wordlist
$seed_phrase = array();
for ($i = 0; $i < $num_words; $i++) {
        $seed_phrase[] = $wordlist[mt_rand(0, count($wordlist) - 1)];
}

// Join the words in the seed phrase into a single string
$seed_phrase = implode(' ', $seed_phrase);

// Output the seed phrase
echo "{$seed_phrase}\n";
$seed_phrase = array();
for ($i = 0; $i < $num_words; $i++) {
             $seed_phrase[] = $wordlist1[mt_rand(0, count($wordlist) - 1     )];                                                                }
             $seed_phrase = implode(' ', $seed_phrase);
             echo "{$seed_phrase}\n";
?>
