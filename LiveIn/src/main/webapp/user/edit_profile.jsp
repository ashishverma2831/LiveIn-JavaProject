<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="liveIn.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
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
.container {
  max-width: 440px;
  margin: 0 auto;
  padding: 20px;
  border:1px solid #ccc;
  border-radius:12px;
  transition:all 1s ease;
}
.container:hover{
transform:scale(1.05);
box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
transition:all 1s ease;
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
	String message = (String)request.getAttribute("msg");
	%>
	<div class="alert alert-primary" role="alert">
  	   <%=message %>
	</div>


<form method="post" action="/LiveIn/editprofile">
<div class="container">
    <h1 style="text-align:center;margin:20px 0 32px 0">Edit Profile</h1>
    <div class="profile-details">
      <p><strong>Name:</strong><input type="text" name="name" class="form-control" value="<%=userDetails.getName() %>"></p>
      <p><strong>Email:</strong> <%=userDetails.getEmail()%></p>
      <p><strong>Phone:</strong>  <input type="tel" name="phone" class="form-control" value="<%=userDetails.getPhone()%>"> </p>
      <p><strong>City:</strong> <input type="text" name="city" class="form-control" value=""></p>
      <p><strong>Address:</strong><textarea name="address" class="form-control"></textarea></p>
    </div>
    <div><button class="btn btn-success mt-3">Save Changes</button></div>
  </div>
  
</form>

<%}%>




<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->
  

<%@include file="/common/commonJS.html" %>
</body>
</html>