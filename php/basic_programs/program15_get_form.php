<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Greeting Form (GET)</title>
</head>
<body>
    <form class="greeting-form" id="greeting-form" method="get">
        <label for="name-input">Enter your name:</label>
        <input id="name-input" name="username" type="text">
        <button type="submit">Greet Me</button>
    </form>
    <?php
    if (isset($_GET['username']) && $_GET['username'] !== '') {
        $name = htmlspecialchars($_GET['username'], ENT_QUOTES);
        echo "<p>Hello, {$name}!</p>";
    }
    ?>
</body>
</html>
