<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Form</title>
</head>
<body>
    <?php
    $status = '';
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $name = trim($_POST['full_name'] ?? '');
        $email = trim($_POST['email_address'] ?? '');
        $message = trim($_POST['message_text'] ?? '');
        if ($name === '' || $email === '' || $message === '') {
            $status = 'All fields are required.';
        } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $status = 'Please provide a valid email address.';
        } else {
            $status = 'Thank you for contacting us.';
        }
    }
    ?>
    <form class="contact-form" id="contact-form" method="post">
        <label for="contact-name">Name:</label>
        <input id="contact-name" name="full_name" type="text" required>

        <label for="contact-email">Email:</label>
        <input id="contact-email" name="email_address" type="email" required>

        <label for="contact-message">Message:</label>
        <textarea id="contact-message" name="message_text" rows="4" required></textarea>

        <button type="submit">Send</button>
    </form>
    <p><?php echo htmlspecialchars($status, ENT_QUOTES); ?></p>
</body>
</html>
