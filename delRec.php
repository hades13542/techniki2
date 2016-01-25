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

    try {
    	$query = $db->prepare('DELETE FROM wojewodztwo WHERE id= :id');
    	$query->bindValue(':id',$obj->idToDelete,PDO::PARAM_INT) ;
    	$res =$query->execute();
	echo $res;
    }
    catch (PDOException $e) {
        echo $e->getMessage();
    }
?>
