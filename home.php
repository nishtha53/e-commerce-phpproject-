<?php
include "./admin/connection.php";
session_start();
if (!isset($_SESSION['email'])) {
    $email = "";
    $login = 0;
} else {
    $login = 1;
    $email = $_SESSION['email'];
    $qry = "select * from user where email = '$email'";
    $sql = mysqli_query($conn, $qry);
    $result = mysqli_fetch_assoc($sql);
    $uname = $result['username'];
}
?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>E-commerce Project</title>
</head>
<style>
    .center-btn {
        display: block;
        margin-right: auto;
        margin-left: auto;
        background-color: #E85B72;
        border: #E85B72;
    }

    .center-btn:hover {
        background-color: #E85B72 !important;
    }

    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        transition: 0.3s;
    }
</style>

<body>

    <!---- header started---->
    <nav class="navbar  navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#"><img src="images/logo.jpeg" height="80px" width="150px" /> </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="main_nav">

            <ul class="navbar-nav mx-auto">
                <li class="nav-item active"> <a class="nav-link mx-4" href="#">Home </a> </li>
                <li class="nav-item"><a class="nav-link mx-4" href="about.php"> About </a></li>
                <li class="nav-item"><a class="nav-link mx-4" href="contact.php">Contact us</a></li>

            </ul>
            <ul style="list-style: none;">
                <li class="nav-item"><a class="nav-link" href="addtocart.php"><img src="images/add-to-basket.png" width="40px" height="40px"></a></li>
            </ul>
            <?php
            if ($login == 0) {
            ?>
                <a class="btn btn-warning mx-4" href="login.php">Login</a>
                <a class="btn btn-warning mx-4" href="register.php">Register</a>
            <?php
            } else {
            ?>
                <h4>Welcome, <?php echo  $uname;  ?></h4>
                <a class="btn btn-warning mx-4" href="logout.php" onclick="logout()">Logout</a>
            <?php
            }
            ?>
        </div> <!-- navbar-collapse.// -->

        </div>
    </nav>
    <!----- header end --->

    <div class="container py-4">
        <div class="row mt-3">
            <?php
            include 'admin/connection.php';
            $query = "SELECT * from product;";
            $data = mysqli_query($conn, $query);
            $total = mysqli_num_rows($data) > 0;
            if ($total) {
                while ($result = mysqli_fetch_assoc($data)) {
            ?>
                    <div class='col-md-4'>
                        <div class='card m-4' style='width: 22rem; '>
                            <img class='card-img-top' src='./admin/<?php echo $result["image"];  ?>' alt='Card image'>
                            <div class='card-body'>
                                <h5 class='card-title text-center'><?php echo $result["prod_name"];  ?></h5>
                                <p class='card-text text-muted text-center'><?php echo $result["description"];  ?></p>
                                <h5 class='card-text text-center'>₹ <?php echo $result["price"];  ?></h5>
                                <form action="addtocart.php" method="post">
                                    <input type="hidden" name="pid" value="<?php echo $result["prod_no"]; ?>">
                                    <input value="1" class="form-control" style="width:100px;margin-left:100px;" type="number" name="qty" id="qty" min="1" max="10">
                                    <br><input type="submit" name="sbtn" value="Add to cart" class="btn btn-primary center-btn">
                                </form>
                            </div>
                        </div>
                    </div>
            <?php

                }
            } else {
                echo "No records found!";
            }
            ?>
        </div>
    </div>
    <!--- Footer started  ---->
    <footer class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h6>About</h6>
                    <p class="text-justify">Medico shop- Your Health & Fitness Partner is an online portal for healthcare products brought to you by Medicare Products Inc. The company is managed by a team of two young & motivated entrepreneurs with an objective to provide and extend personalized and innovative healthcare services to its customers.</p>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6>Categories</h6>
                    <ul class="footer-links">
                        <li><a href="#">Syrup</a></li>
                        <li><a href="#">Tablet</a></li>
                        <li><a href="#">Ayurveda</a></li>
                        <li><a href="#">Hompyopethik</a></li>
                        <li><a href="#">Emulsions</a></li>
                        <li><a href="#">Inhalers</a></li>
                    </ul>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6>Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="about.php">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="http://scanfcode.com/privacy-policy/">Privacy Policy</a></li>
                        <li><a href="http://scanfcode.com/sitemap/">Sitemap</a></li>
                    </ul>
                </div>
            </div>
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p class="copyright-text">Copyright &copy; 2022 All Rights Reserved by
                        <a href="#">Medico</a>.
                    </p>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <ul class="social-icons">
                        <li><a class="facebook" href="#"><i class="fa-brands fa-facebook"></i></a></li>
                        <li><a class="twitter" href="#"><i class="fa-brands fa-twitter"></i></a></li>
                        <li><a class="linkedin" href="#"><i class="fa-brands fa-linkedin-in"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
        function logout() {
            if (confirm("Are you sure you want to log out!")) {
                location.href = "logout.php"
            } else {
                location.href = "#";
            }
        }
    </script>

</body>

</html>