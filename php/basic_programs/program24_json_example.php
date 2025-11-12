<?php
$data = [
    "framework" => "Laravel",
    "language" => "PHP",
    "stars" => 5
];
$json = json_encode($data);
echo $json . PHP_EOL;
$decoded = json_decode($json, true);
print_r($decoded);
