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

@WebServlet(name = "categoryAll", value = "/category-all")
public class CategoryAllServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("CategoryAllServlet");

        List<CategoryDTO> categoryList = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM categories");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                CategoryDTO category = new CategoryDTO(
                        resultSet.getInt("category_id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getString("image_url")
                );
                System.out.println("Category: " + category);
                categoryList.add(category);
            }

            req.setAttribute("categoryList", categoryList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("adminCatagories.jsp");
            requestDispatcher.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        }
    }
    }
