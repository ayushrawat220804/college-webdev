<?php
// session4.php - set a cookie from a simple form submission
$note = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $color = $_POST["favorite_color"] ?? '';
    setcookie("favorite_color", $color, time() + 3600); // cookie valid for 1 hour
    $note = "Cookie saved!";
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Set Cookie</title>
</head>
<body>
<h1>Set Favorite Color Cookie</h1>
<form method="post">
    <label>Color:
        <input type="text" name="favorite_color">
    </label>
    <button type="submit">Save</button>
</form>
<?php if ($note !== ''): ?>
    <p><?php echo $note; ?></p>
<?php endif; ?>
<p><a href="session5.php">Go to cookie reader</a></p>
</body>
</html>

