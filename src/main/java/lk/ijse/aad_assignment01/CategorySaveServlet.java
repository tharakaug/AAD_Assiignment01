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

@WebServlet(name = "categorySave", value = "/category-save")
public class CategorySaveServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("categoryName");
        String description = req.getParameter("description");
        String image = req.getParameter("categoryImage");

        System.out.println(name + " " + description + " " + image);

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO categories (name, description, image_url) VALUES (?, ?, ?)")) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, image);

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


