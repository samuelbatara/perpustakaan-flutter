<?php

header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
header('Access-Control-Allow-Method: GET');
header('Access-Control-Allow-Headers: Origin, Content-Type, Accept');

include_once '../models/kategori.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    echo json_encode(array('success' => 1, 'Kategori' => $kategori->list_kategori()));
} else {
    die(header('HTTP/1.1 405 Request Method Not Allowed'));
}
