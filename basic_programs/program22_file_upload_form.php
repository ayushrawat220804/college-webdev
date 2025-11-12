<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload File</title>
</head>
<body>
    <?php
    $statusMessage = '';
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['upload_file'])) {
        $file = $_FILES['upload_file'];
        if ($file['error'] === UPLOAD_ERR_OK) {
            $statusMessage = "Uploaded file: " . htmlspecialchars($file['name'], ENT_QUOTES);
        } else {
            $statusMessage = "Upload failed with error code: {$file['error']}";
        }
    }
    ?>
    <form class="upload-form" id="upload-form" method="post" enctype="multipart/form-data">
        <label for="file-input">Choose a file:</label>
        <input id="file-input" name="upload_file" type="file">
        <button type="submit">Upload</button>
    </form>
    <p><?php echo htmlspecialchars($statusMessage, ENT_QUOTES); ?></p>
</body>
</html>
