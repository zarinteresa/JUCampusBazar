<?php session_start();
include("connection.php");
  if (!isset($_SESSION['user'])) {
  header("location:vendor.php");
}
 ?>

<?php
if(isset($_POST['submit'])){
$uname= $_SESSION['user'];
$juid= $_POST['JU_ID'];
$pname= $_POST['Pname'];
$pprice= $_POST['Pprice'];
$pdesc= $_POST['Pdescription'];
$pimage = $_FILES["Pimage"]["name"];
$folder = "images/" . $pimage;
$tempname = $_FILES["Pimage"]["tmp_name"];

						

    if($juid!="" && $pname != "" && $pprice != "" && $pdesc != "")
    {
    $query="INSERT INTO products values (DEFAULT,'$juid','$pname','$pprice','$pdesc','" . $folder . "','$uname')";
    $data= mysqli_query($conn, $query);
    move_uploaded_file($tempname, $folder);
    header('Location: '."products.php");
    }	

    else{
    echo "All Fields Required ";
    }
    }
?>
 <?php 
 $uname= $_SESSION['user'];
 $q = "SELECT product_id,product_title,product_desc,product_image,product_price from products where vendor_name = '$uname'";
 $r = mysqli_query($conn,$q);
 ?>


<?php include_once("./templates/top.php"); ?>
<?php include_once("./templates/navbar.php"); ?>
<div class="container-fluid">
  <div class="row">
    
    <?php include "./templates/sidebar.php"; ?>

      <div class="row">
      	<div class="col-10">
      		<h2>Product List</h2>
      	</div>
      	<div class="col-2">
      		<a href="#" data-toggle="modal" data-target="#add_product_modal" class="btn btn-primary btn-sm">Add Product</a>
      	</div>
        
      </div>
      
      <div class="table-responsive">
      <table class="table table-striped table-sm">
          <thead>
            <tr>
              <td>#</td>
              <td>Name</td>
              <td>Description</td>
              <td>Image</td>
              <td>Price</td>
              <td>Action</td>
            </tr>
            <tr>
              <?php 

                while($row = mysqli_fetch_assoc($r)){
                    

              ?>
              <td> <?php echo $row['product_id']; ?></td>
              <td> <?php echo $row['product_title']; ?></td>
              <td> <?php echo $row['product_desc']; ?></td>
              <td> <?php echo $row['product_image']; ?></td>
              <td> <?php echo $row['product_price']; ?></td>
              <td><button class="btn btn-danger"> <a href="deleteproduct.php? deleteid=<?php echo $row['product_id']; ?>" class="text-light">Delete</a></button></td>
              </tr>
              <?php 
                }
                ?>
            
          </thead>
          <tbody id="product_list">
          </tbody>
        </table>
        
      </div>
    </main>
  </div>
</div>



<!-- Add Product Modal start -->
<div class="modal fade" id="add_product_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="" method="post" enctype="multipart/form-data">
          <div class="key">
							<i class="fa fa-user" aria-hidden="true"></i>
							<input  type="text" value="JU_ID" name="JU_ID" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'JU_ID';}" required="true">
							<div class="clearfix"></div>
						</div>
						<div class="key">
							<i class="fa fa-user" aria-hidden="true"></i>
							<input  type="text" value="Product Name" name="Pname" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Pname';}" required="true">
							<div class="clearfix"></div>
						</div>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" value="Product Description" name="Pdescription" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Pdescription';}" required="true">
							<div class="clearfix"></div>
						</div>
						<div class="key">
							<i class="fa fa-phone" aria-hidden="true"></i>
							<input  type="text" value="Price" name="Pprice" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Pprice';}" required="true">
							<div class="clearfix"></div>
						</div>
					
						<div class="key">
							<i class="fa fa-lock" aria-hidden="true"></i>
							<input  type="file" value="Image" name="Pimage" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Pimage';}" required="true">
							<div class="clearfix"></div>
						</div>
						<input type="submit" name="submit" value="Submit">
					</form>
          
      </div>
    </div>
  </div>
</div>
<!-- Add Product Modal end -->



<?php include_once("./templates/footer.php"); ?>



<script type="text/javascript" src="./js/products.js"></script>