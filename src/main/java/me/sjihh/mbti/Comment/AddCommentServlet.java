package me.sjihh.mbti.Comment;

import me.sjihh.mbti.Authen.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cmt")
public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get comment content from the form
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (request.getSession() != null && request.getSession().getAttribute("authenticatedUser") != null) {

            String commentContent = request.getParameter("commentContent");
            /*commentContent = new String(commentContent.getBytes("ISO-8859-1"), "UTF-8");*/

            System.out.println(commentContent);

            // You can retrieve user ID from the session or another source
            int userId = ((User)request.getSession().getAttribute("authenticatedUser")).getUserId();
            // Insert the comment into the database
            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12746309", "sql12746309", "lWI1awXtWR");
                String query = "INSERT INTO comments (cmt_content, user_id, cmt_time) VALUES (?, ?, NOW())";
                System.out.println(query);
                PreparedStatement preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, commentContent);
                preparedStatement.setInt(2, userId);
                preparedStatement.executeUpdate();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        // Redirect back to the page displaying comments
        response.sendRedirect("about.jsp"); // Replace with your actual page
    }
}
