<%@ page import="me.sjihh.mbti.MBTI.DetailMBTI" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url = "./insert/uphead.html" />
<link href="css/popup.css" rel="stylesheet">
<c:import url = "./insert/header.html" />
		<!-- Start Hero Section -->
		<div class="hero">
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-lg-5">
						<div class="intro-excerpt">
							<h1 style="color: #626262;">Myers-Briggs<br><span clsas="d-block">Type Indicator</span></h1>
							<p><a href="quiz" class="btn btn-secondary me-2">TEST now!</a><a href="#" class="btn btn-white-outline">Explore</a></p>
						</div>
					</div>
					<div class="col-lg-7">
						<div class="hero-img-wrap">
							<img src="images/.png" class="img-fluid">
						</div>
					</div>
					<div class="row justify-content-between"><br></div>
				</div>
			</div>
		</div>
		<!-- End Hero Section -->
		<!-- Start Product Section -->
		<div class="product-section">
			<div class="container">
				<div class="row">
					<!-- Start Column 1 -->
					<div class="col-md-12 col-lg-6 mb-5 mb-lg-0">
						<h2 class="mb-4 section-title">Tổng quan về MBTI</h2>
						<p class="mb-4">
							MBTI, viết tắt của Myers-Briggs Type Indicator, là một công cụ phân loại tính cách dựa trên công trạng của Katherine Cook Briggs và Isabel Briggs Myers. Với sự kết hợp của bốn yếu tố chính - Hướng ngoại hoặc Hướng nội, Thu thập thông tin qua giác quan hoặc Quyết đoán thông qua trực giác, Ra quyết định dựa trên tình cảm hoặc Ra quyết định dựa trên lý thuyết, và Sắp xếp cuộc sống hoặc Tính linh hoạt - MBTI phân loại con người thành 16 loại tính cách khác nhau. Công cụ này thường được sử dụng trong lĩnh vực tâm lý học, quản lý và nhân sự để giúp cá nhân hiểu về bản chất của họ và cách họ tương tác với người khác. Tuy nhiên, MBTI cũng đã gặp phải nhiều tranh cãi về tính khoa học và tính chính xác của nó, do đó cần thận trọng khi áp dụng trong thực tế.
						</p>
						<p><a href="quiz" class="btn">Explore</a></p>
					</div>
					<!-- End Column 1 -->
					<!-- Start Column 2 -->
					<div class="col-12 col-lg-6 mb-5 mb-md-0">
						<div class="mb-4">
							<img src="images/KatherineCookBriggs_IsabelBriggsMyers.jpg" class="img-fluid">
						</div>
					</div>
					<!-- End Column 2 -->
				</div>
			</div>
		</div>
		<!-- End Product Section -->
		<!-- Start Testimonial Slider -->
		<div class="testimonial-section">
			<div class="container">

				<div class="row">
					<div class="col-lg-7 mx-auto text-center">
						<h2 class="section-title">Sơ lược các nhóm tính cách</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-lg-12">

						<div class="testimonial-slider-wrap text-center popup-contain">
							<div id="testimonial-nav">
								<span class="prev" data-controls="prev"><span class="fa fa-chevron-left"></span></span>
								<span class="next" data-controls="next"><span class="fa fa-chevron-right"></span></span>
							</div>
							<%
								for (DetailMBTI d : DetailMBTI.values()) {
							%>
								<div class="container popup text-center" id="pop-up-<%= d.getShortName()%>" style="overflow-y:scroll;">
									<div class="popup-content">
										<%= d.getDetails()%>
									</div>
									<br>
									<br>
									<button class="closeButton position d-block mb-3" data-target="pop-up-<%= d.getShortName()%>">Đóng</button>
								</div>
							<%
								}
							%>
							<div class="testimonial-slider">
						<%
							for (DetailMBTI d : DetailMBTI.values()) {
						%>
								<div class="item">
									<div class="row justify-content-center">
										<div class="col-lg-8 mx-auto">
											<div class="testimonial-block text-center">
												<blockquote class="mb-5">
													<p>
														<%= d.getDescription()%>
													</p>
												</blockquote>
												<div class="author-info">
													<div class="author-pic">
														<img src="images/mbti/<%= d.getShortName()%>.png" alt="Maria Jones" class="img-fluid">
													</div>
													<h3 class="font-weight-bold"><%= d.getShortName()%></h3>
													<span class="position d-block mb-3"><%= d.getLongName()%></span>
													<button class="showButton position d-block mb-3" data-target="pop-up-<%= d.getShortName()%>">Nhấn để xem chi tiết</button>
												</div>
											</div>

										</div>
									</div>
								</div>
						<%
							}
						%>
								<!-- END item -->
							</div>

						</div>
					</div>
				</div>



			</div>
		</div>
		<!-- End Testimonial Slider -->
<c:import url = "insert/footer.jsp" />
<script src="js/popup.js"></script>
<c:import url = "./insert/downfoot.html" />
