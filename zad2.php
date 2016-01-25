<?php
$client = new SoapClient(null, array(
    'location' => "http://pascal.fis.agh.edu.pl/~3hujdus/techniki2/zad2PDO.php",
    'uri' => "http://pascal.fis.agh.edu.pl/Demo",
    'soap_version' => SOAP_1_2,
    'trace' => 1
));
$return = $client->__soapCall("openDatabaseAndGetData", array(""));
 /* echo("\nReturning value of __soapCall() call: ".$return);
  echo("\nDumping request headers:\n" 
    .$client->__getLastRequestHeaders());
  echo("\nDumping request:\n".$client->__getLastRequest());
  echo("\nDumping response headers:\n"
    .$client->__getLastResponseHeaders());
  echo("\nDumping response:\n".$client->__getLastResponse());*/
$result = html_entity_decode($return);
$xml    = new DOMDocument();
$xml->loadXML($result);
$xsl = new DOMDocument();
$xsl->load("zad2.xsl");
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);
print $proc->transformToXML($xml);
?>
