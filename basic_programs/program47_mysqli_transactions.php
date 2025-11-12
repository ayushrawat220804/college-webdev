<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
mysqli_begin_transaction($connection);
try {
    mysqli_query($connection, "UPDATE accounts SET balance = balance - 100 WHERE id = 1");
    mysqli_query($connection, "UPDATE accounts SET balance = balance + 100 WHERE id = 2");
    mysqli_commit($connection);
    echo "Transaction completed.";
} catch (Exception $exception) {
    mysqli_rollback($connection);
    echo "Transaction failed: " . $exception->getMessage();
}
mysqli_close($connection);
