<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="liveIn.dao.*,java.util.*,liveIn.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Contacts</title>
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




<h1 style="text-align:center" class="mt-5 mb-5">Contacts</h1>
<%
adminDAO dao = new adminDAO();
ArrayList<ContactusBean> contactList = dao.viewContacts();
%>

<table class="table table-hover mb-5">
  <thead>
    <tr>
      <th scope="col">Serial No</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Subject</th>
      <th scope="col">Message</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
    
    <% for(ContactusBean cb : contactList){
    %>
    <tr>
      <td scope="col"><%=cb.getSno() %></td>
      <td scope="col"><%=cb.getName() %></td>
      <td scope="col"><%=cb.getEmail() %></td>
      <td scope="col"><%=cb.getSubject() %></td>
      <td scope="col"><%=cb.getMessage() %></td>
      <td scope="col"><%=cb.getDate() %></td>
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