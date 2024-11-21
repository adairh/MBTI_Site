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
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row full-height justify-content-center">
			<div class="col-12 text-center align-self-center py-5">
				<div class="part section pb-5 pt-5 pt-sm-2 text-center">
					<div class="container information">
						<div class="info">
							<h3>Các dịch vụ bạn đã sử dụng</h3>





							<h3>Dịch vụ đã hẹn</h3>

							<%--<%= Objects.requireNonNull(DetailMBTI.get(user.getMbtiData().result())).getDetails()%>--%>
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