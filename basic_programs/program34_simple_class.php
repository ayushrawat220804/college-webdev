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
