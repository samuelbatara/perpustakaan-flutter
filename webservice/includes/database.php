<?php

define('HOST', 'localhost');
define('USER_NAME', 'root');
define('PASSWORD', '');
define('DB_NAME', 'db_perpustakaan');

class Database
{
    private $connection;

    public function __construct()
    {
        $this->open_db_connection();
    }

    public function open_db_connection()
    {
        $this->connection = mysqli_connect(HOST, USER_NAME, PASSWORD, DB_NAME);

        if (mysqli_connect_error()) {
            die('Connection Error : ' . mysqli_connect_error());
        }
    }

    public function query($sql)
    {
        $result = $this->connection->query($sql);

        if (!$result) {
            die('Query Fails : ' . $sql);
        }

        return $result;
    }

    public function fetch_array($result)
    {
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $result_array[] = $row;
            }

            return $result_array;
        }
    }

    public function fetch_row($result)
    {
        if ($result->num_rows > 0) {
            return $result->fetch_assoc();
        }
    }

    public function escape_value($value)
    {
        return $this->connection->real_escape_string($value);

    }

    public function close_connection()
    {
        $this->connection->close();
    }
}

$database = new Database();
