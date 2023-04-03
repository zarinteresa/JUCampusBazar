<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Customer Request List
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Customers</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <?php
        if(isset($_SESSION['error'])){
          echo "
            <div class='alert alert-danger alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-warning'></i> Error!</h4>
              ".$_SESSION['error']."
            </div>
          ";
          unset($_SESSION['error']);
        }
        if(isset($_SESSION['success'])){
          echo "
            <div class='alert alert-success alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-check'></i> Success!</h4>
              ".$_SESSION['success']."
            </div>
          ";
          unset($_SESSION['success']);
        }
      ?>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-body">
              <table id="example1" class="table table-bordered">
                <thead>
                  <th>Customer ID</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Actions</th>
                </thead>
                <tbody>
                  <?php
                    $sql = "SELECT * FROM temp_customer";
                    $query = $conn->query($sql);
                    while($row = $query->fetch_assoc()){
            
                      echo "
                        <tr>
                          <td>".$row['Uni_ID']."</td>
                          <td>".$row['username']."</td>
                          <td>".$row['email']."</td>
                          <td style='display:flex;justify-content:space-evenly'>
                            <button class='btn btn-success btn-sm edit btn-flat' data-id='".$row['Uni_ID']."'><i class='fa fa-edit'></i> Approve</button>
                            <button class='btn btn-danger btn-sm delete btn-flat' data-id='".$row['Uni_ID']."'><i class='fa fa-trash'></i> Deny</button>
                          </td>
                        </tr>
                      ";
                    }
                  ?>
                </tbody>
              </table>
              
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12">
        <h3>
        Approved Customer List
      </h3>
          <div class="box">
            <div class="box-body">
           
              <table id="example1" class="table table-bordered">
                <thead>
                  <th>Customer ID</th>
                  <th>Name</th>
                  <th>Email</th>
                </thead>
                <tbody>
                  <?php
                    $sql = "SELECT * FROM customers";
                    $query = $conn->query($sql);
                    while($row = $query->fetch_assoc()){
            
                      echo "
                        <tr>
                          <td>".$row['Uni_ID']."</td>
                          <td>".$row['username']."</td>
                          <td>".$row['email']."</td>
                        </tr>
                      ";
                    }
                  ?>
                </tbody>
              </table>
              
            </div>
          </div>
        </div>
      </div>
    </section>   
  </div>

  
    
  <?php include 'includes/footer.php'; ?>
  <?php include 'includes/customer_modal.php'; ?>
</div>
<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
  $(document).on('click', '.edit', function(e){
    e.preventDefault();
    $('#edit').modal('show');
    var id = $(this).data('id');
    console.log(id);
    $.ajax({
                    url: "customer_edit.php",
                    method: "POST",
                    data: {
                        id: id,
                    },
                    cache: false,
                    success: function(data) {
                        console.log(data);


                    }
                });
  });

  $(document).on('click', '.delete', function(e){
    e.preventDefault();
    $('#delete').modal('show');
    var id = $(this).data('id');
    console.log(id);
    $.ajax({
                    url: "customer_delete.php",
                    method: "POST",
                    data: {
                        id: id,
                    },
                    cache: false,
                    success: function(data) {
                        console.log(data);


                    }
                });
  });



});


</script>
</body>
</html>
