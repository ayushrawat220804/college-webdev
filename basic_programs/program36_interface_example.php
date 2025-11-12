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
