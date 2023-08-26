<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="liveIn.beans.*,liveIn.dao.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Hostel Details</title>
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




<h1 style="text-align:center" class="mt-5 mb-5">Hostel Details</h1>
<%
adminDAO dao = new adminDAO();
ArrayList<SubmitpgBean> hostelList = dao.viewHostels();
%>

<table class="table table-hover mb-5">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Accomodation For</th>
      <th scope="col">Suitable For</th>
      <th scope="col">Price</th>
      <th scope="col">Hostel Title</th>
      <th scope="col">Hostel Description</th>
      <th scope="col">Image</th>
      <th scope="col">City</th>
      <th scope="col">Locality</th>
      <th scope="col">Address</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
    
    <% for(SubmitpgBean hl : hostelList){
    %>
    <tr>
      <td scope="col"><%=hl.getId()%></td>
      <td scope="col"><%=hl.getAccomodation()%></td>
      <td scope="col"><%=hl.getSuitable() %></td>
      <td scope="col"><%=hl.getPrice()%></td>
      <td scope="col"><%=hl.getHosteltitle()%></td>
      <td scope="col"><%=hl.getHosteldescription()%></td>
      <td scope="col"><%=hl.getImage()%></td>
      <td scope="col"><%=hl.getCity() %></td>
      <td scope="col"><%=hl.getLocality() %></td>
      <td scope="col"><%=hl.getAddress() %></td>
      <td scope="col"><%=hl.getDate() %></td>
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