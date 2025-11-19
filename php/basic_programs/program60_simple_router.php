<?php
$method = $_SERVER['REQUEST_METHOD'];
$response = '';

if ($method === 'POST') {
    $color = trim($_POST['color'] ?? 'blue');
    $response = 'You selected the color: ' . htmlspecialchars($color);
} elseif ($method === 'GET' && isset($_GET['ping'])) {
    $response = 'PONG at ' . date('H:i:s');
} else {
    $response = 'Use the form or add ?ping=1 to the URL.';
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple PHP Router</title>
</head>
<body>
    <h1>Simple Router Demo</h1>
    <p>Request method detected: <strong><?php echo htmlspecialchars($method); ?></strong></p>
    <p><?php echo $response; ?></p>
    <form method="post">
        <label>
            Favorite color:
            <input type="text" name="color" value="blue">
        </label>
        <button type="submit">Send POST</button>
    </form>
    <p><a href="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>?ping=1">Send GET ping</a></p>
</body>
</html>

