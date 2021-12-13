<?php

$ds = DIRECTORY_SEPARATOR;
$base_dir = realpath(dirname(__FILE__) . $ds . '..') . $ds;

require_once "{$base_dir}includes{$ds}database.php";

class Kategori
{
    private $table = 'kategori';

    public $idkategori;
    public $nama;

    public function __construct()
    {

    }

    public function validate_params($value)
    {
        return (!empty($value));
    }

    public function list_kategori()
    {
        global $database;

        $sql = "SELECT * FROM $this->table";
        $result = $database->query($sql);

        return $database->fetch_array($result);
    }
}

$kategori = new Kategori();
