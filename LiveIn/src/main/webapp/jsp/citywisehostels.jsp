<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="liveIn.beans.*,liveIn.dao.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>City wise hostels</title>
</head>
<body>


<%
String city = request.getParameter("city");
System.out.println("city name recieved by server is "+city);

adminDAO dao = new adminDAO();
ArrayList<SubmitpgBean> cityHostelList = dao.cityHostelsList(city);
if(cityHostelList.isEmpty()){
out.println("<div class='alert alert-danger' role='alert'> There are no hotels in "+city+" </div>");
}
else{
%>

<h1 style="text-align: center;margin-top:80px" >Hotels in <%=city %></h1>
    <section class="newly-added">
        
        <%
          for(SubmitpgBean sg : cityHostelList){
        %>
        
        <div class="container-c">
            <!-- card -->
            <div class="pg-image">
                <img src="/LiveIn/images/<%=sg.getImage() %>" alt="hostel-photo">
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
<%} %>
</body>
</html>