<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url = "./insert/uphead.html" />
<link href="css/authen.css" rel="stylesheet">
<c:import url = "./insert/header.html" />

<%
	if (session!=null && session.getAttribute("authenticatedUser") != null) {
%>
	<c:redirect url="profile.jsp" />
<%
	}
%>

<div class="section">
	<div class="container">
		<div class="row full-height justify-content-center">
			<div class="col-12 text-center align-self-center py-5">
				<div class="section pb-5 pt-5 pt-sm-2 text-center">
					<h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
					<input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
					<label for="reg-log"></label>
					<div class="card-3d-wrap mx-auto">
						<div class="card-3d-wrapper">
							<div class="card-front">
								<div class="center-wrap">
									<div class="section text-center">
										<form method="POST" action="login">
											<h4 class="mb-4 pb-3">Log In</h4>
											<div class="form-group">
												<label for="logemail"></label><input type="email" name="logemail" class="form-style" placeholder="Your Email" id="logemail" autocomplete="off" required>
												<i class="input-icon uil uil-at"></i>
											</div>
											<div class="form-group mt-2">
												<label for="logpass"></label><input type="password" name="logpass" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off" required>
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<input type="submit" class="btn mt-4" value="submit">
											<%--<p class="mb-0 mt-4 text-center"><a href="#0" class="link">Forgot your password?</a></p>--%>
										</form>
									</div>
								</div>
							</div>
							<div class="card-back">
								<div class="center-wrap">
									<div class="section text-center">
										<form method="POST" action="register">
											<h4 class="mb-4 pb-3">Sign Up</h4>
											<div class="form-group mt-2">
												<label for="signemail"></label><input type="email" name="signemail" class="form-style" placeholder="Your Email" id="signemail" autocomplete="off" required>
												<i class="input-icon uil uil-at"></i>
											</div>
											<div class="form-group mt-2">
												<label for="signuser"></label><input type="text" name="signuser" class="form-style" placeholder="Your Username" id="signuser" autocomplete="off" required>
												<i class="input-icon uil uil-at"></i>
											</div>
											<div class="form-group mt-2">
												<label for="signpass"></label><input type="password" name="signpass" class="form-style" placeholder="Your Password" id="signpass" autocomplete="off" required>
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<input type="submit" class="btn mt-4" value="submit">
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url = "insert/footer.jsp" />
<script src="js/authen.js"></script>
<c:import url = "./insert/downfoot.html" />