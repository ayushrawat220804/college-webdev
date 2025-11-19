<?php
session_start();

$savedName = $_SESSION['session_name'] ?? '';
$notice = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $submittedName = trim($_POST['name'] ?? '');
    if ($submittedName === '') {
        $notice = 'Enter a name to store in the session.';
    } else {
        $_SESSION['session_name'] = $submittedName;
        $savedName = $submittedName;
        $notice = 'Session updated successfully.';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Name Form</title>
</head>
<body>
    <h1>Store a Name in Session</h1>
    <form method="post">
        <label>
            Name:
            <input type="text" name="name" value="<?php echo htmlspecialchars($savedName); ?>" placeholder="e.g. Ayush">
        </label>
        <button type="submit">Save to Session</button>
    </form>
    <?php if ($notice !== ''): ?>
        <p><?php echo htmlspecialchars($notice); ?></p>
    <?php endif; ?>
    <?php if ($savedName !== ''): ?>
        <p>Session value: <?php echo htmlspecialchars($savedName); ?></p>
    <?php endif; ?>
</body>
</html>

