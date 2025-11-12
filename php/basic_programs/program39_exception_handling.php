<?php
try {
    $value = 10 / 0;
    echo $value;
} catch (DivisionByZeroError $error) {
    echo "Cannot divide by zero.";
}
