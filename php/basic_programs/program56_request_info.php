<?php
$method = $_SERVER['REQUEST_METHOD'];
$script = $_SERVER['SCRIPT_NAME'];
$queryString = $_SERVER['QUERY_STRING'] ?? '';
$serverName = $_SERVER['SERVER_NAME'] ?? 'localhost';
$formValue = $method === 'POST' ? ($_POST['sample'] ?? '') : ($_GET['sample'] ?? '');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Request Information</title>
</head>
<body>
    <h1>Request Inspector</h1>
    <ul>
        <li>Method: <?php echo htmlspecialchars($method); ?></li>
        <li>Script: <?php echo htmlspecialchars($script); ?></li>
        <li>Server: <?php echo htmlspecialchars($serverName); ?></li>
        <li>Query string: <?php echo htmlspecialchars($queryString); ?></li>
    </ul>

    <h2>Send Data</h2>
    <form method="get">
        <label>GET sample: <input type="text" name="sample" value=""></label>
        <button type="submit">Send GET</button>
    </form>
    <form method="post">
        <label>POST sample: <input type="text" name="sample" value=""></label>
        <button type="submit">Send POST</button>
    </form>

    <?php if ($formValue !== ''): ?>
        <p>Last submitted value: <?php echo htmlspecialchars($formValue); ?></p>
    <?php endif; ?>
</body>
</html>

