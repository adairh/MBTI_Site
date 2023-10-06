package me.sjihh.mbti.Authen;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Date;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("signuser");
        String password = request.getParameter("signpass");
        String email = request.getParameter("signemail");

        // Hash and salt the password here for security (not shown in this example)

        // Store the user in the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mbti", "admin", "admin");
            String query = "INSERT INTO users (" +
                    "username, password, email, registration_date, last_login, active, mbti_id" +
                    ") VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, LocalDateTime.now().toString());
            preparedStatement.setString(5, LocalDateTime.now().toString());
            preparedStatement.setString(6, "1");
            preparedStatement.setString(7, "-1");
            preparedStatement.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        PrintWriter out = response.getWriter();
        response.sendRedirect("reg_success.jsp");
    }
}
