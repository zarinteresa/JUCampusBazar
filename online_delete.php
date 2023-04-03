<?php  session_start(); 
include("connection.php");

if(isset($_GET['delid'])){
    $id1=$_GET['delid'];

    $query= "DELETE FROM onlinepayment where cus_id=$id1";
    $result=mysqli_query($conn,$query);
    if($result){
        header('location:order.php');
        
    }
    else{
        die(mysqli_error($conn));
}

}
?>