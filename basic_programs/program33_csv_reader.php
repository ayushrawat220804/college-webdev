<?php
$csvData = "name,age\nAsha,29\nVikram,31";
$rows = array_map('str_getcsv', explode("\n", $csvData));
foreach ($rows as $row) {
    echo implode(" - ", $row) . PHP_EOL;
}
