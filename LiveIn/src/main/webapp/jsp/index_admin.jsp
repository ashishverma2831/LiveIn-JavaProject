<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="liveIn.beans.*,java.util.*,liveIn.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Live-In</title> 
	
<%@include file="/common/commonCSS.html" %>     

<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<link rel="stylesheet" href="/LiveIn/css/features.css">
<link rel="stylesheet" href="/LiveIn/css/hostel_card.css">
	<style type="text/css">
body{
scroll-behavior: smooth;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
	integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	
<script type="text/javascript">

$(document).ready(function(){
    $("#btn-glass").click(function(){
         //alert("hello")
       // console.log($("#txtcity").val());
        var cityName = $("#search-place").val();//it will fetch the value from input text
        $.ajax({
            url: "/LiveIn/jsp/citywisehostels.jsp",
            method : "GET",
            data:{
                'city': cityName
            },
            //dataType: 'json',
            success: function(response_data){
              //alert(response_data)
              if(response_data!="")
				{	
					$("#divmembers").html(response_data)
					$("#divmembers").show();						
				}
              else{
            	  $("#divmembers").hide();
              }
			}   
         });
    });
})
</script>


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

<!-- hero section -->
  <div class="hero-section">
  <div class="title">
    <h3>Simplest Way to Search</h3>
    <p style="font-size: 20px;">Single and Sharing PG accomodation</p>
  </div>
  <div class="search-glass">
    <input type="search" name="" class="in-glass" id="" placeholder="Enter address e.g., street,city,zipcode">
    <!-- <i class="bi bi-search"></i> -->
    <button type="submit" class="btn-glass">Search</button>
  </div>
  </div>
<!-- hero section ends here-->


<!-- hostels card section -->
<%-- <%@include file="/html/hostel_card.html" %> --%>
<!-- hostels card section ends here -->

<div style="height:auto;display:none" id="divmembers"></div>


<h1 style="text-align: center;margin-top:80px" >Newly Added</h1>
    <section class="newly-added">
        
        <% adminDAO dao = new adminDAO();
          ArrayList<SubmitpgBean> hostelList = dao.viewHostels();
          
          for(SubmitpgBean sg : hostelList){
        
        %>
        
        <div class="container-c">
            <!-- card -->
            <div class="pg-image">
                <img src="/LiveIn/images/<%=sg.getImage() %>">
            </div>
            <div class="pg-info">
            <h2 class="pg-name"><%=sg.getHosteltitle() %></h2>
            <p class="pg-address"><i class="bi bi-geo-alt-fill"></i><%=sg.getAddress()%></p>
            <table class="pg-info-table">
                <tr>
                    <td>Accomodation for</td>
                    <td><%=sg.getAccomodation() %></td>
                </tr>
                <tr>
                    <td>Suitable for</td>
                    <td><%=sg.getSuitable() %></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>Rs. <%=sg.getPrice() %></td>
                </tr>
            </table>
            <div class="pg-owner-info">
                <p class="pg-owner"><i class="bi bi-person-fill"></i><%=sg.getOwnername()%></p>
                <p class="pg-updation"><i class="bi bi-calendar-fill"></i><%=sg.getDate() %></p>
            </div>
        </div>
        </div>

	<%} %>
    </section>
   
   
   

<!-- features section -->
<%@include file="/html/features.html" %>
<!-- features section ends here -->

<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->
  

<%@include file="/common/commonJS.html" %>
</body>
</html>