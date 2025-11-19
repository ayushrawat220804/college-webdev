<?php
// session10.php - destroy the entire session and cookie
session_start();

session_unset();         // remove all session variables
session_destroy();       // destroy session

setcookie("favorite_color", "", time() - 3600); // delete cookie from session4.php

echo "Session data and cookie removed.<br>";
echo "<a href='session1_form.html'>Start again</a>";
?>

