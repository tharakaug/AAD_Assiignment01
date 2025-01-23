<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 1/20/2025
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="assets/css/userLogin.css" />
    <title>Sign in & Sign up Form</title>
</head>
<body>
<div class="container">
    <div class="forms-container">
        <div class="signin-signup" >
            <form action="#" method="post" class="sign-in-form">
                <h2 class="title">Sign in</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" name="name" placeholder="Username" />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" />
                </div>
                <input type="submit" value="Login" class="btn solid" />
                <!-- <p class="social-text">Or Sign in with social platforms</p> -->
                <!-- <div class="social-media">
                  <a href="#" class="social-icon">
                    <i class="fab fa-facebook-f"></i>
                  </a>
                  <a href="#" class="social-icon">
                    <i class="fab fa-twitter"></i>
                  </a>
                  <a href="#" class="social-icon">
                    <i class="fab fa-google"></i>
                  </a>
                  <a href="#" class="social-icon">
                    <i class="fab fa-linkedin-in"></i>
                  </a>
                </div> -->
            </form>
            <form action="user-Servlet" method="post" class="sign-up-form">
                <h2 class="title">Sign up</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" name="name" placeholder="Username" />
                </div>
                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Email" />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" />
                </div>

<%--                <a href="userLogin.jsp" class="btn" type="submit" style="align-content: center; text-align: center; text-decoration: none" >Sign up</a>--%>
                <input type="submit" class="btn" value="Sign up">


                <!-- <p class="social-text">Or Sign up with social platforms</p>
                <div class="social-media">
                  <a href="#" class="social-icon">
                    <i class="fab fa-facebook-f"></i>
                  </a>
                  <a href="#" class="social-icon">
                    <i class="fab fa-twitter"></i>
                  </a>
                  <a href="#" class="social-icon">
                    <i class="fab fa-google"></i>
                  </a>
                  <a href="#" class="social-icon">
                    <i class="fab fa-linkedin-in"></i>
                  </a>
                </div> -->
            </form>
        </div>
    </div>

    <div class="panels-container" >
        <div class="panel left-panel" >
            <div class="content">
                <h3>New here ?</h3>
                <p>AuraGlow - Glow your way naturally
                    Made using clean, non-toxic ingredients, our products are designed for everyone.

                </p>
                <button class="btn transparent" id="sign-up-btn">
                    Sign up
                </button>
            </div>
            <img src="./assets/images/b2.jpg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
            <div class="content">
                <h3>One of us ?</h3>
                <p>AuraGlow - Glow your way naturally
                    Made using clean, non-toxic ingredients, our products are designed for everyone.

                </p>
                <button class="btn transparent" id="sign-in-btn">
                    Sign in
                </button>
            </div>
            <img src="./assets/images/b1.jpg" class="image" alt="" />
        </div>
    </div>
</div>
`
<script src="./assets/js/userlogin.js"></script>
</body>
</html>
