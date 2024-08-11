<?php
//if (isset($_POST['submit'])) {
   
   try{
    $to = 'p@gmail.com'; 
    $subject = 'Hello from XAMPP!';
    $message = 'This is a test';
    $headers = "From: stevedarel107@gmail.com\r\n";
    if (mail($to,$subject,$message,$headers)) {
       echo "SUCCESS";
    } else {
       echo "ERROR";
    }
   }catch(exection $e){
      echo "erreur".$e->getMessage();
   }
//}
//http://jhsoftware.dk/trial.ashx?&s=WHP8SMV7ZLHV69A5JN8TMBVSW&t=09668FF202668FEF12