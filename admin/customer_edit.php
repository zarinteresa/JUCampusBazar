<?php
	include 'includes/session.php';

		$id = $_POST['id'];
		$sql = "INSERT INTO customers SELECT id, Uni_ID, username, email, Hall, password, phone from temp_customer WHERE Uni_ID = '$id'";
		if($conn->query($sql)){
			$id = $_POST['id'];
			$sql2 = "DELETE from temp_customer WHERE Uni_ID = '$id'";
			if($conn->query($sql2)){
				$_SESSION['success'] = 'Customer accepted!';
			}
		}
		else{
			$_SESSION['error'] = $conn->error;
		}

		

	header('location: customers.php');
	
?>