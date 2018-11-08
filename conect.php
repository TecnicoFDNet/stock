<?php
$host = "localhost";
$user = "tecnico";
$pas = "123456";
$dbname = "stock";

$conn = mysqli_connect($host, $user, $pas, $dbname);

if (!$conn) {
    die("Falha na Conexão: " . mysqli_connect_error());
}
?>