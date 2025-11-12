<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$userId = 1;
$newEmail = 'updated.email@example.com';
$sql = "UPDATE users SET email = '" . mysqli_real_escape_string($connection, $newEmail) . "' WHERE id = {$userId}";
if (mysqli_query($connection, $sql)) {
    echo "Record updated successfully.";
} else {
    echo "Update failed: " . mysqli_error($connection);
}
mysqli_close($connection);
