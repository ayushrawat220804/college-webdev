<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Temperature Converter</title>
</head>
<body>
    <form class="temperature-form" id="temperature-form" method="get">
        <label for="temperature-input">Temperature (Â°C):</label>
        <input id="temperature-input" name="celsius" type="number" step="any" required>
        <button type="submit">Convert</button>
    </form>
    <?php
    if (isset($_GET['celsius'])) {
        $celsius = (float) $_GET['celsius'];
        $fahrenheit = ($celsius * 9 / 5) + 32;
        echo "<p>{$celsius}Â°C equals {$fahrenheit}Â°F</p>";
    }
    ?>
</body>
</html>
