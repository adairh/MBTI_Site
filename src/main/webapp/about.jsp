<%@ page import="java.sql.*" %>
<%@ page import="me.sjihh.mbti.Comment.Comment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="me.sjihh.mbti.Authen.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:import url = "./insert/uphead.html" />
<c:import url = "./insert/header.html" />
<style><%@include file="css/comment.css"%></style>


<!-- Start Hero Section -->
<div class="hero">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-lg-5">
				<div class="intro-excerpt">
					<h1>Về chúng tôi</h1>
					<p class="mb-4">Hãy xem người khác đánh giá gì về chúng tôi, và bạn cũng có thể!</p>
					<p><a href="quiz" class="btn btn-secondary me-2">Test now!</a><a href="#" class="btn btn-white-outline">Explore</a></p>
				</div>
			</div>
			<div class="col-lg-7">
				<div class="hero-img-wrap">
					<img src="images/mbti.png" class="img-fluid">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Hero Section -->


<!-- Start Team Section -->
<div class="untree_co-section">
	<div class="container">

		<div class="row mb-5">
			<div class="col-lg-5 mx-auto text-center">
				<h2 class="section-title">Our Team</h2>
			</div>
		</div>

		<div class="row">

			<!-- Start Column 1 -->
			<div class="col-12 col-lg-4 mb-5 mb-md-0">
				<img src="images/siunhan/aa.jpg" class="img-fluid mb-5">
				<h3 clas><a href="#"><span class="">........</span> ..........</a></h3>
				<span class="d-block position mb-4">Tác giả.</span>
			</div>
			<!-- End Column 1 -->

			<!-- Start Column 2 -->
			<div class="col-12 col-lg-4 mb-5 mb-md-0">
				<img src="images/siunhan/aa.jpg" class="img-fluid mb-5">

				<h3 clas><a href="#"><span class="">.....</span> ..........</a></h3>
				<span class="d-block position mb-4">GVHD</span>

			</div>
			<!-- End Column 2 -->
			<!-- Start Column 2 -->
			<div class="col-12 col-lg-4 mb-5 mb-md-0">
				<img src="images/siunhan/aa.jpg" class="img-fluid mb-5">

				<h3 clas><a href="#"><span class="">..........</span> .........</a></h3>
				<span class="d-block position mb-4">Tác giả.</span>

			</div>
			<!-- End Column 2 -->


		</div>
	</div>
</div>
<!-- End Team Section -->


<!-- Start Why Choose Us Section -->
<div class="why-choose-section">
	<div class="container">
		<div class="row justify-content-between align-items-center">
			<div class="col-lg-12">
				<h2 class="section-title">Các bình luận</h2>

				<div class="container">

					<div class="comments-section">

						<div class="row">

							<%
								List<Comment> comments = new ArrayList<>();
								User user;
								try {
									Class.forName("com.mysql.cj.jdbc.Driver");
									Connection conn = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12746309", "sql12746309", "lWI1awXtWR");
									String query = "SELECT * FROM comments c INNER JOIN users u " +
											"ON c.user_id = u.user_id ORDER BY c.cmt_time ASC";
									PreparedStatement statement = conn.prepareStatement(query);
									ResultSet resultSet = statement.executeQuery();

									while (resultSet.next()) {
										Comment comment = new Comment(
												resultSet.getInt("cmt_id"),
												resultSet.getString("cmt_content"),
												resultSet.getInt("user_id"),
												resultSet.getTimestamp("cmt_time"));
										String username = resultSet.getString("username");
										java.util.Date registrationDate = resultSet.getDate("registration_date");
										Date lastLogin = resultSet.getDate("last_login");
										boolean active = resultSet.getBoolean("active");
										int mbtiId = resultSet.getInt("mbti_id");

										user = new User(resultSet.getInt("user_id"), username, "", "", registrationDate, lastLogin, active, mbtiId);
										comment.setUser(user);
										comments.add(comment);

									}

									resultSet.close();
									statement.close();
									conn.close();
								} catch (ClassNotFoundException | SQLException e) {
									System.out.println("Connection failed: " + e.getMessage());
									throw new RuntimeException(e);
								}
								for (Comment cmt : comments) {
							%>
							<div class="container">
								<%
									// Get the current date and time
									Date currentDate = new Date();


									long timeDifference = currentDate.getTime() - cmt.getTimestamp().getTime();

									// Calculate the difference in days
									long daysDifference = timeDifference / (1000 * 60 * 60 * 24);

									// Calculate the difference in hours, minutes, and seconds
									long hoursDifference = (timeDifference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
									long minutesDifference = (timeDifference % (1000 * 60 * 60)) / (1000 * 60);
									long secondsDifference = (timeDifference % (1000 * 60)) / 1000;
								%>
								<div class="card comment">
									<div class="card-body">
										<div class="row">
											<div class="col-md-2 comment-front">
												<img src="https://s3-us-west-2.amazonaws.com/harriscarney/images/120x120.png" class="img img-rounded img-fluid"/>
												<p class="text-secondary"><%= hoursDifference %> hours, <%= minutesDifference %> minute ago</p>
											</div>
											<div class="col-md-10">
												<p>
													<a class="float-left" href=""><strong><%=cmt.getUser().getUsername()%></strong></a>

												</p>
												<div class="clearfix"></div>
												<p><%=cmt.getCmtContent()%></p>
											</div>
										</div>

									</div>
								</div>
							</div>


							<%
								}
								if (session!=null && session.getAttribute("authenticatedUser") != null) {
							%>
							<div class="row">
								<div class="col-12">
									<div class="comment-add">
										<form id="commentForm" action="cmt" method="post" accept-charset="utf-8">
											<div class="col-xs-12">
												<textarea name="commentContent" id="commentContent" charset="UTF-8"></textarea>
												<input type="submit" class="btn btn-default pull-right" value="Add Comment">
											</div>
										</form>
									</div>
								</div>
							</div>

							<%
							} else {
							%>
							<p>Đăng nhập để bình luận bạn nha!</p>
							<%
								}

							%>
						</div>

					</div>

				</div>

			</div>
		</div>
	</div>
</div>
<!-- End Why Choose Us Section -->

<c:import url = "insert/footer.jsp" />
<c:import url = "./insert/downfoot.html" />
