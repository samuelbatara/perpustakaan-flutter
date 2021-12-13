<?php

header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
header('Access-Control-Allow-Method: GET');
header('Access-Control-Allow-Headers: Origin, Content-Type, Accept');

include_once '../models/buku.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if ($buku->validate_params($_GET['idkategori'])) {
        $buku->idkategori = $_GET['idkategori'];
    } else {
        echo json_encode(array('success' => 0, 'message' => 'ID Kategori is required!'));
        die();
    }

    if ($buku->get_buku_per_kategori() == null) {
        echo json_encode(array('success' => 0, 'message' => 'Kategori is empty!'));
    } else {
        echo json_encode(array('success' => 1, 'kategori' => $buku->get_buku_per_kategori()));
    }
} else {
    die(header('HTTP/1.1 405 Request Method Not Allowed'));
}
