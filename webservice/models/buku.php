<?php

$ds = DIRECTORY_SEPARATOR;
$base_dir = realpath(dirname(__FILE__) . $ds . '..') . $ds;

require_once "{$base_dir}includes{$ds}database.php";

class Buku
{

    private $table = 'buku';

    public $idbuku;
    public $isbn;
    public $judul;
    public $idkategori;
    public $pengarang;
    public $penerbit;
    public $kota_terbit;
    public $editor;
    public $file_gambar;
    public $created_at;
    public $updated_at;
    public $stok;
    public $stok_tersedia;

    public function __construct()
    {

    }

    public function validate_params($value)
    {
        return (!empty($value));
    }

    public function list_buku()
    {
        global $database;

        $sql = "SELECT * FROM $this->table";
        $result = $database->query($sql);

        return $database->fetch_array($result);
    }

    public function detail_buku()
    {
        global $database;

        $this->idbuku = trim(htmlspecialchars(strip_tags($this->idbuku)));

        $sql = "SELECT idbuku, isbn, judul, idkategori, pengarang, penerbit, kota_terbit, editor, file_gambar, stok, stok_tersedia FROM $this->table WHERE idbuku = '" . $database->escape_value($this->idbuku) . "'";

        $result = $database->query($sql);

        return $database->fetch_array($result);
    }
}

$buku = new Buku();
