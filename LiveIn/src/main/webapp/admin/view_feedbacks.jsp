<%@page import="liveIn.dao.adminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="liveIn.dao.*,java.util.*,liveIn.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Feedbacks</title>
<%@include file="/common/commonCSS.html" %>     

<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<style type="text/css">
.alert-primary{
border-radius:0
}
th,td{
text-align:center
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


<h1 style="text-align:center" class="mt-5 mb-5">Feedbacks</h1>
<%
adminDAO dao = new adminDAO();
ArrayList<FeedbackBean> feedbackList = dao.viewFeedbacks();
%>

<table class="table table-hover mb-5">
  <thead>
    <tr>
      <th scope="col">Serial No</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Ratings</th>
      <th scope="col">Given Feedback</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
    
    <% for(FeedbackBean fb : feedbackList){
    %>
    <tr>
      <td scope="col"><%=fb.getSno() %></td>
      <td scope="col"><%=fb.getUsername() %></td>
      <td scope="col"><%=fb.getEmail() %></td>
      <td scope="col"><%=fb.getRating() %></td>
      <td scope="col"><%=fb.getFeedbacktext() %></td>
      <td scope="col"><%=fb.getDate() %></td>
    </tr>
    
    <%} %>
    
  </tbody>
</table>






<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->
  

<%@include file="/common/commonJS.html" %>
</body>
</html>