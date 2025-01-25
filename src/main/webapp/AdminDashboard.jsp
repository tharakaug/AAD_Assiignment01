<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AuraGlow-Admin</title>

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

  <div class="header-top" data-header>
    <div class="container">

      <button class="nav-open-btn" aria-label="open menu" data-nav-toggler>
        <span class="line line-1"></span>
        <span class="line line-2"></span>
        <span class="line line-3"></span>
      </button>

      <div class="input-wrapper">
        <input type="search" name="search" placeholder="Search" class="search-field">

        <button class="search-submit" aria-label="search">
          <ion-icon name="search-outline" aria-hidden="true"></ion-icon>
        </button>
      </div>

      <a href="#" class="logo">
        <!-- <img src="./assets/images/logo.png" width="179" height="26" alt="Glowing"> -->
        <h1 class="h1 hero-title" style="margin-left: 0px; margin-bottom: 15px;">
          AuraGlow-Admin
        </h1>
      </a>

      <div class="header-actions">

        <button class="header-action-btn" aria-label="user" style="padding-right: 15px">
          <ion-icon name="person-outline" aria-hidden="true" aria-hidden="true"></ion-icon>
          <h2>User/Admin</h2>
        </button>

      </div>

      <nav class="navbar">
        <ul class="navbar-list">
<%--          <h1>Skin Wellness</h1>--%>

<%--           <li>--%>
<%--            <a href="adminDashboard.jsp" class="navbar-link has-after">Home</a>--%>
<%--          </li>--%>

  <li>
    <a href="adminCatagories.jsp" class="navbar-link has-after">Category Manage</a>
  </li>

          <li>
            <a href="adminProduct.jsp" class="navbar-link has-after">Product Manage</a>
          </li>

          <li>
            <a href="adminCustomer.jsp" class="navbar-link has-after">Customer Manage</a>
          </li>

<%--          <li>--%>
<%--            <a href="#offer" class="navbar-link has-after">Offer</a>--%>
<%--          </li>--%>

<%--          <li>--%>
<%--            <a href="#blog" class="navbar-link has-after">Blog</a>--%>
<%--          </li>--%>

        </ul>
      </nav>

    </div>
  </div>

</header>


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
