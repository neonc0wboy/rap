<?php

// Set the path to the wordlist files
$wordlist_path = './wordlist.txt';
$wordlist_path1 = './wrus.txt';

// Set the number of words in the seed phrase
$num_words = 16;

// Function to generate a seed phrase
function generate_seed_phrase($wordlist, $num_words) {
    // Check that the number of words in the seed phrase is valid
    if ($num_words < 1 || $num_words > count($wordlist)) {
        throw new Exception("Invalid number of words in seed phrase");
    }

    // Generate the seed phrase by selecting random words from the wordlist
    $seed_phrase = array();
    for ($i = 0; $i < $num_words; $i++) {
        $seed_phrase[] = $wordlist[mt_rand(0, count($wordlist) - 1)];
    }

    // Join the words in the seed phrase into a single string
    $seed_phrase = implode(' ', $seed_phrase);

    // Return the seed phrase
    return $seed_phrase;
}

// Read the wordlist files into arrays
$wordlist = [];
if (!file_exists($wordlist_path)) {
    throw new Exception("Wordlist file not found: {$wordlist_path}");
}
$wordlist = file($wordlist_path, FILE_IGNORE_NEW_LINES);

$wordlist1 = [];
if (!file_exists($wordlist_path1)) {
    throw new Exception("Wordlist file not found: {$wordlist_path1}");
}
$wordlist1 = file($wordlist_path1, FILE_IGNORE_
