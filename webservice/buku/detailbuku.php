<?php

header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
header('Access-Control-Allow-Method: GET');
header('Access-Control-Allow-Headers: Origin, Content-Type, Accept');

include_once '../models/buku.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if ($buku->validate_params($_GET['idbuku'])) {
        $buku->idbuku = $_GET['idbuku'];
    } else {
        echo json_encode(array('success' => 0, 'message' => 'ID buku is required!'));
        die();
    }

    if ($buku->detail_buku() == null) {
        echo json_encode(array('success' => 0, 'message' => 'Buku is empty!'));
    } else {
        echo json_encode(array('success' => 1, 'Buku' => $buku->detail_buku()));
    }
} else {
    die(header('HTTP/1.1 405 Request Method Not Allowed'));
}
