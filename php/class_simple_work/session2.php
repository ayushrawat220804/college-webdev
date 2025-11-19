<?php
// session2.php - show the stored username from session1.php
session_start();

if (isset($_SESSION["user"])) {
    echo "Session stored username: " . $_SESSION["user"] . "<br>";
} else {
    echo "No session found. Go back to session1.php to create one.<br>";
}

echo "<a href='session3.php'>Click to destroy session</a>";
?>

