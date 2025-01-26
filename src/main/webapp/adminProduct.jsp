<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.aad_assignment01.ProductDTO" %>
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

<%--          <li>--%>
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


        </ul>
      </nav>

    </div>
  </div>

</header>




<div style="margin-left: 100px; margin-right: 100px;" >
<button class="btn btn-success mb-4" data-bs-toggle="modal" style="border: white 1px solid; border-radius: 5px; margin-top: 3rem;  padding: 5px 22px; background-color: #ffbb01; font-size: 17px; font-weight:bold ;color: white;" data-bs-target="#addProductModal">Add Product</button>
  <button type="button"
          class="btn btn-product btn-primary mb-5 text-right"
          style="border: white 1px solid; border-radius: 5px; margin-top: 4.5rem; padding: 5px 22px; background-color: #ffbb01; font-size: 17px; font-weight: bold; color: white;"
          onclick="window.location.href='/AAD_Assignment01_war_exploded/all-product-servlet';">
    View All Products
  </button>


  <%
    List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
    if (productList != null && !productList.isEmpty()) {


  %>

<table class="table table-bordered">
  <thead>
  <tr>
    <th>Product Id</th>
    <th>Name</th>
    <th>Category Id</th>
    <th>Description</th>
    <th>Price</th>
    <th>Stock</th>
    <th>Image</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <%
    for (ProductDTO product : productList) {

  %>
  <tr>
    <td><%= product.getId() %></td>
    <td><%= product.getName() %></td>
    <td><%= product.getCategory_id() %></td>
    <td><%= product.getDescription() %></td>
    <td><%= product.getPrice() %></td>
    <td><%= product.getStock() %></td>
    <td><img src="<%= product.getImage() %>" alt="<%= product.getName() %>" class="table-img"></td>
<%--    <td><img src="Assets/Images/laptop.png" alt="Laptop" class="table-img"></td>--%>
    <td>
      <button class="btn btn-primary btn-sm" data-bs-toggle="modal" style="border: white 1px solid; border-radius: 5px;  padding: 5px 22px; background-color: darkblue; font-size: 14px; font-weight:bold ;color: white;" data-bs-target="#editProductModal" onclick="populateEditModal('<%= product.getId() %>','<%= product.getName() %>', '<%= product.getPrice() %>', '<%= product.getStock() %>', '<%= product.getDescription() %>', '<%= product.getImage() %>')">Update</button>
      <button class="btn btn-danger btn-sm" data-bs-toggle="modal" style="border: white 1px solid; border-radius: 5px;  padding: 5px 22px; background-color: red; font-size: 14px; font-weight:bold ;color: white;" data-bs-target="#deleteProductModal" onclick="setDeleteConfirmation('<%= product.getId() %>')">Delete</button>
    </td>
  </tr>
  <% } %>
  <!-- More rows can be dynamically added -->
  </tbody>
</table>
  <%
  } else {
  %>
  <p>No product found.</p>
  <%
    }
  %>
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
<%--          <div class="mb-3">--%>
<%--            <label for="category" class="form-label">Category</label>--%>
<%--            <select class="form-select" id="category" required>--%>
<%--              <option value="" selected disabled>Select a category</option>--%>
<%--              <option value="electronics">Skin Wellness</option>--%>
<%--              <option value="appliances">Hair Wellness</option>--%>
<%--              <option value="clothing">Baby Care</option>--%>
<%--            </select>--%>
<%--          </div>--%>
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
            <label for="stock" class="form-label">Category ID</label>
            <input type="number" class="form-control" id="categoryId" name="categoryId" required>
          </div>
          <div class="mb-3">
            <label for="productImage" class="form-label">Product Image</label>
            <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
          </div>
          <button type="submit" style="border: white 1px solid; border-radius: 5px;  padding: 5px 22px; background-color: green; font-size: 14px; font-weight:bold ;color: white;"  class="btn btn-primary">Save Product</button>
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


        <form id="updateProductForm" action="product-update" method="post">
          <div class="mb-3">
            <label for="update_product_id" class="form-label">Product ID</label>
            <input type="text" class="form-control" name="update_product_id"
                   id="update_product_id">
          </div>
          <div class="mb-3">
            <label for="update_product_id" class="form-label">Product Name</label>
            <input type="text" class="form-control" name="update_product_name"
                   id="update_product_name">
          </div>
          <div class="mb-3">
            <label for="update_product_description" class="form-label">Description</label>
            <input type="text" class="form-control" name="update_product_description"
                   id="update_product_description" placeholder="Enter product description"
                   required>
          </div>
          <div class="mb-3">
            <label for="update_product_price" class="form-label">Price</label>
            <input type="number" class="form-control" name="update_product_price"
                   id="update_product_price" placeholder="Enter product price" required>
          </div>
          <div class="mb-3">
            <label for="update_product_quantity" class="form-label">Quantity</label>
            <input type="number" class="form-control" name="update_product_quantity"
                   id="update_product_quantity" placeholder="Enter product quantity"
                   required>
          </div>
          <div class="mb-3">
            <label for="update_product_category" class="form-label">Category ID</label>
            <input type="text" class="form-control" name="update_product_category"
                   id="update_product_category" placeholder="Enter category ID" required>
          </div>
          <div id="current_product_image_wrapper" class="mb-3" style="display: none;">
            <label class="form-label">Current Product Image</label>
            <img id="current_product_image" src="" name="current_product_image"
                 alt="Product Image" style="width: 100%; max-height: 200px;">
          </div>
          <div class="form-group mb-4">
            <label>Attach New Product Image</label>
            <input type="file" id="update_product_image" name="update_product_image"/>
          </div>
          <div class="d-flex justify-content-end">
            <button type="button" class="btn btn-secondary me-2" style="border: white 1px solid; border-radius: 5px;  padding: 5px 22px; background-color: red; font-size: 14px; font-weight:bold ;color: white;" data-bs-dismiss="modal">
              Cancel
            </button>
            <button id="btn_update_product" type="submit" style="border: white 1px solid; border-radius: 5px;  padding: 5px 22px; background-color: darkblue; font-size: 14px; font-weight:bold ;color: white;" class="btn btn-primary">Update
            </button>
          </div>
        </form>
        <%
          String message = request.getParameter("message");
          if (message != null && !message.isEmpty()) {
        %>
        <script>
          alert("<%= message %>");
        </script>
        <%
          }
        %>
        <%
          String error = request.getParameter("error");
          if (error != null) {
        %>
        <script>
          alert("<%= error %>");
        </script>
        <%
          }
          %>


      </div>
    </div>
  </div>
