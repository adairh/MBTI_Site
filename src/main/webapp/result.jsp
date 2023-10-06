<%@ page import="me.sjihh.mbti.Authen.User" %>
<%@ page import="me.sjihh.mbti.MBTI.DetailMBTI" %>
<%@ page import="me.sjihh.mbti.MBTI.MBTIData" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url = "./insert/uphead.html" />

<c:import url = "./insert/header.html" />
<style><%@include file="css/chart.css"%></style>
<%
    if (request.getSession() != null &&
            request.getSession().getAttribute("authenticatedUser") != null) {
        User user = (User) request.getSession().getAttribute("authenticatedUser");
        if (user.getMbtiId() != -1) {
            request.setAttribute("mbti", user.getMbtiData());
        }
    }
%>
<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="part section pb-5 pt-5 pt-sm-2 text-center">
                    <div class="card">
                        <div class="about">
                            <h3>Kết quả MBTI</h3>
                            <p class="lead">Biểu đồ biểu diễn kết quả trắc nghiệm MBTI của bạn</p>
                            <p class="result">Bạn thuộc nhóm tính cách: <b>${mbti.result()}</b></p>
                            <div id="tooltip" class="tooltip-placeholder"></div>
                        </div>
                        <canvas id="marksChart" width="50%" height="50%"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="part section pb-5 pt-5 pt-sm-2 text-center">
                    <div class="container information">
                        <div class="info">
                            <h3>Chi tiết về nhóm tính cách của bạn</h3>
                            <p class="result">Bạn thuộc nhóm tính cách: <b>${mbti.result()}</b></p>
                            <%= Objects.requireNonNull(DetailMBTI.get(((MBTIData) request.getAttribute("mbti")).result())).getDetails()%>
                            <br>
                            <br>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    var marksCanvas = document.getElementById("marksChart");

    var marksData = {
        labels: ["I", "S", "T", "J", "E", "N", "F", "P"],
        datasets: [{
            label: "MBTI Của bạn",
            backgroundColor: "rgba(200,0,0,0.2)",
            data: ['${mbti.getI()}', '${mbti.getS()}'
            , '${mbti.getT()}', '${mbti.getJ()}'
            , '${mbti.getE()}', '${mbti.getN()}'
            , '${mbti.getF()}', '${mbti.getP()}']
        }]
    };
    const options = {
        scales: {
            r: {
                min: 0,
                max: 100,
                ticks: {
                    stepSize: 10
                },
            },
        }
    };
    var radarChart = new Chart(marksCanvas, {
        type: 'radar',
        data: marksData,
        options: options
    });
</script>


<c:import url = "insert/footer.jsp" />
<script src="js/profile.js"></script>
<c:import url = "./insert/downfoot.html" />
