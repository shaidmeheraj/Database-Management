<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register & Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container" id="signup" style="display:none;">
    <h1 class="form-title">Register</h1>
    <form method="post" action="">
       <div class="input-group">
        <i class="fas fa-user"></i>
        <input type="text" name="fName" id="fName" placeholder="First Name" required>
         <lable for="fname">First Name</lable>
       </div> 
       <div class="input-group">
        <i class="fas fa-user"></i>
        <input type="text" name="lName" id="lName" placeholder="Last Name" required>
        <lable for="lName">Last Name</lable>
       </div>
       <div class="input-group">
        <i class="fas fa-envelope"></i>
        <input type="email" name="email" id="email" placeholder="Email" required>
        <lable for="email">Email</lable>
       </div>
       <div class="input-group">
        <i class="fas fa-lock"></i>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <lable for="password">Password</lable>
       </div>
       <input type="Submit" class="btn" value="Sign Up" name="SignUp">
    </form>
     <p class="or">
        ------------or-------------
     </p>
     <div class="icons">
        <i class="fab fa-google"></i>
        <i class="fab fa-facebook"></i>
     </div>
     <div class="links">
        <p>Already Have Account ?</p>
        <button id="signInButton">Sign In</button>
     </div>
</div>


<div class="container" id="signIn">
    <h1 class="form-title">Sign In</h1>
    <form method="post" action="">
       <div class="input-group">
        <i class="fas fa-envelope"></i>
        <input type="email" name="email" id="email" placeholder="Email" required>
        <lable for="email">Email</lable>
       </div>
       <div class="input-group">
        <i class="fas fa-lock"></i>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <lable for="password">Password</lable>
       </div>
       <p class="Recover">
        <a href="#">Recover Password</a>
       </p>
       <input type="Submit" class="btn" value="Sign In" name="SignIn">
    </form>
     <p class="or">
        ------------or-------------
     </p>
     <div class="icons">
        <i class="fab fa-google"></i>
        <i class="fab fa-facebook"></i>
     </div>
     <div class="links">
        <p>Don't have account yet?</p>
        <button id="signUpButton">Sign Up</button>
     </div>
</div>

<script src="script.js"></script>
</body>
</html>