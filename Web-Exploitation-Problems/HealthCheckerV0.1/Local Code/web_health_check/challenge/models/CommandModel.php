<?php
class CommandModel
{
    public function __construct($host)
    {
        $this->command = "curl -sL $host 2>&1";
    }

    public function exec()
    {
        exec($this->command, $output);
        return is_array($output) ? implode("\n", $output) : $output;
    }
}