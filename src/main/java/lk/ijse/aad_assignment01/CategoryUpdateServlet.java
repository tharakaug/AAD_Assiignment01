////package lk.ijse.aad_assignment01;
////
////import jakarta.annotation.Resource;
////import jakarta.servlet.ServletException;
////import jakarta.servlet.annotation.WebServlet;
////import jakarta.servlet.http.HttpServlet;
////import jakarta.servlet.http.HttpServletRequest;
////import jakarta.servlet.http.HttpServletResponse;
////
////import javax.sql.DataSource;
////import java.io.IOException;
////import java.sql.Connection;
////import java.sql.PreparedStatement;
////import java.sql.SQLException;
////
////@WebServlet(name = "categoryUpdate", value = "/category-update")
////public class CategoryUpdateServlet extends HttpServlet {
////
////    @Resource(name = "java:comp/env/jdbc/pool")
////    private DataSource dataSource;
////    @Override
////    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////        String name = req.getParameter("name");
////        String description = req.getParameter("description");
////        String image = req.getParameter("image");
////        int id = Integer.parseInt(req.getParameter("category_id"));
////
////
////        try {
////            Connection connection = dataSource.getConnection();
////            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE categories SET name = ?, description = ?, image_url = ? WHERE category_id = ?");
////            preparedStatement.setString(1, name);
////            preparedStatement.setString(2, description);
////            preparedStatement.setString(3, image);
////            preparedStatement.setLong(4, Long.parseLong(req.getParameter("category_id")));
////            int i = preparedStatement.executeUpdate();
////            if (i > 0) {
////                resp.sendRedirect("adminDashboard.jsp");
////            } else {
////                resp.sendRedirect("adminDashboard.jsp");
////            }
////        } catch (SQLException e) {
////            throw new RuntimeException(e);
////        }
////
////    }
////}
//
//package lk.ijse.aad_assignment01;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import javax.sql.DataSource;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//@WebServlet(name = "categoryUpdate", value = "/category-update")
//public class CategoryUpdateServlet extends HttpServlet {
//
//    @Resource(name = "java:comp/env/jdbc/pool")
//    private DataSource dataSource;
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = req.getParameter("name");
//        String description = req.getParameter("description");
//        String image = req.getParameter("image");
//        String categoryIdParam = req.getParameter("category_id");
//
//        // Validate the category_id parameter
//        if (categoryIdParam == null || categoryIdParam.isEmpty()) {
//            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Category ID is required.");
//            return;
//        }
//
//        int categoryId;
//        try {
//            categoryId = Integer.parseInt(categoryIdParam);
//        } catch (NumberFormatException e) {
//            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Category ID format.");
//            return;
//        }
//
//        // Validate required fields
//        if (name == null || name.isEmpty() || description == null || description.isEmpty() || image == null || image.isEmpty()) {
//            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields (name, description, image) are required.");
//            return;
//        }
//
//        try (Connection connection = dataSource.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(
//                     "UPDATE categories SET name = ?, description = ?, image_url = ? WHERE category_id = ?")) {
//
//            preparedStatement.setString(1, name);
//            preparedStatement.setString(2, description);
//            preparedStatement.setString(3, image);
//            preparedStatement.setInt(4, categoryId);
//
//            int rowsUpdated = preparedStatement.executeUpdate();
//            if (rowsUpdated > 0) {
//                resp.sendRedirect("adminDashboard.jsp");
//            } else {
//                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update the category. Please try again.");
//            }
//
//        } catch (SQLException e) {
//            // Log the exception and return an error response
//            e.printStackTrace();
//            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating the category.");
//        }
//    }
//}
//

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

@WebServlet(name = "categoryUpdate", value = "/category-update")
public class CategoryUpdateServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("category update");

        String categoryIDParam = req.getParameter("update_category_id");
        String name = req.getParameter("update_category_name");
        String description = req.getParameter("update_category_description");
        String imageUrl = req.getParameter("update_category_image");

        System.out.println(categoryIDParam + " " + name + " " + description + " " + imageUrl);

        try {

            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement("UPDATE categories SET description = ?, image_url = ?, name = ? WHERE category_id = ?")) {

                preparedStatement.setString(1, description);
                preparedStatement.setString(2, imageUrl);
                preparedStatement.setString(3, name);
                preparedStatement.setInt(4, Integer.parseInt(categoryIDParam));

                int i = preparedStatement.executeUpdate();

                preparedStatement.close();
                connection.close();

                if (i > 0) {
                    System.out.println("Category updated successfully");
                    resp.sendRedirect("adminCatagories.jsp");
                } else {
                    System.out.println("Category update failed");
                    resp.sendRedirect("adminCatagories.jsp");
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
 }
}
}
