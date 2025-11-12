<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$userId = 2;
$sql = "DELETE FROM users WHERE id = {$userId}";
if (mysqli_query($connection, $sql)) {
    echo "Record deleted successfully.";
} else {
    echo "Delete failed: " . mysqli_error($connection);
}
mysqli_close($connection);
