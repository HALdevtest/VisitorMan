<?php
header("Access-Control-Allow-Origin: http://localhost:52330/Test/test.html");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Allow-Headers: X-Requested-With");


$rawData = $_POST['imgBase64'];
$filteredData = explode(',', $rawData);
$unencoded = base64_decode($filteredData[1]);
$randomName = rand(0, 99999);;
//Create the image 
$fp = fopen($randomName.'.png', 'w');
fwrite($fp, $unencoded);
fclose($fp);
?>