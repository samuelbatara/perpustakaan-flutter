<?php

header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
header('Access-Control-Allow-Method: GET');
header('Access-Control-Allow-Headers: Origin, Content-Type, Accept');

include_once '../models/buku.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    echo json_encode(array('success' => 1, 'Buku' => $buku->list_buku()));
} else {
    die(header('HTTP/1.1 405 Request Method Not Allowed'));
}
