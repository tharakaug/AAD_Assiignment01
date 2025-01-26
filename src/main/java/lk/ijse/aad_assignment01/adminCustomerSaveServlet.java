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

@WebServlet(name = "adminCustomerSave", value = "/admin-customer-save")
public class adminCustomerSaveServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String active = req.getParameter("active");
        String image = req.getParameter("image");

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO users (name, email, password, role, is_active, image_url) VALUES (?, ?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, role);
            preparedStatement.setString(5, active);
            preparedStatement.setString(6, image);

            int i = preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

            if (i > 0) {
                String message = "Customer saved successfully";
                resp.sendRedirect("adminCustomer.jsp?message=" + message);
            } else {
                String message = "Failed to save customer";
                resp.sendRedirect("adminCustomer.jsp?message=" + message);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
