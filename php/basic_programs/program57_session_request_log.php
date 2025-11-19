<?php
session_start();

if (!isset($_SESSION['request_log'])) {
    $_SESSION['request_log'] = [];
}

$entry = date('H:i:s') . ' - ' . ($_SERVER['REQUEST_METHOD'] ?? 'CLI');
$entry .= ' from IP ' . ($_SERVER['REMOTE_ADDR'] ?? 'unknown');

array_unshift($_SESSION['request_log'], $entry);
$_SESSION['request_log'] = array_slice($_SESSION['request_log'], 0, 5);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Request Log</title>
</head>
<body>
    <h1>Last 5 Requests This Session</h1>
    <ol>
        <?php foreach ($_SESSION['request_log'] as $log): ?>
            <li><?php echo htmlspecialchars($log); ?></li>
        <?php endforeach; ?>
    </ol>
    <p>Refresh to add a new entry. Only five recent requests are stored.</p>
</body>
</html>

