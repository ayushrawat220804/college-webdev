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
