<?php
// session1.php - receive form submission and store username in session
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $uname = $_POST['username'];       // get username
    $_SESSION["user"] = $uname;        // store in session

    echo "Session created!<br>";
}

echo "<a href='session2.php'>Click to show session</a>";
?>

