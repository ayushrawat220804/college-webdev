<?php
$visits = 1;
if (isset($_COOKIE['visit_count'])) {
    $visits = (int) $_COOKIE['visit_count'] + 1;
}
setcookie('visit_count', (string) $visits, time() + 3600);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cookie Counter</title>
</head>
<body>
    <p>You have visited this page <?php echo $visits; ?> time(s) in the last hour.</p>
</body>
</html>
