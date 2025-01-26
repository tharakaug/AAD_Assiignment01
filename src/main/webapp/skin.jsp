<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.aad_assignment01.ProductDTO" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 1/20/2025
  Time: 9:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AuraGlow - Glow your way naturally</title>

    <!--
      - favicon
    -->
    <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">

    <!--
      - custom css link
    -->
    <link rel="stylesheet" href="assets/css/skin.css">

    <!--
      - google font link
    -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <!--
      - preload images
    -->
    <link rel="preload" as="image" href="./assets/images/logo.png">
    <link rel="preload" as="image" href="./assets/images/hero-banner-1.jpg">
    <link rel="preload" as="image" href="./assets/images/hero-banner-2.jpg">
    <link rel="preload" as="image" href="./assets/images/hero-banner-3.jpg">

</head>

<body id="top">

<!--
  - #HEADER
-->

<header class="header">

    <!-- <div class="alert">
      <div class="container">
        <p class="alert-text">Free Shipping On All U.S. Orders $50+</p>
      </div>
    </div> -->

    <div class="header-top" data-header>
        <div class="container">

            <button class="nav-open-btn" aria-label="open menu" data-nav-toggler>
                <span class="line line-1"></span>
                <span class="line line-2"></span>
                <span class="line line-3"></span>
            </button>

            <div class="input-wrapper">
                <input type="search" name="search" placeholder="Search product" class="search-field">

                <button class="search-submit" aria-label="search">
                    <ion-icon name="search-outline" aria-hidden="true"></ion-icon>
                </button>
            </div>

            <a href="#" class="logo">
                <!-- <img src="./assets/images/logo.png" width="179" height="26" alt="Glowing"> -->
                <h1 class="h1 hero-title" style="margin-left: 40px; margin-bottom: 15px;">
                    AuraGlow
                </h1>
            </a>

            <div class="header-actions">

                <button class="header-action-btn" aria-label="user">
                    <ion-icon name="person-outline" aria-hidden="true" aria-hidden="true"></ion-icon>
                </button>

                <button class="header-action-btn" aria-label="favourite item">
                    <ion-icon name="star-outline" aria-hidden="true" aria-hidden="true"></ion-icon>

                    <span class="btn-badge">0</span>
                </button>

                <button class="header-action-btn" aria-label="cart item">
                    <data class="btn-text" value="0">$0.00</data>

                    <ion-icon name="bag-handle-outline" aria-hidden="true" aria-hidden="true"></ion-icon>

                    <span class="btn-badge">0</span>
                </button>

            </div>

            <nav class="navbar">
                <ul class="navbar-list">
                    <h1>Skin Wellness</h1>

                    <!-- <li>
                      <a href="#home" class="navbar-link has-after">Home</a>
                    </li>

                    <li>
                      <a href="#collection" class="navbar-link has-after">Collection</a>
                    </li>

                    <li>
                      <a href="#shop" class="navbar-link has-after">Shop</a>
                    </li>

                    <li>
                      <a href="#offer" class="navbar-link has-after">Offer</a>
                    </li>

                    <li>
                      <a href="#blog" class="navbar-link has-after">Blog</a>
                    </li> -->

                </ul>
            </nav>

        </div>
    </div>

</header>





<!--
  - #MOBILE NAVBAR
-->

<div class="sidebar">
    <div class="mobile-navbar" data-navbar>

        <div class="wrapper">
            <a href="#" class="logo">
                <img src="./assets/images/logo.png" width="179" height="26" alt="Glowing">
            </a>

            <button class="nav-close-btn" aria-label="close menu" data-nav-toggler>
                <ion-icon name="close-outline" aria-hidden="true"></ion-icon>
            </button>
        </div>

        <ul class="navbar-list">

            <li>
                <a href="#home" class="navbar-link" data-nav-link>Home</a>
            </li>

            <li>
                <a href="#collection" class="navbar-link" data-nav-link>Collection</a>
            </li>

            <li>
                <a href="#shop" class="navbar-link" data-nav-link>Shop</a>
            </li>

            <li>
                <a href="#offer" class="navbar-link" data-nav-link>Offer</a>
            </li>

            <li>
                <a href="#blog" class="navbar-link" data-nav-link>Blog</a>
            </li>

        </ul>

    </div>

    <div class="overlay" data-nav-toggler data-overlay></div>
</div>


<!--
  - #skin wellness
-->


