package lk.ijse.aad_assignment01;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "ProductDeleteServlet", value = "/product-delete")
public class ProductDeleteServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Product delete request received");

        String productIDParam = req.getParameter("productID");
        System.out.println("productIDParam: " + productIDParam);

        // Validate productID parameter
        if (productIDParam == null || productIDParam.isEmpty()) {
            System.out.println("Invalid product ID");
            resp.sendRedirect("product.jsp?status=error&message=Invalid Product ID");
            return;
        }

        try {
            int productID = Integer.parseInt(productIDParam);

            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM products WHERE product_id = ?")) {

                preparedStatement.setInt(1, productID);
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Product deleted successfully");
                    resp.sendRedirect("product.jsp?status=success&message=Product Deleted Successfully");
                } else {
                    System.out.println("No product found with the given ID");
                    resp.sendRedirect("product.jsp?status=failure&message=No Product Found with Given ID");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid product ID format: " + productIDParam);
            resp.sendRedirect("product.jsp?status=error&message=Invalid Product ID Format");
        } catch (SQLException e) {
            System.out.println("Database error occurred: " + e.getMessage());
            resp.sendRedirect("product.jsp?status=error&message=Database Error Occurred");
        }
    }

}
