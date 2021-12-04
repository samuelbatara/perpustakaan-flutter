<?php

header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Origin, Content-Type, Accept');

include_once '../models/anggota.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($anggota->validate_params($_POST['email'])) {
        $anggota->email = $_POST['email'];
    } else {
        echo json_encode(array('success' => 0, 'message' => 'Email is required!'));
        die();
    }

    if ($anggota->validate_params($_POST['password'])) {
        $anggota->password = $_POST['password'];
    } else {
        echo json_encode(array('success' => 0, 'message' => 'Password is required!'));
        die();
    }

    $a = $anggota->login();
    if (gettype($a) === 'array') {
        http_response_code(200);
        echo json_encode(array('success' => 1, 'message' => 'Login Successful!', 'Anggota' => $a));
    } else {
        http_response_code(402);
        echo json_encode(array('success' => 0, 'message' => $a));
    }
} else {
    die(header('HTTP/1.1 405 Request Method Not Allowed'));
}
