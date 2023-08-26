<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="/common/commonCSS.html" %>
<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<link rel="stylesheet" href="/LiveIn/css/user_login.css"/> 
<style type="text/css">
.alert-primary{
	border-radius:0
}
</style>
</head>
<body>

<!-- nav-bar -->
<%@include file="/header/header_common.html" %>
<!-- nav-bar ends here -->

<% String message = (String)request.getAttribute("msg");
	if(message!=null){ %>
		<div class="alert alert-primary" role="alert">
  		<%=message %>
		</div>
<%}%>

<section class="login-form-section">
    <div class="login-container">
        <h2>Login</h2>
        <form id="login-form" class="login-form" method="post" action="/LiveIn/userlogin">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="ashi28@gmail.com" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="AShi@12345" required>
            <a href="#" class="forget-p">Forget Password?</a>
            <button type="submit">Login</button>
            <hr>
        </form>
        <p style="text-align:center">Don't have an account ?</p>
        <a href="/LiveIn/user/sign_up.jsp"><button type="submit">Sign-Up</button></a>
    </div>
</section>

<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->

<%@include file="/common/commonJS.html" %>
</body>
</html>