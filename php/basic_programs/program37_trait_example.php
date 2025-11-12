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
