<?php
session_start();

if (isset($_GET['reset'])) {
    $_SESSION['page_hits'] = 0;
}

$hits = ($_SESSION['page_hits'] ?? 0) + 1;
$_SESSION['page_hits'] = $hits;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Counter with Reset</title>
</head>
<body>
    <h1>Session Visit Counter</h1>
    <p>This page has been visited <strong><?php echo $hits; ?></strong> time(s) during this session.</p>
    <p>
        <a href="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">Refresh</a> |
        <a href="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>?reset=1">Reset Counter</a>
    </p>
</body>
</html>

