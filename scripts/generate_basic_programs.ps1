$baseDir = Join-Path (Split-Path $PSScriptRoot -Parent) "basic_programs"
if (-not (Test-Path $baseDir)) {
    New-Item -ItemType Directory -Path $baseDir | Out-Null
}

$programs = @{
    "program01_hello_world.php" = @'
<?php
echo "Hello, World!";
'@
    "program02_variables.php" = @'
<?php
$greeting = "Hello";
$name = "Developer";
echo $greeting . ", " . $name . "!";
'@
    "program03_arithmetic.php" = @'
<?php
$a = 12;
$b = 8;
echo "Sum: " . ($a + $b) . PHP_EOL;
echo "Difference: " . ($a - $b) . PHP_EOL;
echo "Product: " . ($a * $b) . PHP_EOL;
echo "Quotient: " . ($a / $b) . PHP_EOL;
'@
    "program04_string_functions.php" = @'
<?php
$message = "basic php programming";
echo strtoupper($message) . PHP_EOL;
echo ucfirst($message) . PHP_EOL;
echo strrev($message) . PHP_EOL;
'@
    "program05_if_else.php" = @'
<?php
$score = 78;
if ($score >= 90) {
    echo "Grade: A";
} elseif ($score >= 80) {
    echo "Grade: B";
} elseif ($score >= 70) {
    echo "Grade: C";
} else {
    echo "Grade: D";
}
'@
    "program06_switch_case.php" = @'
<?php
$dayNumber = 3;
switch ($dayNumber) {
    case 1:
        echo "Monday";
        break;
    case 2:
        echo "Tuesday";
        break;
    case 3:
        echo "Wednesday";
        break;
    default:
        echo "Another day";
}
'@
    "program07_for_loop.php" = @'
<?php
for ($i = 1; $i <= 5; $i++) {
    echo "Iteration {$i}" . PHP_EOL;
}
'@
    "program08_while_loop.php" = @'
<?php
$counter = 1;
while ($counter <= 5) {
    echo "Count: {$counter}" . PHP_EOL;
    $counter++;
}
'@
    "program09_array_iteration.php" = @'
<?php
$colors = ["Red", "Green", "Blue"];
foreach ($colors as $color) {
    echo $color . PHP_EOL;
}
'@
    "program10_associative_array.php" = @'
<?php
$person = [
    "name" => "Aditi",
    "role" => "Developer",
    "location" => "Pune"
];
foreach ($person as $key => $value) {
    echo ucfirst($key) . ": {$value}" . PHP_EOL;
}
'@
    "program11_functions.php" = @'
<?php
function greet(string $name): string
{
    return "Hello, {$name}!";
}
echo greet("Rohit");
'@
    "program12_default_parameters.php" = @'
<?php
function calculateArea(float $radius, float $pi = 3.14159): float
{
    return $pi * $radius * $radius;
}
echo "Area: " . calculateArea(5);
'@
    "program13_html_hello.php" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello Page</title>
</head>
<body>
    <h1><?php echo "Welcome to PHP!"; ?></h1>
</body>
</html>
'@
    "program14_html_list.php" = @'
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
'@
    "program15_get_form.php" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Greeting Form (GET)</title>
</head>
<body>
    <form class="greeting-form" id="greeting-form" method="get">
        <label for="name-input">Enter your name:</label>
        <input id="name-input" name="username" type="text">
        <button type="submit">Greet Me</button>
    </form>
    <?php
    if (isset($_GET['username']) && $_GET['username'] !== '') {
        $name = htmlspecialchars($_GET['username'], ENT_QUOTES);
        echo "<p>Hello, {$name}!</p>";
    }
    ?>
</body>
</html>
'@
    "program16_post_form.php" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Favorite Color (POST)</title>
</head>
<body>
    <form class="color-form" id="color-form" method="post">
        <label for="color-input">Favorite Color:</label>
        <input id="color-input" name="favorite_color" type="text">
        <button type="submit">Submit</button>
    </form>
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $color = htmlspecialchars($_POST['favorite_color'] ?? '', ENT_QUOTES);
        if ($color === '') {
            echo "<p>Please enter a color.</p>";
        } else {
            echo "<p>Your favorite color is {$color}.</p>";
        }
    }
    ?>
</body>
</html>
'@
    "program17_basic_calculator.php" = @'
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
'@
    "program18_temperature_converter.php" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Temperature Converter</title>
</head>
<body>
    <form class="temperature-form" id="temperature-form" method="get">
        <label for="temperature-input">Temperature (°C):</label>
        <input id="temperature-input" name="celsius" type="number" step="any" required>
        <button type="submit">Convert</button>
    </form>
    <?php
    if (isset($_GET['celsius'])) {
        $celsius = (float) $_GET['celsius'];
        $fahrenheit = ($celsius * 9 / 5) + 32;
        echo "<p>{$celsius}°C equals {$fahrenheit}°F</p>";
    }
    ?>
</body>
</html>
'@
    "program19_login_form.php" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple Login</title>
