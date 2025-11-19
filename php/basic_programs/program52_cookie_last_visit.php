<?php
$lastVisit = $_COOKIE['last_visit'] ?? 'This is your first recorded visit.';
$currentVisit = date('l, F j, Y g:i:s A');
setcookie('last_visit', $currentVisit, time() + 604800, '/');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cookie Last Visit Tracker</title>
</head>
<body>
    <h1>Welcome Back</h1>
    <p>Last visit (from cookie): <?php echo htmlspecialchars($lastVisit); ?></p>
    <p>This visit recorded at: <?php echo htmlspecialchars($currentVisit); ?></p>
    <p>Refresh to watch the timestamp update. The cookie is kept for 7 days.</p>
</body>
</html>

