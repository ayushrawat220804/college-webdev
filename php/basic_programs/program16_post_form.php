<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Favorite Color (POST)</title>
</head>
<body>
    <form class="color-form" id="color-form" method="post">
        <label for="color-input">Favorite Color:</label>
        <input id="color-input" name="favorite_color" type="text">
        <button type="submit">Submit</button>
    </form>
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $color = htmlspecialchars($_POST['favorite_color'] ?? '', ENT_QUOTES);
        if ($color === '') {
            echo "<p>Please enter a color.</p>";
        } else {
            echo "<p>Your favorite color is {$color}.</p>";
        }
    }
    ?>
</body>
</html>
