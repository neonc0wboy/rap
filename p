<?php

// Function to download a from a URL
function download($url, $destination) {
        $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
                        $result = curl_exec($ch);
                            curl_close($ch);

                                if (file_put_contents($destination, $result) === false) {
                                            echo "Error: Unable to download the file.\n";
                                                    exit;
                                                        }
}

// Function to generate a Bitcoin seed phrase from a wordlist file
function generateSeedPhrase($wordlistFile) {
        $words = file($wordlistFile, FILE_IGNORE_NEW_LINES);

            if (count($words) < 2048) {
                        echo "Error: The wordlist file does not contain enough words.\n";
                                exit;
                                    }

                                        $seedPhrase = [];
                                            for ($i = 0; $i < 24; $i++) {
                                                        $index = rand(0, count($words) - 1);
                                                                $seedPhrase[] = $words[$index];
                                                                    }

                                                                        return $seedPhrase;
}

// Download the wordlist file
$wordlistFile = "./wordlist.txt";
download("https://neonc0wboy.github.io/rap/wordlist.txt", $wordlistFile);

// Generate the Bitcoin seed phrase
$seedPhrase = generateSeedPhrase($wordlistFile);

// Print the seed phrase
echo "Bitcoin seed phrase: " . implode(" ", $seedPhrase) . "\n";

?>
