<?php

$ds = DIRECTORY_SEPARATOR;
$base_dir = realpath(dirname(__FILE__) . $ds . '..') . $ds;

require_once "{$base_dir}includes{$ds}database.php";
require_once "{$base_dir}includes{$ds}bcrypt.php";

class Anggota
{
    private $table = 'anggota';

    public $nim;
    public $nama;
    public $password;
    public $alamat;
    public $kota;
    public $email;
    public $no_telp;

    public function __construct()
    {

    }

    public function validate_params($value)
    {
        return (!empty($value));
    }

    public function login()
    {
        global $database;

        $this->email = trim(htmlspecialchars(strip_tags($this->email)));
        $this->password = trim(htmlspecialchars(strip_tags($this->password)));

        $sql = "SELECT * FROM $this->table WHERE email = '" . $database->escape_value($this->email) . "'";

        $result = $database->query($sql);
        $anggota = $database->fetch_row($result);

        if (empty($anggota)) {
            return "Anggota Tidak Ada";
        } else {
            if (Bcrypt::checkPassword($this->password, $anggota['password'])) {
                unset($anggota['password']);
                return $anggota;
            } else {
                return "Password Tidak Cocok";
            }
        }
    }
}

$anggota = new Anggota();
