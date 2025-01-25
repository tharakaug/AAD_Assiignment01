package lk.ijse.aad_assignment01;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AllProductServlet", value = "/all-product-servlet")
public class ProductAllServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ProductAllSevlet");
        List<ProductDTO> productList = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                ProductDTO product = new ProductDTO(
                        resultSet.getInt("product_id"),
                        resultSet.getInt("category_id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getString("price"),
                        resultSet.getString("stock_quantity"),
                        resultSet.getString("image_url")

                );
                System.out.println("Product: " + product);
                productList.add(product);
            }

            req.setAttribute("productList", productList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("adminProduct.jsp");
            requestDispatcher.forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        }
    }

}
