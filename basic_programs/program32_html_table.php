<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Scores</title>
</head>
<body>
    <?php
    $students = [
        ["name" => "Anita", "score" => 85],
        ["name" => "Bhavesh", "score" => 92],
        ["name" => "Chirag", "score" => 78],
    ];
    ?>
    <table class="score-table" id="score-table" border="1" cellpadding="6">
        <thead>
            <tr>
                <th>Name</th>
                <th>Score</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($students as $student): ?>
                <tr>
                    <td><?php echo htmlspecialchars($student['name'], ENT_QUOTES); ?></td>
                    <td><?php echo (int) $student['score']; ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
