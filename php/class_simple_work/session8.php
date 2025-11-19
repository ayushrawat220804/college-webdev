<?php
// session8.php - simple GET form handler
$name = $_GET["name"] ?? "";
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GET Form Example</title>
</head>
<body>
<h1>Enter Your Name (GET)</h1>
<form method="get">
    <input type="text" name="name" placeholder="Type name">
    <button type="submit">Send</button>
</form>
<?php if ($name !== ""): ?>
    <p>Hello, <?php echo $name; ?>!</p>
<?php endif; ?>
</body>
</html>

