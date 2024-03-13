<?php

// Function to download a file from a URL
function download($url, $destination) {
    $ch = curl_init();

    // Set cURL options
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); // Timeout after 10 seconds
    curl_setopt($ch, CURLOPT_HEADER, 0); // Don't include headers in the result

    // Execute cURL and get the result
    $result = curl_exec($ch);
    $httpStatus = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    // Close cURL
    curl_close($ch);

    // Check for errors
    if (curl_errno($ch) || $httpStatus != 200) {
        echo "Error: Unable to download the file.\n";
        exit;
    }

    // Check if the downloaded file is empty
    if (empty($result)) {
        echo "Error: The downloaded file is empty.\n";
        exit;
    }

    // Write the result to the destination file
    if (file_put_contents($destination, $result) === false) {
        echo "Error: Unable to write the downloaded file to the destination.\n";
        exit;
    }
}

// Function to generate a Bitcoin seed phrase from a wordlist file
function generateSeedPhrase($wordlistFile) {
    // Read the wordlist file
    $words = file($wordlistFile, FILE_IGNORE_NEW_LINES);

    // Check if the wordlist file contains enough words
    if (count($words) < 2048) {
        echo "Error: The wordlist file does not contain enough words.\n";
        exit;
    }

    // Shuffle the word array
    shuffle($words);

    // Generate the seed phrase
    $seedPhrase = [];
    for ($i = 0; $i < 24; $i++) {
        $seedPhrase[] = $words[$i];
    }

    return $seedPhrase;
}

// Download the wordlist file
$wordlistFile = "./wordlist.txt";
download("https://neonc0wboy.github.io/rap/wordlist.txt", $wordlistFile);

// Generate the Bitcoin seed phrase
$seedPhrase = generateSeedPhrase($wordlistFile);

// Print the seed phrase
echo "Bitcoin seed phrase: " . impl
