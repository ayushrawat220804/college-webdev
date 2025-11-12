<?php
try {
    $pdo = new PDO('mysql:host=localhost;dbname=sample_db', 'root', 'password');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "PDO connection successful.";
} catch (PDOException $error) {
    echo "Connection failed: " . $error->getMessage();
}
