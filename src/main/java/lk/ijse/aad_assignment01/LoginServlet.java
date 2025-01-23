package lk.ijse.aad_assignment01;

import java.io.*;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.sql.DataSource;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {

//    @Resource(name = "java:comp/env/jdbc/pool")
//    private DataSource dataSource;
//
//
//
////    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
////        String name = request.getParameter("name");
////        response.sendRedirect("index.jsp");
////
////
////    }
//
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = req.getParameter("name");
//        String email = req.getParameter("email");
//        String password = req.getParameter("password");
//
//        System.out.println(name + " " + email + " " + password);
//
//        if (email == null || password == null) {
//            resp.sendRedirect("index.jsp");
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
//                } else {
//                    String alertMessage = "User Login Failed!";
//                    resp.sendRedirect("login.jsp?error="+URLEncoder.encode(alertMessage,"UTF-8"));
//                }
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//  }
//}

}