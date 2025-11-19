<?php
// session3.php - destroy the session value created earlier
session_start();

if (isset($_SESSION["user"])) {
    unset($_SESSION["user"]);      // remove session key
    echo "Session value cleared.<br>";
} else {
    echo "No session value to clear.<br>";
}

echo "<a href='session1_form.html'>Back to session form</a>";
?>

