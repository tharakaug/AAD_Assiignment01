<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.aad_assignment01.CategoryDTO" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 1/24/2025
  Time: 6:03 PM
  To change this template use File | Settings | File Templates.
--%>
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

<%--                    <li>--%>
<%--                        <a href="adminDashboard.jsp" class="navbar-link has-after">Home</a>--%>
<%--                    </li>--%>

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
    <button class="btn btn-success mb-4" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Category</button>
    <button type="button"
            class="btn btn-product btn-primary mb-5 text-right"
            style="border: white 1px solid; border-radius: 5px; margin-top: 3rem; padding: 5px 22px; background-color: yellow; color: blue;"
            onclick="window.location.href='/AAD_Assignment01_war_exploded/category-all';">
        View All Categories
    </button>

    <% List <CategoryDTO> categoryList = (List<CategoryDTO>) request.getAttribute("categoryList");
    if (categoryList != null && !categoryList.isEmpty()) {
    %>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Category Id</th>
            <th>Name</th>
            <th>Description</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (CategoryDTO category : categoryList) { %>
        <tr>
            <td><%= category.getId()%></td >
            <td><%= category.getName()%></td>
            <td><%= category.getDescription()%></td>
            <td><img src="<%= category.getImage() %>"></td>
            <td>
                <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="populateEditModal('<%= category.getId() %>','<%= category.getName() %>', '<%= category.getDescription() %>', '<%= category.getImage() %>')">Update</button>
                <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteProductModal" onclick="setDeleteConfirmation('<%= category.getId() %>')">Delete</button>
            </td>
        </tr>
        <% } %>
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
                <h5 class="modal-title" id="addProductModalLabel">Add Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">


                <form id="addCategoryForm" action="category-save" method="post">
                    <div class="mb-3">
                    </div>
                    <div class="mb-3">
                        <label for="categoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" rows="3" name="description" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="categoryImage" class="form-label">Category Image</label>
                        <input type="file" class="form-control" id="categoryImage" accept="image/*" name="categoryImage" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save Category</button>
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
                <h5 class="modal-title" id="editProductModalLabel">Update Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updatecategoryForm" action="category-update" method="post">
                    <div class="mb-3">
                        <label for="update_category_id" class="form-label">Category ID</label>
                        <input type="text" class="form-control" name="update_category_id"
                               id="update_category_id">
                    </div>
                    <div class="mb-3">
                        <label for="update_category_id" class="form-label">Category Name</label>
                        <input type="text" class="form-control" name="update_category_name"
                               id="update_category_name">
                    </div>
                    <div class="mb-3">
                        <label for="update_category_description" class="form-label">Description</label>
                        <input type="text" class="form-control" name="update_category_description"
                               id="update_category_description" placeholder="Enter category description"
                               required>
                    </div>
                    <div id="current_category_image_wrapper" class="mb-3" style="display: none;">
                        <label class="form-label">Current Product Image</label>
                        <img id="current_category_image" src="" name="current_category_image"
                             alt="category Image" style="width: 100%; max-height: 200px;">
                    </div>
                    <div class="form-group mb-4">
                        <label>Attach New Product Image</label>
                        <input type="file" id="update_category_image" name="update_category_image"/>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">
                            Cancel
                        </button>
                        <button id="btn_update_category" type="submit" class="btn btn-primary">Update
                        </button>
                    </div>
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

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>

    const populateEditModal = (categoryId,categoryName, categoryDescription, categoryImage) => {
        // Populate other modal fields
        document.getElementById('update_category_id').value = categoryId || '';
        document.getElementById('update_category_name').value = categoryName || '';
        document.getElementById('update_category_description').value = categoryDescription || '';
        // document.getElementById('update_product_quantity').value = categoryImage || '';

        // Show the current image (if any) in an <img> element
        if (categoryImage) {
            document.getElementById('current_category_image').src = categoryImage;
            document.getElementById('current_category_image_wrapper').style.display = 'block'; // Make sure it's visible
        } else {
            document.getElementById('current_category_image_wrapper').style.display = 'none'; // Hide if no image
        }

        // Show the modal
        $('#updateCategoryModal').modal('show');
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
