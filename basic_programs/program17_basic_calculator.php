<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basic Calculator</title>
</head>
<body>
    <form class="calculator-form" id="calculator-form" method="post">
        <label for="first-number">First Number:</label>
        <input id="first-number" name="first_number" type="number" step="any" required>

        <label for="second-number">Second Number:</label>
        <input id="second-number" name="second_number" type="number" step="any" required>

        <label for="operation-select">Operation:</label>
        <select id="operation-select" name="operation">
            <option value="add">Add</option>
            <option value="subtract">Subtract</option>
            <option value="multiply">Multiply</option>
            <option value="divide">Divide</option>
        </select>
        <button type="submit">Calculate</button>
    </form>
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $first = (float) ($_POST['first_number'] ?? 0);
        $second = (float) ($_POST['second_number'] ?? 0);
        $operation = $_POST['operation'] ?? 'add';
        $result = null;

        switch ($operation) {
            case 'add':
                $result = $first + $second;
                break;
            case 'subtract':
                $result = $first - $second;
                break;
            case 'multiply':
                $result = $first * $second;
                break;
            case 'divide':
                $result = $second !== 0.0 ? $first / $second : 'Cannot divide by zero';
                break;
        }

        echo "<p>Result: {$result}</p>";
    }
    ?>
</body>
</html>
