<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $flash = trim($_POST['flash'] ?? '');
    if ($flash !== '') {
        $_SESSION['flash_message'] = $flash;
    }
    header('Location: ' . $_SERVER['PHP_SELF']);
    exit;
}

$message = $_SESSION['flash_message'] ?? '';
unset($_SESSION['flash_message']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Flash Message</title>
</head>
<body>
    <h1>Flash Message Demo</h1>
    <?php if ($message !== ''): ?>
        <p><strong>Flash:</strong> <?php echo htmlspecialchars($message); ?></p>
    <?php endif; ?>
    <form method="post">
        <label>
            Message:
            <input type="text" name="flash" placeholder="Type something memorable">
        </label>
        <button type="submit">Send and Redirect</button>
    </form>
    <p>After submitting, the page redirects and the message appears once.</p>
</body>
</html>

