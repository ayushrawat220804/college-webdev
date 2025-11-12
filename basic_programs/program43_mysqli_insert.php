<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$name = 'New User';
$email = 'new.user@example.com';
$sql = "INSERT INTO users (name, email) VALUES ('" . mysqli_real_escape_string($connection, $name) . "', '" . mysqli_real_escape_string($connection, $email) . "')";
if (mysqli_query($connection, $sql)) {
    echo "Record inserted successfully.";
} else {
    echo "Insert failed: " . mysqli_error($connection);
}
mysqli_close($connection);
