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
