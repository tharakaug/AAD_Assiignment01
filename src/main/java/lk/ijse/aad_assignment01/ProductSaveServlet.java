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
        String image = req.getParameter("productImage");

        System.out.println(name + " " + description + " " + price + " " + stock + " " + image);

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO products (name, description, price, stock_quantity, image_url) VALUES (?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, price);
            preparedStatement.setString(4, stock);
            preparedStatement.setString(5, image);

            int i = preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

            if (i > 0) {
                resp.sendRedirect("adminDashboard.jsp");
            } else {
                resp.sendRedirect("adminDashboard.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
