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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SkinServlet", value = "/skin-servlet")
public class SkinServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> productList = new ArrayList<>();
        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products WHERE category_id = 5");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                int category_id = resultSet.getInt("category_id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String price = resultSet.getString("price");
                String stockQuantity = resultSet.getString("stock_quantity");
                String image_url = resultSet.getString("image_url");

                System.out.println("Name: " + name + ", Description: " + description + ", Price: " + price + ", Stock Quantity: " + stockQuantity + ", Image URL: " + image_url);

                ProductDTO productDTO = new ProductDTO(id, category_id, name, description, price, stockQuantity, image_url);
                productList.add(productDTO);
            }

            req.setAttribute("productList", productList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("skin.jsp");
            requestDispatcher.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        }



    }
}
