<?php

interface GlobalInterface
{
    const URl_API = 'http://38.242.236.227:999/';

    public function getAll();

    public function getById($id);

    public function delete($id);

    public function create($data);

    public function update($id, $data);
}