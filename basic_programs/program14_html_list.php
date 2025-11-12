<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dynamic List</title>
</head>
<body>
    <h2>Top Programming Languages</h2>
    <ul class="language-list">
        <?php
        $languages = ["PHP", "Python", "JavaScript", "Go"];
        foreach ($languages as $language) {
            echo "<li>" . htmlspecialchars($language, ENT_QUOTES) . "</li>";
        }
        ?>
    </ul>
</body>
</html>