<ul class="has-scrollbar">

    <%
        List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
        if (productList != null && !productList.isEmpty()) {
            System.out.println(productList);

    %>
    <%
        for (ProductDTO product : productList) {
    %>


    <li class="scrollbar-item">
        <div class="shop-card">

            <div class="card-banner img-holder" style="--width: 540; --height: 720;">
                <img src="./assets/images/<%=product.getImage()%>" width="540" height="720" loading="lazy"
                     alt="Facial cleanser" class="img-cover">
                <div class="card-actions">

                    <button class="action-btn" aria-label="add to cart">
                        <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>
                    </button>

                    <button class="action-btn" aria-label="add to whishlist">
                        <ion-icon name="star-outline" aria-hidden="true"></ion-icon>
                    </button>

                    <button class="action-btn" aria-label="compare">
                        <ion-icon name="repeat-outline" aria-hidden="true"></ion-icon>
                    </button>

                </div>
            </div>

            <div class="card-content">

                <div class="price">
                    <span class="span">Rs <%=product.getPrice()%></span>
                </div>

                <h3>
                    <a href="#" class="card-title"><%=product.getName()%></a>
                </h3>

            </div>

        </div>
    </li>

<%--    <li class="scrollbar-item">--%>
<%--        <div class="shop-card">--%>

<%--            <div class="card-banner img-holder" style="--width: 540; --height: 720;">--%>
<%--                <img src="./assets/images/s3.webp" width="540" height="720" loading="lazy"--%>
<%--                     alt="Bio-shroom Rejuvenating Serum" class="img-cover">--%>

<%--                <div class="card-actions">--%>

<%--                    <button class="action-btn" aria-label="add to cart">--%>
<%--                        <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="add to whishlist">--%>
<%--                        <ion-icon name="star-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="compare">--%>
<%--                        <ion-icon name="repeat-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card-content">--%>

<%--                <div class="price">--%>
<%--                    <span class="span">Rs 5200</span>--%>
<%--                </div>--%>

<%--                <h3>--%>
<%--                    <a href="#" class="card-title">Tamarind Water Mist</a>--%>
<%--                </h3>--%>

<%--                <div class="card-rating">--%>

<%--                    <div class="rating-wrapper" aria-label="5 start rating">--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                    </div>--%>

<%--                    <p class="rating-text">5170 reviews</p>--%>

<%--                </div>--%>

<%--            </div>--%>

<%--        </div>--%>
<%--    </li>--%>

<%--    <li class="scrollbar-item">--%>
<%--        <div class="shop-card">--%>

<%--            <div class="card-banner img-holder" style="--width: 540; --height: 720;">--%>
<%--                <img src="./assets/images/s4.webp" width="540" height="720" loading="lazy"--%>
<%--                     alt="Coffee Bean Caffeine Eye Cream" class="img-cover">--%>

<%--                <div class="card-actions">--%>

<%--                    <button class="action-btn" aria-label="add to cart">--%>
<%--                        <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="add to whishlist">--%>
<%--                        <ion-icon name="star-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="compare">--%>
<%--                        <ion-icon name="repeat-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card-content">--%>

<%--                <div class="price">--%>
<%--                    <span class="span">Rs 2500</span>--%>
<%--                </div>--%>

<%--                <h3>--%>
<%--                    <a href="#" class="card-title">White Rice Moisturiser</a>--%>
<%--                </h3>--%>

<%--                <div class="card-rating">--%>

<%--                    <div class="rating-wrapper" aria-label="5 start rating">--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                    </div>--%>

<%--                    <p class="rating-text">5170 reviews</p>--%>

<%--                </div>--%>

<%--            </div>--%>

<%--        </div>--%>
<%--    </li>--%>

<%--    <li class="scrollbar-item">--%>
<%--        <div class="shop-card">--%>

<%--            <div class="card-banner img-holder" style="--width: 540; --height: 720;">--%>
<%--                <img src="./assets/images/s2.webp" width="540" height="720" loading="lazy"--%>
<%--                     alt="Facial cleanser" class="img-cover">--%>

<%--                <div class="card-actions">--%>

<%--                    <button class="action-btn" aria-label="add to cart">--%>
<%--                        <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="add to whishlist">--%>
<%--                        <ion-icon name="star-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="compare">--%>
<%--                        <ion-icon name="repeat-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card-content">--%>

<%--                <div class="price">--%>
<%--                    <span class="span">Rs 5200</span>--%>
<%--                </div>--%>

<%--                <h3>--%>
<%--                    <a href="#" class="card-title">Hydrating Water Mist</a>--%>
<%--                </h3>--%>

<%--                <div class="card-rating">--%>

<%--                    <div class="rating-wrapper" aria-label="5 start rating">--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                    </div>--%>

<%--                    <p class="rating-text">5170 reviews</p>--%>

<%--                </div>--%>

<%--            </div>--%>

<%--        </div>--%>
<%--    </li>--%>

<%--    <li class="scrollbar-item">--%>
<%--        <div class="shop-card">--%>

<%--            <div class="card-banner img-holder" style="--width: 540; --height: 720;">--%>
<%--                <img src="./assets/images/s6.webp" width="540" height="720" loading="lazy"--%>
<%--                     alt="Coffee Bean Caffeine Eye Cream" class="img-cover">--%>

<%--                <!-- <span class="badge" aria-label="20% off">-20%</span> -->--%>

<%--                <div class="card-actions">--%>

<%--                    <button class="action-btn" aria-label="add to cart">--%>
<%--                        <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="add to whishlist">--%>
<%--                        <ion-icon name="star-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="compare">--%>
<%--                        <ion-icon name="repeat-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card-content">--%>

<%--                <div class="price">--%>
<%--                    <!-- <del class="del">$39.00</del> -->--%>

<%--                    <span class="span">Rs 6500</span>--%>
<%--                </div>--%>

<%--                <h3>--%>
<%--                    <a href="#" class="card-title">Turmeric Vittamin C</a>--%>
<%--                </h3>--%>

<%--                <div class="card-rating">--%>

<%--                    <div class="rating-wrapper" aria-label="5 start rating">--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                    </div>--%>

<%--                    <p class="rating-text">5170 reviews</p>--%>

<%--                </div>--%>

<%--            </div>--%>

<%--        </div>--%>
<%--    </li>--%>

<%--    <li class="scrollbar-item">--%>
<%--        <div class="shop-card">--%>

<%--            <div class="card-banner img-holder" style="--width: 540; --height: 720;">--%>
<%--                <img src="./assets/images/s1.webp" width="540" height="720" loading="lazy"--%>
<%--                     alt="Facial cleanser" class="img-cover">--%>

<%--                <div class="card-actions">--%>

<%--                    <button class="action-btn" aria-label="add to cart">--%>
<%--                        <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="add to whishlist">--%>
<%--                        <ion-icon name="star-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                    <button class="action-btn" aria-label="compare">--%>
<%--                        <ion-icon name="repeat-outline" aria-hidden="true"></ion-icon>--%>
<%--                    </button>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card-content">--%>

<%--                <div class="price">--%>
<%--                    <span class="span">Ra 3800</span>--%>
<%--                </div>--%>

<%--                <h3>--%>
<%--                    <a href="#" class="card-title">Mattifyinng Night Cream</a>--%>
<%--                </h3>--%>

<%--                <div class="card-rating">--%>

<%--                    <div class="rating-wrapper" aria-label="5 start rating">--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                        <ion-icon name="star" aria-hidden="true"></ion-icon>--%>
<%--                    </div>--%>

<%--                    <p class="rating-text">5170 reviews</p>--%>

<%--                </div>--%>

<%--            </div>--%>

<%--        </div>--%>
<%--    </li>--%>

    <%
        }

    %>
    <%
        } else {
    %>
    <p>No products found.</p>
    <%
        }
    %>

