<?php

class Controller
{
    public function getParams()
    {
        return $_POST;
    }

    public function getBaseUrl()
    {
        return $_SERVER['HTTP_ORIGIN'];
    }
}