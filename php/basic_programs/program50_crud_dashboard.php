<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}

$message = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';
    $name = mysqli_real_escape_string($connection, $_POST['name'] ?? '');
    $email = mysqli_real_escape_string($connection, $_POST['email'] ?? '');
    $id = (int) ($_POST['id'] ?? 0);

    if ($action === 'create' && $name && $email) {
        mysqli_query($connection, "INSERT INTO users (name, email) VALUES ('{$name}', '{$email}')");
        $message = 'User created.';
    } elseif ($action === 'update' && $id > 0) {
        mysqli_query($connection, "UPDATE users SET name = '{$name}', email = '{$email}' WHERE id = {$id}");
        $message = 'User updated.';
    } elseif ($action === 'delete' && $id > 0) {
        mysqli_query($connection, "DELETE FROM users WHERE id = {$id}");
        $message = 'User deleted.';
    }
}

$users = mysqli_query($connection, 'SELECT id, name, email FROM users');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple CRUD Dashboard</title>
</head>
<body>
    <h1>User Management</h1>
    <p><?php echo htmlspecialchars($message, ENT_QUOTES); ?></p>

    <section class="create-user-section" id="create-user-section">
        <h2>Create User</h2>
        <form class="create-user-form" method="post">
            <input type="hidden" name="action" value="create">
            <label for="create-name">Name:</label>
            <input id="create-name" name="name" type="text" required>

            <label for="create-email">Email:</label>
            <input id="create-email" name="email" type="email" required>

            <button type="submit">Add User</button>
        </form>
    </section>

    <section class="update-user-section" id="update-user-section">
        <h2>Update User</h2>
        <form class="update-user-form" method="post">
            <input type="hidden" name="action" value="update">

            <label for="update-id">User ID:</label>
            <input id="update-id" name="id" type="number" min="1" required>

            <label for="update-name">Name:</label>
            <input id="update-name" name="name" type="text" required>

            <label for="update-email">Email:</label>
            <input id="update-email" name="email" type="email" required>

            <button type="submit">Update User</button>
        </form>
    </section>

    <section class="delete-user-section" id="delete-user-section">
        <h2>Delete User</h2>
        <form class="delete-user-form" method="post">
            <input type="hidden" name="action" value="delete">

            <label for="delete-id">User ID:</label>
            <input id="delete-id" name="id" type="number" min="1" required>

            <button type="submit">Delete User</button>
        </form>
    </section>

    <section class="list-user-section" id="list-user-section">
        <h2>Existing Users</h2>
        <table class="user-table" id="user-table" border="1" cellpadding="6">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($user = mysqli_fetch_assoc($users)): ?>
                    <tr>
                        <td><?php echo (int) $user['id']; ?></td>
                        <td><?php echo htmlspecialchars($user['name'], ENT_QUOTES); ?></td>
                        <td><?php echo htmlspecialchars($user['email'], ENT_QUOTES); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </section>
</body>
</html>
<?php
mysqli_free_result($users);
mysqli_close($connection);
?>
