<?php
try {
    $pdo = new PDO('mysql:host=localhost;dbname=sample_db', 'root', 'password');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $statement = $pdo->prepare('INSERT INTO users (name, email) VALUES (:name, :email)');
    $statement->execute([
        ':name' => 'PDO User',
        ':email' => 'pdo.user@example.com',
    ]);
    echo "Inserted using PDO prepared statement.";
} catch (PDOException $error) {
    echo "Database error: " . $error->getMessage();
}
