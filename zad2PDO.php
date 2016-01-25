<?php
#
function openDatabaseAndGetData()
{
    $conn_string = 'sqlite:zad2.db';
    try {
        $db = new PDO($conn_string);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (PDOException $e) {
        echo 'Połączenie nie mogło zostać utworzone: ' . $e->getMessage();
    }
    $query = $db->prepare('SELECT id, name, town, value FROM wojewodztwo ORDER BY name');
    $query->execute();
    $row;
    $xml = "<?xml version=\"1.0\" ?><root>";
    $xml .= "<data1>";
    while ($row = $query->fetch(PDO::FETCH_NUM)) {
        $xml .= "<region>";
        $xml .= "<id>" . $row[0] . "</id>";
        $xml .= "<name>" . $row[1] . "</name>";
        $xml .= "<town>" . $row[2] . "</town>";
        $xml .= "<value>" . $row[3] . "</value>";
        $xml .= "</region>";
    }
    $xml .= "</data1>";
    $query = $db->prepare('SELECT id, name ,sum(value) from wojewodztwo GROUP BY name');
    $query->execute();
    $xml .= "<data2>";
    while($row = $query->fetch(PDO::FETCH_NUM)) {
        $xml .= "<region2>";
        $xml .= "<id>" . $row[0] . "</id>";
        $xml .= "<name>" . $row[1] . "</name>";
        $xml .= "<value>" . $row[2] . "</value>";
        $xml .= "</region2>";
    }
    $xml .= "</data2>";
    $xml .= "</root>";
    return $xml;
}
$server = new SoapServer(null, array(
    'uri' => "http://pascal.fis.agh.edu.pl/Demo",
    'soap_version' => SOAP_1_2
));
$server->addFunction("openDatabaseAndGetData");
$server->handle();
?>

