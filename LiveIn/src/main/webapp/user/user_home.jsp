<%-- <%@page import="liveIn.beans.UserBean"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="liveIn.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<%@include file="/common/commonCSS.html" %>     

<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<style type="text/css">
.alert-primary{
	border-radius:0
}
.btn-outline-primary{
	outline:none
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
	UserBean userDetails = (UserBean)session.getAttribute("userDetails");
	%>
	<div class="alert alert-primary" role="alert">
  	  Hello <%=userDetails.getName() %>
	</div>
<%}%>



<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->
  

<%@include file="/common/commonJS.html" %>
</body>
</html>