<?php
$filePath = __DIR__ . '/sample.txt';
$content = "Learning PHP file handling.";
file_put_contents($filePath, $content);
$readContent = file_get_contents($filePath);
echo $readContent;
