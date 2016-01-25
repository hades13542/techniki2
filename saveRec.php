<?php 

    $data = $_POST['data'] ;
    $obj  = json_decode($data) ;

$db=null;
$conn_string = 'sqlite:zad2.db';
    try {
        $db = new PDO($conn_string);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (PDOException $e) {
        echo 'Połączenie nie mogło zostać utworzone: ' . $e->getMessage();
    }

    $query = $db->prepare('INSERT INTO wojewodztwo(name, town, value) VALUES (:wojewodztwo, :miasto, :ludnosc)');
    $query->bindValue(':wojewodztwo',$obj->wojewodztwo,PDO::PARAM_STR) ;
    $query->bindValue(':miasto',$obj->miasto,PDO::PARAM_STR) ;
    $query->bindValue(':ludnosc',$obj->ludnosc,PDO::PARAM_INT) ;

    $query->execute();


?>