</div>

<!-- Delete Confirmation Modal -->
<%--<div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteProductModalLabel" aria-hidden="true">--%>
<%--  <div class="modal-dialog">--%>
<%--    <div class="modal-content">--%>
<%--      <div class="modal-header">--%>
<%--        <h5 class="modal-title" id="deleteProductModalLabel">Confirm Deletion</h5>--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--      </div>--%>
<%--      <div class="modal-body">--%>
<%--        Are you sure you want to delete this product?--%>
<%--      </div>--%>
<%--      <div class="modal-footer">--%>
<%--        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>--%>
<%--        <button type="button" class="btn btn-danger">Delete</button>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>





<!--
  - #BACK TO TOP
-->

<a href="#top" class="back-top-btn" aria-label="back to top" data-back-top-btn>
  <ion-icon name="arrow-up" aria-hidden="true"></ion-icon>
</a>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<!-- Content -->

<!--
  - custom js link
-->
<script src="./assets/js/adminProduct.js" defer></script>

<!--
  - ionicon link
-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>

  const populateEditModal = (productID, productName, productPrice, productQuantity, productDescription, productCategory, productImageUrl) => {
    // Populate other modal fields
    document.getElementById('update_product_id').value = productID || '';
    document.getElementById('update_product_name').value = productName || '';
    document.getElementById('update_product_price').value = productPrice || '';
    document.getElementById('update_product_quantity').value = productQuantity || '';
    document.getElementById('update_product_description').value = productDescription || '';
    document.getElementById('update_product_category').value = productCategory || '';

    // Show the current image (if any) in an <img> element
    if (productImageUrl) {
      document.getElementById('current_product_image').src = productImageUrl;
      document.getElementById('current_product_image_wrapper').style.display = 'block'; // Make sure it's visible
    } else {
      document.getElementById('current_product_image_wrapper').style.display = 'none'; // Hide if no image
    }

    // Show the modal
    $('#updateProductModal').modal('show');
  };

  const setDeleteConfirmation = (productID) => {
    if (confirm('Are you sure you want to delete this product?')) {
       // Use Fetch API to send a POST request for deletion
      fetch('/AAD_Assingment_01_war_exploded/product-delete', {
        method: 'POST',
        body: new URLSearchParams({
          'productID': productID
        }),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }
      })
              .then(response => {
                if (response.ok) {
                  // Redirect or update the page after deletion
                  window.location.href = '/AAD_Assingment_01_war_exploded/all-product-servlet'; // Redirect to all products page

                } else {
                  alert("Error deleting the product.");
                }
              })
              .catch(error => {
                console.error("Error:", error);
                alert("An error occurred.");
              });
    }
  };


</script>
</body>
</html>