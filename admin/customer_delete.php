<?php
	include 'includes/session.php';

		$id = $_POST['id'];
		$sql = "DELETE FROM temp_customer WHERE Uni_ID = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Customer denied!';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}

	header('location: customers.php');
	
?>