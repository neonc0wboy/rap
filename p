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

    return $result;
}

// Function to generate a Bitcoin seed phrase from a wordlist file
function generateSeedPhrase($wordlist) {
    // Check if the wordlist is an array
    if (!is_array($wordlist)) {
        echo "Error: The wordlist is not an array.\n";
        exit;
    }

    // Check if the wordlist contains enough words
    if (count($wordlist) < 2048) {
        echo "Error: The wordlist does not contain enough words.\n";
        exit;
    }

    // Shuffle the word array
    shuffle($wordlist);

    // Generate the seed phrase
    $seedPhrase = [];
    for ($i = 0; $i < 24; $i++) {
        $seedPhrase[] = $wordlist[$i];
    }

    return $seedPhrase;
}

// Download the wordlist file
$wordlistFile = "./wordlist.txt";
$wordlist = download("https://neonc0wboy.github.io/rap/wordlist.txt", $wordlistFile);

// Generate the Bitcoin seed phrase
$seedPhrase = generateSeedPhrase(explode("\n", $wordlist));

// Print the seed phrase
echo "Bitcoin seed phrase: " . implode(' ', $seedPhrase) . "\n";

