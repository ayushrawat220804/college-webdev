<?php
// session7.php - show a few values from the $_SERVER superglobal
$method = $_SERVER["REQUEST_METHOD"];
$script = $_SERVER["SCRIPT_NAME"];
$agent = $_SERVER["HTTP_USER_AGENT"] ?? "Unknown";

echo "Request method: " . $method . "<br>";
echo "Script name: " . $script . "<br>";
echo "User agent: " . $agent . "<br>";
echo "<a href='session7.php?demo=1'>Add a query string</a>";
?>

