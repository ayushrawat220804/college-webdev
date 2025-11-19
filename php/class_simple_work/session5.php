<?php
// session5.php - display the cookie set by session4.php
$color = $_COOKIE["favorite_color"] ?? "";
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show Cookie</title>
</head>
<body>
<h1>Show Favorite Color Cookie</h1>
<?php if ($color !== ""): ?>
    <p>Your favorite color stored in cookie is: <?php echo $color; ?></p>
<?php else: ?>
    <p>No cookie found. Visit session4.php first.</p>
<?php endif; ?>
</body>
</html>

