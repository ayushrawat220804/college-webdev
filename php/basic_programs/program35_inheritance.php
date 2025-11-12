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
