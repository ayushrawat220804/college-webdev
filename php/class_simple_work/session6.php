<?php
// session6.php - simple counter that increases on every refresh
session_start();

if (!isset($_SESSION["counter"])) {
    $_SESSION["counter"] = 0;   // initialize counter
}

$_SESSION["counter"]++;        // increase counter

echo "This page has been loaded " . $_SESSION["counter"] . " time(s) in this session.<br>";
echo "<a href='session6.php'>Refresh counter</a> | ";
echo "<a href='session3.php'>Clear session</a>";
?>

