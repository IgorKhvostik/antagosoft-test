<?php
try {
    $DBH = new PDO("mysql:host=127.0.0.1;dbname=antagosoft", 'root', '');
}catch(Exception $e){
    die($e->getMessage());
}