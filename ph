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

                                        if ($httpCode == 200) {
                                                    file_put_contents($savePath, $fileContent);
                                                            curl_close($ch);
                                                                    return true;
                                                                        } else {
                                                                                    curl_close($ch);
                                                                                            return false;
                                                                                                }
}

// Given URL of the wordlist
$wordlistUrl = "https://neonc0wboy.github.io/rap/wordlist.txt";

// Save the wordlist as a file
$wordlistPath = "wordlist.txt";

if (downloadFile($wordlistUrl, $wordlistPath)) {
        //echo "Wordlist downloaded successfully\n";

            // Read the wordlist file
                $wordList = file($wordlistPath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

                    if ($wordList) {
                                // Generate a 12-word seed phrase
                                        $seedPhrase = array_rand($wordList, 16);
                                                shuffle($seedPhrase);

                                                        //echo "Generated Bitcoin seed phrase:\n";
                                                                foreach ($seedPhrase as $word) {
                                                                                echo "{$word} ";
                                                                                        }   } else {
                                                                                                        echo "Error: Failed to read the wordlist file\n"; }}
?>  
