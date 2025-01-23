//package lk.ijse.aad_assignment01;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import javax.sql.DataSource;
//import java.io.IOException;
//import java.net.URLEncoder;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//@WebServlet(name = "user_login", value = "/user_login")
//public class UserLoginServlet extends HttpServlet {
//
//    @Resource(name = "java:comp/env/jdbc/pool")
//    private DataSource dataSource;
//
////    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
////        String name = request.getParameter("name");
////        response.sendRedirect("index.jsp");
////
////
////    }
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String email = req.getParameter("email");
//        String password = req.getParameter("password");
//        String role = req.getParameter("role");
//
//
//       System.out.println(email + " " + password + " " + role);
//       if (email == null || password == null) {
//            resp.sendRedirect("userLogin.jsp");
//            return;
//        }
//        try (Connection connection = dataSource.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(
//                     "SELECT * FROM users WHERE email = ? AND password = ?")) {
//
//            preparedStatement.setString(1, email);
//            preparedStatement.setString(2, password);
//
//            try (ResultSet resultSet = preparedStatement.executeQuery()) {
//                if (resultSet.next()) {
//                    String alertMessage = "User Login Successfully!";
//                    resp.sendRedirect("index.jsp?message+" + URLEncoder.encode(alertMessage,"UTF-8"));
//
//                } else {
//                    String alertMessage = "User Login Failed!";
//                    resp.sendRedirect("login.jsp?error="+URLEncoder.encode(alertMessage,"UTF-8"));
//                }
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//  }
//        if (role == null) {
//            resp.sendRedirect("userLogin.jsp");
//            return;
//        }
//
//        try (Connection connection = dataSource.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(
//                     "SELECT * FROM users WHERE role = ?")) {
//
//            preparedStatement.setString(1, role);
//
//            try (ResultSet resultSet = preparedStatement.executeQuery()) {
//                if (resultSet.next()) {
//                    String alertMessage = "User Login Successfully!";
//                    resp.sendRedirect("skin.jsp?message+" + URLEncoder.encode(alertMessage,"UTF-8"));
//
//                } else {
//                    String alertMessage = "User Login Failed!";
//                    resp.sendRedirect("index.jsp?error="+URLEncoder.encode(alertMessage,"UTF-8"));
//                }
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//
//
//    }
//
//}


package lk.ijse.aad_assignment01;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.sql.DataSource;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "user_login", value = "/user_login")
public class UserLoginServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        System.out.println("Email: " + email + ", Password: " + password + ", Role: " + role);

        // Check if any of the parameters are null
        if (email == null || password == null || role == null) {
            String alertMessage = "Email, password, and role are required!";
            resp.sendRedirect("userLogin.jsp?error=" + URLEncoder.encode(alertMessage, "UTF-8"));
            return;
        }

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?")) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, role);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    // User authenticated successfully
                    String alertMessage = "User Login Successfully!";
                    HttpSession session = req.getSession();
                    session.setAttribute("userRole", role); // Store role in session
                    session.setAttribute("userName", resultSet.getString("name")); // Store user name in session

                    // Redirect based on role
                    if (role.equals("ADMIN")) {
                        resp.sendRedirect("adminLogin.jsp?message=" + URLEncoder.encode(alertMessage, "UTF-8"));
                    } else if ("CUSTOMER".equalsIgnoreCase(role)) {
                        resp.sendRedirect("index.jsp?message=" + URLEncoder.encode(alertMessage, "UTF-8"));
                    } else {
                        resp.sendRedirect("index.jsp?error=" + URLEncoder.encode("Unknown role!", "UTF-8"));
                    }
                } else {
                    // Authentication failed
                    String alertMessage = "Invalid email, password, or role!";
                    resp.sendRedirect("userLogin.jsp?error=" + URLEncoder.encode(alertMessage, "UTF-8"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error occurred!", e);
        }
    }
}
