<%-- 
Document : login
Created on : Feb 3, 2015, 4:04:37 PM
Author : Nagireddy
--%>

<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>


<!-- new styles -->

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Success Page</title>

<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/font-awesome.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/main.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/responsive.css"/>">

<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/general.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/profilediv.css"/>">
<!-- end of js -->
<style>
.bgcolor {
	background-color: #479EE7;
}

.successpage {
	padding-top: 10px;
	text-align: center;
}

.success3 {
	font-size: 16px;
}
</style>
</head>
<body>
	<div id="wrap">
		<header id="header">
			<!--header-->
			<div class="header_top" id="header_top">
				<!--header_top-->
				<div class="container">
					<s:include value="/includes/template/header.jsp" />
				</div>
			</div>
			<!--/header_top-->

		</header>
		<!--/header-->
		<div id="main">
			<section id="generalForm">
				<!--form-->

				<div class="col-lg-12">
					<div class="col-lg-3"></div>
					<div class="col-lg-12">

						<div class="" id="profileBox2"
							style="float: left; margin-top: 5px">
							<div class="">
								<div class="panel-heading">
									<h4 class="panel-title">
										<p align="center" style="font-size: 40px;">
											<font color="#56a5ec"> <b> Thanks for signing up!</b>
											</font>
										</p>
									</h4>
								</div>

								<div class=" text-center" style="width: 100%">
									<!-- style="box-shadow: 0px 0px 15px #888888;" -->
									<img src="/sb/includes/images/home/project2.jpg;" alt="loin">
								</div>
							</div>
							<div class="login-form modal fade" id="myLogin" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" id="Form_login" role="document">
									<div class="modal-content">
										<div class="modal-header "
											style="background-color: rgb(52, 152, 219); background-color: rgba(52, 152, 219, 0.8); border-top-right-radius: 6px; border-top-left-radius: 6px;">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel"
												style="color: white">Login to your account</h4>
										</div>
										<div class="modal-body">

											<s:form action="/general/loginCheck.action" method="post"
												name="userLoginForm" id="userLoginForm">
												<input type="email" placeholder="Email" name="emailId"
													id="emailId" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" required
													data-error-message="LoginId is required!" tabindex="1" />

												<input type="password" placeholder="Password"
													name='password'
													pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" id="password"
													title="Must be at least 6 characters long, and contain at least one number, one uppercase and one lowercase letter"
													required data-type="Password" tabindex="2" />

												<p id="wrapper">
													<a class="slide_open" href="" id="closeLogin"
														data-dismiss="modal" data-toggle="modal"
														data-target="#forgotPwd"><font class="fgtPwd">Forgot
															Password</font></a>
												</p>
												<div class="LoginButton">
													<button type="submit">LogIn</button>
												</div>
											</s:form>
											<%
												if (request.getAttribute("errorMessage") != null) {
													out.println(request.getAttribute("errorMessage"));
												}
											%>


										</div>
									</div>
								</div>
							</div>
							<div class="successpage">
								<p class="success3">Dear ServicesBay User,</p>

								<p class="success3">Thank you for Registering to ServicesBay</p>

								<%-- <h1 style="color: #188DD0">
									<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
									Congratulations!
								</h1>
								<p style="font-size: 16px;">
									Your registration completed successfully. In case of any
									problems or not being able to login<br> Please contact: <a href="mailto:sb@miraclesoft.com" target="_top">sb@miraclesoft.com</a>
								</p>  --%>
								<s:if test="hasActionMessages()">

									<s:actionmessage escape="false"/>

								</s:if>
							</div>

						</div>
					</div>
					<div class="col-lg-3"></div>
				</div>

			</section>
			<!--/form-->
		</div>
	</div>
	<footer id="footer">
		<!--Footer-->

		<div class="footer-bottom" id="footer_bottom">
			<div class="container">
				<s:include value="/includes/template/footer.jsp" />
			</div>
		</div>

	</footer>
	<!--/Footer-->

</body>
</html>