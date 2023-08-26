<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<%@include file="/common/commonCSS.html" %>
<link rel="stylesheet" href="/LiveIn/css/user_login.css" />
</head>
<style>
body{
height:100vh;
width:100vw;
}
.alert-primary{
	border-radius:0
}
</style>

<body>

<% String message = (String)request.getAttribute("msg");
	if(message!=null){ %>
		<div class="alert alert-primary" role="alert">
  		<%=message %>
		</div>
<%}%>

<div class="login-container">
        <h2>Login</h2>
        <form method="post" action="/LiveIn/admin_login_s" id="login-form" class="login-form">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <!-- <a href="#" class="forget-p">Forget Password?</a> -->
            <button type="submit">Login</button>
        </form>
    </div>
    
</body>
</html>