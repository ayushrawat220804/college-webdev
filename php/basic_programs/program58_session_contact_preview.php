<?php
session_start();

$preview = $_SESSION['contact_preview'] ?? ['name' => '', 'email' => '', 'message' => ''];
$saved = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $preview['name'] = trim($_POST['name'] ?? '');
    $preview['email'] = trim($_POST['email'] ?? '');
    $preview['message'] = trim($_POST['message'] ?? '');
    $_SESSION['contact_preview'] = $preview;
    $saved = true;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Contact Preview</title>
</head>
<body>
    <h1>Contact Form Preview</h1>
    <?php if ($saved): ?>
        <p>Data saved in session. Refresh or leave the page and return to see persistence.</p>
    <?php endif; ?>
    <form method="post">
        <label>
            Name:
            <input type="text" name="name" value="<?php echo htmlspecialchars($preview['name']); ?>">
        </label><br>
        <label>
            Email:
            <input type="email" name="email" value="<?php echo htmlspecialchars($preview['email']); ?>">
        </label><br>
        <label>
            Message:
            <textarea name="message" rows="4" cols="40"><?php echo htmlspecialchars($preview['message']); ?></textarea>
        </label><br>
        <button type="submit">Save Preview</button>
    </form>
    <h2>Live Preview (from Session)</h2>
    <p><strong>Name:</strong> <?php echo htmlspecialchars($preview['name']); ?></p>
    <p><strong>Email:</strong> <?php echo htmlspecialchars($preview['email']); ?></p>
    <p><strong>Message:</strong> <?php echo nl2br(htmlspecialchars($preview['message'])); ?></p>
</body>
</html>

