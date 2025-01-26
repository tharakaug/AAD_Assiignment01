package lk.ijse.aad_assignment01;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.sql.DataSource;

@WebServlet(name = "productSave", value = "/product-save")
public class ProductSaveServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("productName");
        String description = req.getParameter("description");
        String price = req.getParameter("price");
        String stock = req.getParameter("stock");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        String image = req.getParameter("productImage");

        System.out.println(name + " " + description + " " + price + " " + stock + " " + categoryId + " " + image);

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO products (name,category_id, description, price, stock_quantity, image_url) VALUES (?, ?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, categoryId);
            preparedStatement.setString(3, description);
            preparedStatement.setString(4, price);
            preparedStatement.setString(5, stock);
            preparedStatement.setString(6, image);


            int i = preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

            if (i > 0) {
                String message = "Product saved successfully";
                resp.sendRedirect("adminProduct.jsp?message=" + message);
            } else {
                String message = "Product save failed";
                resp.sendRedirect("adminProduct.jsp?message=" + message);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