</head>
<body>
    <?php
    $message = '';
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $username = $_POST['username'] ?? '';
        $password = $_POST['password'] ?? '';
        if ($username === 'admin' && $password === 'secret') {
            $message = 'Login successful!';
        } else {
            $message = 'Invalid credentials.';
        }
    }
    ?>
    <form class="login-form" id="login-form" method="post">
        <label for="login-username">Username:</label>
        <input id="login-username" name="username" type="text" required>

        <label for="login-password">Password:</label>
        <input id="login-password" name="password" type="password" required>

        <button type="submit">Login</button>
    </form>
    <p><?php echo htmlspecialchars($message, ENT_QUOTES); ?></p>
</body>
</html>
'@
    "program20_session_greeting.php" = @'
<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['visitor_name'] = $_POST['visitor_name'] ?? '';
}

$name = $_SESSION['visitor_name'] ?? null;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Greeting</title>
</head>
<body>
    <form class="session-form" id="session-form" method="post">
        <label for="session-name">Your Name:</label>
        <input id="session-name" name="visitor_name" type="text" required>
        <button type="submit">Save Name</button>
    </form>
    <?php if ($name): ?>
        <p>Welcome back, <?php echo htmlspecialchars($name, ENT_QUOTES); ?>!</p>
    <?php endif; ?>
</body>
</html>
'@
    "program21_cookie_counter.php" = @'
<?php
$visits = 1;
if (isset($_COOKIE['visit_count'])) {
    $visits = (int) $_COOKIE['visit_count'] + 1;
}
setcookie('visit_count', (string) $visits, time() + 3600);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cookie Counter</title>
</head>
<body>
    <p>You have visited this page <?php echo $visits; ?> time(s) in the last hour.</p>
</body>
</html>
'@
    "program22_file_upload_form.php" = @'
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
'@
    "program23_file_write_read.php" = @'
<?php
$filePath = __DIR__ . '/sample.txt';
$content = "Learning PHP file handling.";
file_put_contents($filePath, $content);
$readContent = file_get_contents($filePath);
echo $readContent;
'@
    "program24_json_example.php" = @'
<?php
$data = [
    "framework" => "Laravel",
    "language" => "PHP",
    "stars" => 5
];
$json = json_encode($data);
echo $json . PHP_EOL;
$decoded = json_decode($json, true);
print_r($decoded);
'@
    "program25_date_time.php" = @'
<?php
date_default_timezone_set('Asia/Kolkata');
echo "Current date and time: " . date('Y-m-d H:i:s');
'@
    "program26_random_quote.php" = @'
<?php
$quotes = [
    "Code is like humor. When you have to explain it, it’s bad.",
    "Fix the cause, not the symptom.",
    "Optimism is an occupational hazard of programming."
];
$randomQuote = $quotes[array_rand($quotes)];
echo $randomQuote;
'@
    "program27_multiplication_table.php" = @'
<?php
$number = 7;
for ($i = 1; $i <= 10; $i++) {
    echo "{$number} x {$i} = " . ($number * $i) . PHP_EOL;
}
'@
    "program28_factorial.php" = @'
<?php
function factorial(int $n): int
{
    return $n <= 1 ? 1 : $n * factorial($n - 1);
}
echo "Factorial of 5 is " . factorial(5);
'@
    "program29_fibonacci.php" = @'
<?php
function fibonacci(int $terms): array
{
    $sequence = [0, 1];
    for ($i = 2; $i < $terms; $i++) {
        $sequence[] = $sequence[$i - 1] + $sequence[$i - 2];
    }
    return $sequence;
}
print_r(fibonacci(10));
'@
    "program30_prime_check.php" = @'
<?php
function isPrime(int $number): bool
{
    if ($number <= 1) {
        return false;
    }
    for ($i = 2; $i <= sqrt($number); $i++) {
        if ($number % $i === 0) {
            return false;
        }
    }
    return true;
}
echo isPrime(17) ? "Prime" : "Not Prime";
'@
    "program31_contact_form.php" = @'
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
'@
    "program32_html_table.php" = @'
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
'@
    "program33_csv_reader.php" = @'
<?php
$csvData = "name,age\nAsha,29\nVikram,31";
$rows = array_map('str_getcsv', explode("\n", $csvData));
foreach ($rows as $row) {
    echo implode(" - ", $row) . PHP_EOL;
}
'@
    "program34_simple_class.php" = @'
<?php
class Car
{
    public string $brand;

    public function __construct(string $brand)
    {
        $this->brand = $brand;
    }

    public function honk(): string
    {
        return "{$this->brand} says beep!";
    }
}
$car = new Car("Tata");
echo $car->honk();
'@
    "program35_inheritance.php" = @'
<?php
class Shape
{
    public function area(): float
    {
        return 0.0;
    }
}

class Circle extends Shape
{
    public function __construct(private float $radius)
    {
    }

    public function area(): float
    {
        return 3.14159 * $this->radius * $this->radius;
    }
}
$circle = new Circle(3.5);
echo "Area: " . $circle->area();
'@
    "program36_interface_example.php" = @'
<?php
interface Logger
{
    public function log(string $message): void;
}

