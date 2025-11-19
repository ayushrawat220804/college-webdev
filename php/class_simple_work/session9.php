<?php
// session9.php - store a favorite movie in session via POST
session_start();

$movie = $_SESSION["movie"] ?? "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $movie = $_POST["movie"] ?? "";
    $_SESSION["movie"] = $movie;
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Store Movie in Session</title>
</head>
<body>
<h1>Favorite Movie</h1>
<form method="post">
    <input type="text" name="movie" placeholder="Movie title">
    <button type="submit">Save</button>
</form>
<?php if ($movie !== ""): ?>
    <p>Movie stored in session: <?php echo $movie; ?></p>
<?php endif; ?>
</body>
</html>

