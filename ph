<?php

// Function to download a file from a URL
function downloadFile($url, $savePath)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);

    $fileContent = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode == 200) {
        if (file_put_contents($savePath, $fileContent)) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

// Function to remove duplicate words from an array
function removeDuplicates($wordList)
{
    return array_unique($wordList);
}

// Function to format a seed phrase with a space after each word and a newline at the end
function formatSeedPhrase($seedPhrase)
{
    $formattedSeedPhrase = implode(' ', $seedPhrase) . "\n";
    return $formattedSeedPhrase;
}

// Given URL of the wordlist
$wordlistUrl = "https://neonc0wboy.github.io/rap/wordlist.txt";

// Save the wordlist as a file
$wordlistPath = "wordlist.txt";

if (downloadFile($wordlistUrl, $wordlistPath)) {
    // Read the wordlist file
    $wordList = file($wordlistPath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

    if ($wordList) {
        // Generate a 12-word seed phrase
        $seedPhrase = array_rand($wordList, 16); // Request 16 random words to ensure 12 unique words
        $seedPhrase = removeDuplicates($seedPhrase); // Remove duplicate words
        shuffle($seedPhrase); // Shuffle the array to generate the seed phrase

        // Format the seed phrase
        $formattedSeedPhrase = formatSeedPhrase($seedPhrase);

        // Output the generated Bitcoin seed phrase
        echo "Generated Bitcoin seed phrase:\n";
        echo $formattedSeedPhrase;
    } else {
        echo "Error: Failed to read the wordlist file\n";
    }
} else {
    echo "Error: Failed to download the wordlist file\n";
}