class FileLogger implements Logger
{
    public function log(string $message): void
    {
        echo "Log entry: {$message}";
    }
}
$logger = new FileLogger();
$logger->log("Interface example");
'@
    "program37_trait_example.php" = @'
<?php
trait MessageTrait
{
    public function message(string $text): void
    {
        echo $text;
    }
}

class Messenger
{
    use MessageTrait;
}
$messenger = new Messenger();
$messenger->message("Traits make code reusable.");
'@
    "program38_namespace_example.php" = @'
<?php
namespace Utilities;

function helper(): string
{
    return "Namespaced helper function.";
}

echo helper();
'@
    "program39_exception_handling.php" = @'
<?php
try {
    $value = 10 / 0;
    echo $value;
} catch (DivisionByZeroError $error) {
    echo "Cannot divide by zero.";
}
'@
    "program40_custom_exception.php" = @'
<?php
class InvalidAgeException extends Exception
{
}

function validateAge(int $age): void
{
    if ($age < 18) {
        throw new InvalidAgeException("Age must be 18 or older.");
    }
}

try {
    validateAge(16);
} catch (InvalidAgeException $exception) {
    echo $exception->getMessage();
}
'@
    "program41_mysqli_connection.php" = @'
<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
echo "Connected successfully.";
mysqli_close($connection);
'@
    "program42_mysqli_select.php" = @'
<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$result = mysqli_query($connection, 'SELECT id, name FROM users');
while ($row = mysqli_fetch_assoc($result)) {
    echo $row['id'] . ': ' . $row['name'] . PHP_EOL;
}
mysqli_free_result($result);
mysqli_close($connection);
'@
    "program43_mysqli_insert.php" = @'
<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$name = 'New User';
$email = 'new.user@example.com';
$sql = "INSERT INTO users (name, email) VALUES ('" . mysqli_real_escape_string($connection, $name) . "', '" . mysqli_real_escape_string($connection, $email) . "')";
if (mysqli_query($connection, $sql)) {
    echo "Record inserted successfully.";
} else {
    echo "Insert failed: " . mysqli_error($connection);
}
mysqli_close($connection);
'@
    "program44_mysqli_update.php" = @'
<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$userId = 1;
$newEmail = 'updated.email@example.com';
$sql = "UPDATE users SET email = '" . mysqli_real_escape_string($connection, $newEmail) . "' WHERE id = {$userId}";
if (mysqli_query($connection, $sql)) {
    echo "Record updated successfully.";
} else {
    echo "Update failed: " . mysqli_error($connection);
}
mysqli_close($connection);
'@
    "program45_mysqli_delete.php" = @'
<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$userId = 2;
$sql = "DELETE FROM users WHERE id = {$userId}";
if (mysqli_query($connection, $sql)) {
    echo "Record deleted successfully.";
} else {
    echo "Delete failed: " . mysqli_error($connection);
}
mysqli_close($connection);
'@
    "program46_mysqli_prepared.php" = @'
<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
$statement = mysqli_prepare($connection, 'INSERT INTO users (name, email) VALUES (?, ?)');
mysqli_stmt_bind_param($statement, 'ss', $name, $email);
$name = 'Prepared User';
$email = 'prepared@example.com';
mysqli_stmt_execute($statement);
mysqli_stmt_close($statement);
mysqli_close($connection);
echo "Prepared statement executed.";
'@
    "program47_mysqli_transactions.php" = @'
<?php
$connection = mysqli_connect('localhost', 'root', 'password', 'sample_db');
if (!$connection) {
    die('Connection failed: ' . mysqli_connect_error());
}
mysqli_begin_transaction($connection);
try {
    mysqli_query($connection, "UPDATE accounts SET balance = balance - 100 WHERE id = 1");
    mysqli_query($connection, "UPDATE accounts SET balance = balance + 100 WHERE id = 2");
    mysqli_commit($connection);
    echo "Transaction completed.";
} catch (Exception $exception) {
    mysqli_rollback($connection);
    echo "Transaction failed: " . $exception->getMessage();
}
mysqli_close($connection);
'@
    "program48_pdo_connection.php" = @'
<?php
try {
    $pdo = new PDO('mysql:host=localhost;dbname=sample_db', 'root', 'password');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "PDO connection successful.";
} catch (PDOException $error) {
    echo "Connection failed: " . $error->getMessage();
}
'@
    "program49_pdo_prepared_insert.php" = @'
<?php
try {
    $pdo = new PDO('mysql:host=localhost;dbname=sample_db', 'root', 'password');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $statement = $pdo->prepare('INSERT INTO users (name, email) VALUES (:name, :email)');
    $statement->execute([
        ':name' => 'PDO User',
        ':email' => 'pdo.user@example.com',
    ]);
    echo "Inserted using PDO prepared statement.";
} catch (PDOException $error) {
    echo "Database error: " . $error->getMessage();
}
'@
    "program50_crud_dashboard.php" = @'
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
'@
}

foreach ($key in ($programs.Keys | Sort-Object)) {
    $path = Join-Path $baseDir $key
    Set-Content -Path $path -Value $programs[$key] -Encoding UTF8
}

Write-Host ("Created {0} programs in {1}" -f $programs.Count, $baseDir)

