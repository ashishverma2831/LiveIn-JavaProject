<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="liveIn.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Submit Hostel</title>
<%@include file="/common/commonCSS.html" %>     

<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<link rel="stylesheet" href="/LiveIn/css/submit_pg.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
	integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<style type="text/css">
.alert-primary{
	border-radius:0
}
body{
	    background-image: linear-gradient(to left, #065c77, #007e97, #00a2b1, #00c6c4, #12ebce);
}
</style>
<script>
	

	$(document).ready(function(){
	    $("#address").change(function(){
	        //alert("hello")
	        console.log($(this).val());
	        var userAddress = $(this).val();//it will fetch the value from input text
	        $.ajax({
	            url: "/LiveIn/submitpg",
	            method : "GET",
	            data:{
	                'address': userAddress
	            },
	            //dataType: 'json',
	            success: function(response_data){
	              //alert(response_data)
	              if(response_data!="")
					{
						
						$("#ajaxmsg").text(response_data)
						$("#address").val("")
						//if user still submits after warning then empty the input box
						//$("#ajaxmsg").text("")
						//member already exist bhi empty ho jayega						
					}
	              else{
	            	  $("#ajaxmsg").text("")
	              }
	            }          
	        });
	    });
	})
	</script>
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
	if(message!=null){ 
	%>
	<div class="alert alert-primary" role="alert">
  	 <%=message %>
	</div>
<%}}%>




<section class="submit">
        <h1 style="text-align: center;margin: 0 0 36px 0;">Submit Hostel details</h1>
        <form method="post" action="/LiveIn/submitpg">
        <div class="submit-box box2">
            <div class="submit-box-box1">
                <label>Owner Full Name</label>
                <input type="text" name="fullname" id="" placeholder="e.g., Mashii Oberoy" required>
            </div>
            <div class="submit-box-box1">
                <label>Owner Email</label>
				<input type="text" name="email" id="" placeholder="e.g., ashi31@gmail.com" required>
            </div>
            <div class="submit-box-box1">
                <label>Owner Phone Number</label>
                <input type="number" name="phone" id="" placeholder="e.g., 7991530307" required>
            </div>
        </div>
        
        <div class="submit-box box2">
            <div class="submit-box-box1">
                <label>Accomodation For</label>
                <select name="selectAccomodation" for="value" required>
                    <option selected>Select an option</option>
                    <option value="boys">Boys</option>
                    <option value="girls">Girls</option>
                    <option value="both">Both</option>
                </select>
            </div>
            <div class="submit-box-box1">
                <label>Suitable For</label>
                <select name="selectSuitable" for="value" required>
                    <option selected>Select an option</option>
                    <option value="students">Students</option>
                    <option value="working professionals">Working Professionals</option>
                    <option value="both">Both(Students and Professionals)</option>
                </select>
            </div>
            <div class="submit-box-box1">
                <label>Price (in INR)</label>
                <input type="number" name="price" id="" placeholder="amount in rupees" required>
            </div>
        </div>
        <div class="submit-box">
            <label>Hostel Title/Name</label>
            <input type="text" name="title" id="" placeholder="Enter Hostel title" required>
        </div>
        <div class="submit-box">
            <label>Hostel Description</label>
            <textarea name="description" rows="3" placeholder="Enter Hostel description here" required></textarea>
        </div>
        <div class="submit-box">
            <label>Choose Image</label>
            <input type="file" name="image" id="" required>
        </div>
        <div class="submit-box box2">
            <div class="submit-box-box1">
                <label>City</label>
                <select name="selectCity" for="value" required>
                    <option selected>Select City</option>
                    <option value="lucknow">Lucknow</option>
                    <option value="kanpur">Kanpur</option>
                    <option value="banaras">Banaras</option>
                </select>
            </div>
            <div class="submit-box-box1">
                <label>Locality</label>
                <input type="text" name="selectLocality" id="" placeholder="Your Locality" required>
                <!-- <select name="selectLocality" for="value">
                    <option selected>Select Locality</option>
                     <option value="1">Option 1</option>
                    <option value="2">Option 2</option>
                    <option value="3">Option 3</option> 
                </select> -->
            </div>
            <div class="submit-box-box1">
                <label>Address</label>
                <input type="text" name="address" id="address" placeholder="Type your Address here" required>
            	<span id="ajaxmsg" style="color: red"></span>
            </div>
        </div>
        <div class="submit-box box3">
            <button type="reset">Reset</button>
            <button type="submit">Submit</button>
        </div>
        </form>
    </section>
    
    
    
    



<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->
  

<%@include file="/common/commonJS.html" %>
</body>
</html>