<?php
$favoriteColor = $_COOKIE['favorite_color'] ?? '';
$message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $favoriteColor = trim($_POST['color'] ?? '');
    if ($favoriteColor === '') {
        $message = 'Please choose a color.';
    } else {
        setcookie('favorite_color', $favoriteColor, time() + 86400, '/');
        $message = 'Color preference saved in a cookie for 1 day.';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cookie Preference Form</title>
</head>
<body>
    <h1>Choose Your Favorite Color</h1>
    <form method="post">
        <label>
            Favorite color:
            <input type="text" name="color" value="<?php echo htmlspecialchars($favoriteColor); ?>" placeholder="e.g. teal">
        </label>
        <button type="submit">Save Preference</button>
    </form>
    <?php if ($message !== ''): ?>
        <p><?php echo htmlspecialchars($message); ?></p>
    <?php endif; ?>
    <?php if ($favoriteColor !== ''): ?>
        <p>Current cookie value: <?php echo htmlspecialchars($favoriteColor); ?></p>
    <?php endif; ?>
</body>
</html>

