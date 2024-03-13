<?php

// Set the path to the wordlist files
$wordlist_path = './wordlist.txt';
$wordlist_path1 = './wrus.txt';

// Set the number of words in the seed phrase
$num_words = 16;

// Read the wordlist files into arrays
$wordlist = file($wordlist_path, FILE_IGNORE_NEW_LINES);
$wordlist1 = file($wordlist_path1, FILE_IGNORE_NEW_LINES);

// Generate the seed phrase by selecting random words from the wordlists
$seed_phrase = array();
for ($i = 0; $i < $num_words; $i++) {
    $seed_phrase[] = $wordlist[mt_rand(0, count($wordlist) - 1)];
}

// Join the words in the seed phrase into a single string
$seed_phrase = implode(' ', $seed_phrase);

// Output the seed phrase
echo "Seed Phrase 1: {$seed_phrase}\n";

// Reset the seed phrase array
$seed_phrase = array();

// Generate the second seed phrase
for ($i = 0; $i < $num_words; $i++) {
    $seed_phrase[] = $wordlist1[mt_rand(0, count($wordlist1) - 1)];
}

// Join the words in the seed phrase into a single string
$seed_phrase = implode(' ', $seed_phrase);

// Output the second seed phrase
echo "Seed Phrase 2: {$seed_phrase}\n";

?>
