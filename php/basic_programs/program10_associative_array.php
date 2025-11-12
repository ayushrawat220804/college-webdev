<?php
$person = [
    "name" => "Aditi",
    "role" => "Developer",
    "location" => "Pune"
];
foreach ($person as $key => $value) {
    echo ucfirst($key) . ": {$value}" . PHP_EOL;
}
