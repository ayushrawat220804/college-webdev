<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$statement = mysqli_prepare($connection, 'INSERT INTO users (name, email) VALUES (?, ?)');
mysqli_stmt_bind_param($statement, 'ss', $name, $email);
$name = 'Prepared User';
$email = 'prepared@example.com';
mysqli_stmt_execute($statement);
mysqli_stmt_close($statement);
mysqli_close($connection);
echo "Prepared statement executed.";
