package me.sjihh.mbti;

import com.fasterxml.jackson.databind.ObjectMapper;
import me.sjihh.mbti.Authen.User;
import me.sjihh.mbti.MBTI.MBTIData;
import me.sjihh.mbti.Questions.*;

import java.io.*;
import java.net.URISyntaxException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "quiz", value = "/quiz")
public class Quiz extends HttpServlet {
    public void init() {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            File jsonFile = new File(Objects.requireNonNull(this.getClass().getResource("/mbti.json")).toURI());
            questionnaire = objectMapper.readValue(jsonFile, Questionnaire.class);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }
    }

    private Questionnaire questionnaire;

    public void readJSon(HttpServletResponse response) throws IOException {




            PrintWriter out = response.getWriter();


            out.println("<div class= \"mbti row justify-content-center\">");
            out.println("<div class= \"col-12\">");
            int i = 0;
            out.println("<form method='POST' action='quiz'>");
            for (QuestionPart questionPart : questionnaire.getQuestions()) {
                out.println("<div class=\"part section-title\"><h3>" + questionPart.getQuestion() + "</h3></div>");
                int j = 0;
                for (QuestionChoice questionChoice : questionPart.getChoices()) {


                    out.println("<div id = \"q-"+ i+"-"+j +"\" class = \"question text-gray-600 hover:text-gray-800 bg-white rounded shadow \"" +
                            ((i!=0||j!=0) ? "style=\"display: none;\"" : "")
                          +  " ><p>" + (j+1) + ". " + questionChoice.getQuestion() + "<p>");
                    out.println("<div class=\"choice flex flex-col items-center py-16 bg-gray-100\">");
                    out.println("<ul id=\"filter1\" class=\"filter-switch h-10 p-1 space-x-1\">");
                    for (Option option : questionChoice.getOptions()) {
                        /*out.println("<input type=\"radio\" id=\""+option.getType()+"\" name=\""+i+""+j+"\" value=\""+option.getType()+"\">");
                        out.println("<label for=\""+option.getType()+"\">" + option.getOption() + "</label><br>");*/
                        out.println("<li class=\"filter-switch-item h-8 bg-gray-300x\">");
                        out.println("<input class=\"question-item\" type=\"radio\" name=\""+i+""+j+"\" id=\""+i+""+j+option.getType()+"\" value=\""+ option.getType() +"\" class=\"sr-only\" required>");
                        out.println("<label for=\""+ i+""+j+ option.getType() +"\" class=\"h-8 py-1 px-2 text-sm leading-6\">");
                        out.println(option.getOption()==0?"Đúng":"Sai");
                        out.println("</label>");
                        out.println("<div aria-hidden=\"true\" class=\"filter-active\"></div>");
                        out.println("</li>");
                    }

                    out.println("</ul>");
                    out.println("</div>");
                    j++;
                    out.println("</div>");
                }
                i++;
            }

            out.println("<div class=\"frame\">");
            out.println("<input class=\"custom-btn btn-3\" type=\"submit\" value=\"Gửi kết quả\" id=\"submit\">");
            out.println("</div>");
            out.println("</form>");
            out.println("</div>");
            out.println("</div><br>");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ServletException {

            HashMap<Integer, List<String>> hl = new HashMap<Integer, List<String>>();
            int part = questionnaire.getQuestions().size();
            int question;
            for (int i = 0; i < part; i++) {
                List<String> l = new ArrayList<String>();
                question = questionnaire.getQuestions().get(i).getChoices().size();
                for (int j = 0; j < question; j++) {
                    l.add(req.getParameter(i+""+j));
                }
                hl.put(i+1, l);
            }
            MBTIData mbtiData = new MBTIData(hl);
            req.setAttribute("mbti", mbtiData);
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mbti", "admin", "admin");


                if (req.getSession() != null && req.getSession().getAttribute("authenticatedUser") != null) {
                    System.out.println("logged user");
                    User user = (User) req.getSession().getAttribute("authenticatedUser");
                    String sql;
                    if (user.getMbtiId() == -1) {
                        System.out.println("mbti !-1");
                        sql = "INSERT INTO mbti_values (extraversion, introversion, sensing, intuition, thinking, feeling, judging, perceiving) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
                    } else {
                        System.out.println("mbti !-1");
                        sql = "UPDATE mbti_values SET extraversion = ?, introversion = ?, sensing = ?, intuition = ?, thinking = ?, feeling = ?, judging = ?, perceiving = ? WHERE mbti_id = ?";

                    }
                    PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    preparedStatement.setDouble(1, mbtiData.getE());
                    preparedStatement.setDouble(2, mbtiData.getI());
                    preparedStatement.setDouble(3, mbtiData.getS());
                    preparedStatement.setDouble(4, mbtiData.getN());
                    preparedStatement.setDouble(5, mbtiData.getT());
                    preparedStatement.setDouble(6, mbtiData.getF());
                    preparedStatement.setDouble(7, mbtiData.getJ());
                    preparedStatement.setDouble(8, mbtiData.getP());

                    if (user.getMbtiId() == -1) {
                        preparedStatement.executeUpdate();
                        ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                        if (generatedKeys.next()) {
                            int lastInsertedId = generatedKeys.getInt(1);
                            System.out.println(lastInsertedId);
                            String userMbtiId = "UPDATE users SET mbti_id = ? WHERE user_id = ?";
                            user.setMbtiId(lastInsertedId);
                            user.setMbtiData(mbtiData);
                            req.setAttribute("mbti", mbtiData);
                            PreparedStatement preparedUserMbtiId = connection.prepareStatement(userMbtiId);
                            preparedUserMbtiId.setInt(1, lastInsertedId);
                            preparedUserMbtiId.setInt(2, user.getUserId());
                            preparedUserMbtiId.executeUpdate();
                        }
                    } else {
                        preparedStatement.setInt(9, user.getMbtiId());
                        preparedStatement.executeUpdate();
                        user.setMbtiData(mbtiData);
                    }

                    req.getSession().setAttribute("authenticatedUser", user);
                    // Close the database connection
                    connection.close();
                }
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        getServletContext().getRequestDispatcher("/result.jsp")
                    .forward(req, resp);

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
            User user = (User) request.getSession().getAttribute("authenticatedUser");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Quiz</title>");
            out.println("<style>");
            out.println("\n" +
                    "  <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\" rel=\"stylesheet\">");
            out.println(LoadCSS("/css/style.css"));
            out.println(LoadCSS("/css/button.css"));
            out.println(LoadCSS("/css/bootstrap.min.css"));
            out.println("</style>");
            /*out.println("</head>");
            out.println("<body>");*/

            RequestDispatcher dispatcher;
            dispatcher = request.getRequestDispatcher("/insert/header.html");
            dispatcher.include(request, response);
            out.println("<div class= \"mbti row justify-content-center\">");
            out.println("<div class= \"col-12\">");

            if (request.getSession() != null && request.getSession().getAttribute("authenticatedUser") != null) {
                out.println("<div class=\"part section-title\"><h3>Xin chào "+user.getUsername()+"</h3></div>");
                if (user.getMbtiId() == -1) {
                    out.println("<div class=\"part section-title\"><h4>Hãy cùng khám phá xem bạn thuộc nhóm tính cách nào nhéee!</h4></div>");
                } else {
                    out.println("<div class=\"part section-title\"><h4>Lần kiểm tra trước đó của bạn cho kết quả là " + user.getMbtiData().result() + "</h4></div>");
                    out.println("<div class=\"part section-title\"><h4><a href=\"/result.jsp\">" +
                            "Nhấn vào đây để xem lại kết quả" +
                            "</a></h4></div>");
                }

            }
            out.println("</div>");
            out.println("</div>");
            readJSon(response);
            out.println("<script>");
            out.println(loadJavaScript("/js/script.js"));
            out.println(loadJavaScript("/js/bootstrap.bundle.min.js"));
            out.println("</script>");
        dispatcher = request.getRequestDispatcher("/insert/footer.jsp");
        dispatcher.include(request, response);
        dispatcher = request.getRequestDispatcher("/insert/downfoot.html");
        dispatcher.include(request, response);
            /*out.println("</body></html>");*/
        out.close();
    }

    public void destroy() {
    }

    private String LoadCSS(String name) {
        InputStream cssInputStream = Objects.requireNonNull(this.getClass().getResourceAsStream(name));
        BufferedReader reader = new BufferedReader(new InputStreamReader(cssInputStream));
        StringBuilder cssContent = new StringBuilder();
        String line;
        while (true) {
            try {
                if ((line = reader.readLine()) == null) break;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            cssContent.append(line).append("\n");
        }
        return cssContent.toString();
    }
    private String loadJavaScript(String name) {
        InputStream JsInputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(name);
        assert JsInputStream != null;
        BufferedReader JsReader = new BufferedReader(new InputStreamReader(JsInputStream));
        StringBuilder JsContent = new StringBuilder();
        String line;
        try {
            while ((line = JsReader.readLine()) != null) {
                JsContent.append(line).append("\n");
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to read JavaScript file", e);
        }
        return JsContent.toString();
    }

}