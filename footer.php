<?php 
session_start();

include("connection.php");
error_reporting(0);

$cust= $_SESSION['customer'];
?>

<div class="footer">
			<div class="footer-bottom">
				<h2 ><a href="index.php">CampusBazar<span>A reliable place to buy and sell pre-owned goods</span></a></h2>
				<div class=" address">
					<div class="col-md-4 fo-grid1">
							<p><i class="fa fa-home" aria-hidden="true"></i><a href="https://juniv.edu/" target="blank">Jahangirnagar University </a> </p>
					</div>
					<div class="col-md-4 fo-grid1">
							<p><i class="fa fa-phone" aria-hidden="true"></i> 01662233445 </p>	
					</div>
					<div class="col-md-4 fo-grid1">
						<p><a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i> juniv@gmail.com </a></p>
					</div>
					<div class="clearfix"></div>
					
					</div>
			</div>
		<div class="copy-right">
			<p> &copy; 2023 CampusBazar. All Rights Reserved  </a></p>
	</div>
</div>