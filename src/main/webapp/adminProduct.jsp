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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">


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

        <button class="header-action-btn" aria-label="user" style="padding-right: 15px" id="adLogBtn">
          <ion-icon name="person-outline" aria-hidden="true" aria-hidden="true"></ion-icon>
<%--         <h2>User/Admin</h2>--%>
        </button>

      </div>

      <nav class="navbar">
        <ul class="navbar-list">
          <%--          <h1>Skin Wellness</h1>--%>

          <li>
            <a href="adminDashboard.jsp" class="navbar-link has-after">Home</a>
          </li>

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




<div style="margin-left: 100px; margin-right: 100px;" >
<button class="btn btn-success mb-4" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Product</button>
<table class="table table-bordered">
  <thead>
  <tr>
    <th>Product Id</th>
    <th>Category</th>
    <th>Name</th>
    <th>Description</th>
    <th>Price</th>
    <th>Stock</th>
    <th>Image</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>1</td>
    <td>Electronics</td>
    <td>Laptop</td>
    <td>High-performance laptop</td>
    <td>$1000</td>
    <td>50</td>
    <td><img src="Assets/Images/laptop.png" alt="Laptop" class="table-img"></td>
    <td>
      <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="populateEditModal(1)">Edit</button>
      <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteProductModal" onclick="setDeleteConfirmation(1)">Delete</button>
    </td>
  </tr>
  <!-- More rows can be dynamically added -->
  </tbody>
</table>
</div>

<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">


        <form id="addProductForm" action="product-save" method="post">
          <div class="mb-3">
            <label for="category" class="form-label">Category</label>
            <select class="form-select" id="category" required>
              <option value="" selected disabled>Select a category</option>
              <option value="electronics">Skin Wellness</option>
              <option value="appliances">Hair Wellness</option>
              <option value="clothing">Baby Care</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" name="productName" required>
          </div>
          <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" rows="3" name="description" required></textarea>
          </div>
          <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" class="form-control" id="price" name="price" required>
          </div>
          <div class="mb-3">
            <label for="stock" class="form-label">Stock</label>
            <input type="number" class="form-control" id="stock" name="stock" required>
          </div>
          <div class="mb-3">
            <label for="productImage" class="form-label">Product Image</label>
            <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
          </div>
          <button type="submit" class="btn btn-primary">Save Product</button>
        </form>


      </div>
    </div>
  </div>
</div>

<!-- Edit Product Modal -->
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="editProductForm">
          <div class="mb-3">
            <label for="editCategory" class="form-label">Category</label>
            <select class="form-select" id="editCategory" required>
              <option value="" selected disabled>Select a category</option>
              <option value="electronics">Skin Wellness</option>
              <option value="appliances">Hair Wellness</option>
              <option value="clothing">Baby Care</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="editProductName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="editProductName" required>
          </div>
          <div class="mb-3">
            <label for="editDescription" class="form-label">Description</label>
            <textarea class="form-control" id="editDescription" rows="3" required></textarea>
          </div>
          <div class="mb-3">
            <label for="editPrice" class="form-label">Price</label>
            <input type="number" class="form-control" id="editPrice" required>
          </div>
          <div class="mb-3">
            <label for="editStock" class="form-label">Stock</label>
            <input type="number" class="form-control" id="editStock" required>
          </div>
          <div class="mb-3">
            <label for="editProductImage" class="form-label">Product Image</label>
            <input type="file" class="form-control" id="editProductImage" accept="image/*">
          </div>
          <button type="submit" class="btn btn-primary">Update Product</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteProductModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteProductModalLabel">Confirm Deletion</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Are you sure you want to delete this product?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>
</div>





<!--
  - #BACK TO TOP
-->

<a href="#top" class="back-top-btn" aria-label="back to top" data-back-top-btn>
  <ion-icon name="arrow-up" aria-hidden="true"></ion-icon>
</a>


<script>
  function populateEditModal(productId) {
    // Populate the Edit Modal with product details (use AJAX or data from your database)
    document.getElementById('editProductName').value = "Laptop";
    document.getElementById('editDescription').value = "High-performance laptop";
    document.getElementById('editPrice').value = "1000";
    document.getElementById('editStock').value = "50";
    document.getElementById('editCategory').value = "electronics";
  }

  function setDeleteConfirmation(productId) {
    // Set product ID to delete (use AJAX or additional logic if needed)
    console.log("Preparing to delete product with ID: " + productId);
  }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<!-- Content -->

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