</ul>











<!--
  - #FOOTER
-->

<footer class="footer" data-section>
    <div class="container">

        <div class="footer-top">

            <ul class="footer-list">

                <li>
                    <p class="footer-list-title">Company</p>
                </li>

                <li>
                    <p class="footer-list-text">
                        01/A Galle Road, Colombo 7, Sri Lanka
                    </p>
                </li>

                <li>
                    <p class="footer-list-text bold">+94 123 456 789</p>
                </li>

                <li>
                    <p class="footer-list-text">auraglow@gmail.com</p>
                </li>

            </ul>

            <ul class="footer-list">

                <li>
                    <p class="footer-list-title">Useful links</p>
                </li>

                <li>
                    <a href="#" class="footer-link">New Products</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Best Sellers</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Bundle & Save</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Online Gift Card</a>
                </li>

            </ul>

            <ul class="footer-list">

                <li>
                    <p class="footer-list-title">Infomation</p>
                </li>

                <li>
                    <a href="#" class="footer-link">Start a Return</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Contact Us</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Shipping FAQ</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Terms & Conditions</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Privacy Policy</a>
                </li>

            </ul>

            <div class="footer-list">

                <p class="newsletter-title">Good emails.</p>

                <p class="newsletter-text">
                    Enter your email below to be the first to know about new collections and product launches.
                </p>

                <form action="" class="newsletter-form">
                    <input type="email" name="email_address" placeholder="Enter your email address" required
                           class="email-field">

                    <button type="submit" class="btn btn-primary">Subscribe</button>
                </form>

            </div>

        </div>

        <div class="footer-bottom">

            <div class="wrapper">
                <p class="copyright">
                    &copy; 2024 AuraGlow
                </p>

                <ul class="social-list">

                    <li>
                        <a href="#" class="social-link">
                            <ion-icon name="logo-twitter"></ion-icon>
                        </a>
                    </li>

                    <li>
                        <a href="#" class="social-link">
                            <ion-icon name="logo-facebook"></ion-icon>
                        </a>
                    </li>

                    <li>
                        <a href="#" class="social-link">
                            <ion-icon name="logo-instagram"></ion-icon>
                        </a>
                    </li>

                    <li>
                        <a href="#" class="social-link">
                            <ion-icon name="logo-youtube"></ion-icon>
                        </a>
                    </li>

                </ul>
            </div>

            <a href="#" class="logo">
                <h1 class="h1 hero-title" style="margin-left: 40px;">
                    AuraGlow
                </h1>
            </a>

            <img src="./assets/images/pay.png" width="313" height="28" alt="available all payment method" class="w-100">

        </div>

    </div>
</footer>





<!--
  - #BACK TO TOP
-->

<a href="#top" class="back-top-btn" aria-label="back to top" data-back-top-btn>
    <ion-icon name="arrow-up" aria-hidden="true"></ion-icon>
</a>





<!--
  - custom js link
-->
<script src="./assets/js/script.js" defer></script>

<!--
  - ionicon link
-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>
