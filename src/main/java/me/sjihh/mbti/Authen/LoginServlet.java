package me.sjihh.mbti.Authen;

import me.sjihh.mbti.MBTI.MBTIData;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("logemail");
        String password = request.getParameter("logpass");
        // Verify user credentials in the database
        User authenticatedUser = authenticateUser(email, password);

        if (authenticatedUser != null) {
            // Store the authenticated user in the session
            request.getSession().setAttribute("authenticatedUser", authenticatedUser);

            // Redirect to a success page or perform any other actions
            response.sendRedirect("profile.jsp");
        } else {
            // Set an error message and return to the login page
            request.setAttribute("errorMessage", "Authentication failed. Please try again.");
            request.getRequestDispatcher("authen.jsp").forward(request, response);
        }
    }

    private User authenticateUser(String email, String password) {
        User authenticatedUser = null;
        MBTIData mbti = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12746309", "sql12746309", "lWI1awXtWR");
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int userId = resultSet.getInt("user_id");
                String username = resultSet.getString("username");
                Date registrationDate = resultSet.getDate("registration_date");
                Date lastLogin = resultSet.getDate("last_login");
                boolean active = resultSet.getBoolean("active");
                int mbtiId = resultSet.getInt("mbti_id");

                authenticatedUser = new User(userId, username, password, email, registrationDate, lastLogin, active, mbtiId);

                System.out.println("MBTIIIII " + mbtiId);
                if (mbtiId != -1) {
                    System.out.println("MBTI " + mbtiId);
                    String mbtiQuery = "SELECT * FROM mbti_values WHERE mbti_id = ?";
                    PreparedStatement mbtiStatement = conn.prepareStatement(mbtiQuery);
                    mbtiStatement.setInt(1, mbtiId);
                    ResultSet mbtiResultSet = mbtiStatement.executeQuery();

                    if (mbtiResultSet.next()) {
                        double extraversion = mbtiResultSet.getDouble("extraversion");
                        double introversion = mbtiResultSet.getDouble("introversion");
                        double sensing = mbtiResultSet.getDouble("sensing");
                        double intuition = mbtiResultSet.getDouble("intuition");
                        double thinking = mbtiResultSet.getDouble("thinking");
                        double feeling = mbtiResultSet.getDouble("feeling");
                        double judging = mbtiResultSet.getDouble("judging");
                        double perceiving = mbtiResultSet.getDouble("perceiving");

                        mbti = new MBTIData(introversion, extraversion, sensing, intuition, thinking, feeling, judging, perceiving);

                        authenticatedUser.setMbtiData(mbti);
                    }
                    else {
                        authenticatedUser.setUsername("Bi loi ne ba oi");
                        System.out.println("hong co " + mbtiId);
                    }
                } else {
                    authenticatedUser.setUsername("Bi loi ne ma oi");
                }

            }

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return authenticatedUser;
    }
}
