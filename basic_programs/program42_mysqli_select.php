<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$result = mysqli_query($connection, 'SELECT id, name FROM users');
while ($row = mysqli_fetch_assoc($result)) {
    echo $row['id'] . ': ' . $row['name'] . PHP_EOL;
}
mysqli_free_result($result);
mysqli_close($connection);
