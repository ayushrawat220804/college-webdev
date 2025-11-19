<?php
$userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';
$clientIp = $_SERVER['REMOTE_ADDR'] ?? 'Unknown IP';
$serverSoftware = $_SERVER['SERVER_SOFTWARE'] ?? 'Unknown server';
$requestUri = $_SERVER['REQUEST_URI'] ?? '/';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Agent Inspector</title>
</head>
<body>
    <h1>Request Details</h1>
    <ul>
        <li><strong>User agent:</strong> <?php echo htmlspecialchars($userAgent); ?></li>
        <li><strong>Client IP:</strong> <?php echo htmlspecialchars($clientIp); ?></li>
        <li><strong>Request URI:</strong> <?php echo htmlspecialchars($requestUri); ?></li>
        <li><strong>Server software:</strong> <?php echo htmlspecialchars($serverSoftware); ?></li>
    </ul>
    <p>Use this page to inspect what information PHP receives in the <code>$_SERVER</code> superglobal.</p>
</body>
</html>

