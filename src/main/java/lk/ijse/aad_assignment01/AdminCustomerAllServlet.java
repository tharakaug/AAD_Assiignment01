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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "adminCustomerAll", value = "/admin-customer-all")
public class AdminCustomerAllServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("AdminCustomerAllSevlet");
        List<AdminCustomerDTO> adminCustomerList = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Users");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AdminCustomerDTO customer = new AdminCustomerDTO(
                        resultSet.getInt("user_id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("role"),
                        resultSet.getString("is_active"),
                        resultSet.getString("image_url")
                );
                System.out.println("User: " + customer);
                adminCustomerList.add(customer);
            }

            req.setAttribute("adminCustomerList", adminCustomerList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("adminCustomer.jsp");
            requestDispatcher.forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        }

    }
}
