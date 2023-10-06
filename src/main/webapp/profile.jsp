<%@ page import="me.sjihh.mbti.Authen.User" %>
<%@ page import="java.util.Objects" %>
<%@ page import="me.sjihh.mbti.MBTI.DetailMBTI" %>
<%@ page import="me.sjihh.mbti.MBTI.MBTIData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url = "./insert/uphead.html" />
<link href="css/profile.css" rel="stylesheet">
<link href="css/chart.css" rel="stylesheet">
<link href="css/button.css" rel="stylesheet">
<c:import url = "./insert/header.html" />
<%
	if (session==null || session.getAttribute("authenticatedUser") == null) {
%>
<c:redirect url="authen.jsp" />
<%
	}
User user = ((User)session.getAttribute("authenticatedUser"));
%>
<div class="section">
	<div class="container">
		<div class="row full-height justify-content-center">
			<div class="col-12 text-center align-self-center py-5">
				<div class="part section pb-5 pt-5 pt-sm-2 text-center">
					<h1>Xin chào <%=user.getUsername()%></h1>
					<canvas></canvas>

					<div id="Profile">
						<img src="https://s3-us-west-2.amazonaws.com/harriscarney/images/120x120.png"/>
						<span><%=user.getUsername()%></span>
					</div>
				</div>
			</div>
		</div>
		<div class="row full-height justify-content-center">
			<div class="col-12 text-center align-self-center py-5">
				<div class="part section pb-5 pt-5 pt-sm-2 text-center">
						<div class="about">
							<h3>Kết quả MBTI</h3>
							<p class="lead">Biểu đồ biểu diễn kết quả trắc nghiệm MBTI của bạn</p>
							<p class="result">Bạn thuộc nhóm tính cách: <b><%= user.getMbtiData().result() %></b></p>
							<div id="tooltip" class="tooltip-placeholder"></div>
						</div>

						<canvas id="marksChart" width="30%"></canvas>


					<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

					<script>
						var marksCanvas = document.getElementById("marksChart");

						var marksData = {
							labels: ["I", "S", "T", "J", "E", "N", "F", "P"],
							datasets: [{
								label: "MBTI Của bạn",
								backgroundColor: "rgba(200,0,0,0.2)",
								data: [ <%= user.getMbtiData().getI() %>, <%= user.getMbtiData().getS() %>
									, <%= user.getMbtiData().getT() %>, <%= user.getMbtiData().getJ() %>
									, <%= user.getMbtiData().getE() %>, <%= user.getMbtiData().getN() %>
									, <%= user.getMbtiData().getF() %>, <%= user.getMbtiData().getP() %>]
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
							<%= Objects.requireNonNull(DetailMBTI.get(user.getMbtiData().result())).getDetails()%>
							<br>
							<br>
							<br>
							<form action="logout" method="post" class = "position d-block mb-3">
								<input class="custom-btn btn-3" type=submit value="Đăng xuất" id="submit">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url = "insert/footer.jsp" />
<script src="js/profile.js"></script>
<c:import url = "./insert/downfoot.html" />