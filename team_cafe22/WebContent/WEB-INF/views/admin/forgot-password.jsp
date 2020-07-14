<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>RC-POS - Request a New Password</title>
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="resources/css/styles.css" rel="stylesheet">
  </head>
  <body class="bg-dark">
      <div class="container">
        <div class="card card-login mx-auto mt-5">
          <div class="card-header bg-primary text-white">Reset Password</div>
          <div class="card-body">
            <div class="text-center mb-4">
              <h4>Forgot your password?</h4>
              <p>Enter your email address and we will send you instructions on how to reset your password.</p>
            </div>
            <form>
              <div class="form-group">
                <div class="form-label-group">
                  <input type="email" id="inputEmail" class="form-control" placeholder="Enter email address" required="required" autofocus="autofocus">
                  <label for="inputEmail">Enter email address</label>
                </div>
              </div>
              <a class="btn btn-primary btn-block" href="login.do">Reset Password</a>
            </form>
            <hr>
            <div class="text-center">
              <br>
              <a class="d-block small" href="login.do">Go to Login Page</a>
              <br>
              OR
              <a class="d-block small mt-3" href="https://github.com/vruqa/rc-pos">Contact developers</a>
            </div>
          </div>
        </div>
      </div>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/jquery.easing.min.js"></script>
  </body>
</html>