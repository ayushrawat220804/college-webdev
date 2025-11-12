<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['visitor_name'] = $_POST['visitor_name'] ?? '';
}

$name = $_SESSION['visitor_name'] ?? null;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Greeting</title>
</head>
<body>
    <form class="session-form" id="session-form" method="post">
        <label for="session-name">Your Name:</label>
        <input id="session-name" name="visitor_name" type="text" required>
        <button type="submit">Save Name</button>
    </form>
    <?php if ($name): ?>
        <p>Welcome back, <?php echo htmlspecialchars($name, ENT_QUOTES); ?>!</p>
    <?php endif; ?>
</body>
</html>
