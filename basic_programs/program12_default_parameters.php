<?php
function calculateArea(float $radius, float $pi = 3.14159): float
{
    return $pi * $radius * $radius;
}
echo "Area: " . calculateArea(5);
