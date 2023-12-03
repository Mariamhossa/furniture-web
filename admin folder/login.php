<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Furniture Admin | Login/Register</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>
  <?php
  session_start();
  
  if(isset($_SESSION['username'])){
    session_destroy(); 
    
  }
  ?>

  <body class="login">
  <?php  
  require("database.php");
  $db=new DB();
  $db->get_connection();
  ?>
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>
      <?php
        if(isset($_POST['login'])){
          $error=[];
          $uname=$_POST['uname'];
          $password=$_POST['password'];
          $hash=md5($password);
          $data=$db->select("*","users","username='$uname'");
          $user=$data->fetch(pdo::FETCH_ASSOC);
          if($user){
            if($user['password']==$hash){
              session_start();
              $_SESSION['username']=$uname;
              header("location:../index.php");

             
         
            }else{
              $error['passworderr']="Enter the correct password";
            }
          }else{
            $error['unameerr']="The username doesn't exist";
          }

        }
      ?>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form method="POST" action="<?php $_SERVER['PHP_SELF']?>">
              <h1>Login Form</h1>
              <div>
                <input type="text" name="uname" class="form-control" placeholder="Username"  />
                <span style="color:red;"><?php if(isset($error['unameerr'])){echo $error['unameerr'];} ?></span>
              </div>
              <div>
                <input type="text" name="password" class="form-control" placeholder="Password" />
                <span style="color:red;"><?php if(isset($error['passworderr'])){echo $error['passworderr'];} ?></span>
              </div>
              <div>
                <input type="submit" name="login" value="login"> 
                <a class="reset_pass" href="#">Lost your password?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-graduation-cap"></i></i> Furniture Admin</h1>
                  <p>©2016 All Rights Reserved. Furniture Admin is a Bootstrap 4 template. Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>
<?php 

 if(isset($_POST['submit'])){
  $error=[];
  if(isset($_POST['fname'] ) && empty($_POST['fname'])){
    $error['errf']="You should enter your fullname";
  }
  else{
    $fname=$_POST['fname'];}

  if(isset($_POST['uname']) && empty($_POST['uname'])){
    $error['erru']="You should enter your username";
  }else{
    $uname=$_POST['uname'];
    
  }
  
  $email=$_POST['email'];
  $password=$_POST['password'];
  $hash=md5($password);
  $active="yes";
  $date=date('d/m/Y',strtotime('now'));

  $upper = preg_match('@[A-Z]@', $password);
  $lower = preg_match('@[a-z]@', $password);
  $number = preg_match('@[0-9]@', $password);
  $specialChar = preg_match('@[^\w]@', $password);

  if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $error['emailerr'] = "Invalid email format";}
    elseif(!$upper || !$lower || !$number || !$specialChar|| strlen($password) <6) {
        $error['passerr']="Password should be at least 8 characters and contains at least one uppercase, lowercase and specialcharacter";}
    if(count($error)<=0){
         $db->insert("users","fullname, username, email, password, active, date","'$fname','$uname','$email','$hash','$active', '$date'");
         
         session_start();  
    $_SESSION['username']=$uname;
         header("location:../index.php");
    }


 }
?>
        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form method="POST" action="<?php $_SERVER['PHP_SELF']?>">
              <h1>Create Account</h1>
              <div>
                <input type="text" class="form-control" placeholder="Fullname" name="fname"/>
                <span style="color:red;"><?php if(isset($error['errf'])){echo $error['errf'];} ?></span>
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Username" name="uname"/>
                <span style="color:red;"><?php if(isset($error['erru'])){echo $error['erru'];} ?></span>
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Email" name="email"/>
                <span style="color:red;"><?php if(isset($error['emailerr'])){echo $error['emailerr'];} ?></span>
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Password" name="password"/>
                <span style="color:red;"><?php if(isset($error['passerr'])){echo $error['passerr'];} ?></span>
              </div>
              <div>
               
                <input type="submit" name="submit">
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Log in </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-graduation-cap"></i></i> Furniture Admin</h1>
                  <p>©2016 All Rights Reserved. Furniture Admin is a Bootstrap 4 template. Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
