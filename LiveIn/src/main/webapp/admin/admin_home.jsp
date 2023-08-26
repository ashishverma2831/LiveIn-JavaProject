<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin-Home</title>
<%@include file="/common/commonCSS.html" %>     

<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<style type="text/css">
.alert-primary{
border-radius:0
}
</style>
</head>
<body> 

<!-- nav-bar -->
<%@include file="/header/header_admin.html" %>
<!-- nav-bar ends here -->

<% 
String adminId = (String)session.getAttribute("adminSessionId");
String role = (String)session.getAttribute("role");

if(adminId==null){
	request.setAttribute("msg","Unauthorized Access, please do login first");
	RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
	rd.forward(request, response);
}
else{
	%>
	<div class="alert alert-primary" role="alert">
  	  Hello <%=role %>
	</div>
<%}%>





<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->
  

<%@include file="/common/commonJS.html" %>
</body>
</html>