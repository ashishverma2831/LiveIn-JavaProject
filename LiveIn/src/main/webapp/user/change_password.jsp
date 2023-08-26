<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="liveIn.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
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
<%@include file="/header/header_user.html" %>
<!-- nav-bar ends here -->

<%
String userId = (String)session.getAttribute("userSessionId");

if(userId==null){
	request.setAttribute("msg","Unauthorized access, please do login first");
	RequestDispatcher rd = request.getRequestDispatcher("/user/user_login.jsp");
	rd.forward(request, response);
}
else{
 	/* UserBean userDetails = (UserBean)session.getAttribute("userDetails"); */
  	String message = (String)request.getAttribute("msg");
 	if(message!=null){
	%>
	<div class="alert alert-primary" role="alert">
        <%= message %>  
	</div>
<%}}%>


<section class="login-form-section">
    <div class="login-container">
        <h2 class="mt-2 mb-3">Change Password</h2>
        <form id="login-form" class="login-form" method="post" action="/LiveIn/changepassword">
            <label for="password">New Password:</label>
            <input type="password" id="password" name="password" placeholder="AShi@12345" required>
            <label for="password" class="mt-2">Confirm New Password:</label>
            <input type="password" id="password" name="confirm-password" placeholder="AShi@12345" required>
            <button type="submit" class="mt-4">Change Password</button>
        </form>
    </div>
</section>

<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->

<%@include file="/common/commonJS.html" %>

</body>
</html>