<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple Login</title>
</head>
<body>
    <?php
    $message = '';
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $username = $_POST['username'] ?? '';
        $password = $_POST['password'] ?? '';
        if ($username === 'admin' && $password === 'secret') {
            $message = 'Login successful!';
        } else {
            $message = 'Invalid credentials.';
        }
    }
    ?>
    <form class="login-form" id="login-form" method="post">
        <label for="login-username">Username:</label>
        <input id="login-username" name="username" type="text" required>

        <label for="login-password">Password:</label>
        <input id="login-password" name="password" type="password" required>

        <button type="submit">Login</button>
    </form>
    <p><?php echo htmlspecialchars($message, ENT_QUOTES); ?></p>
</body>
</html>
