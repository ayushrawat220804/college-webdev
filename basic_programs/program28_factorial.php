<?php
function factorial(int $n): int
{
    return $n <= 1 ? 1 : $n * factorial($n - 1);
}
echo "Factorial of 5 is " . factorial(5);
