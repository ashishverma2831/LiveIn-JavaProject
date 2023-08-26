<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-Up</title>
<%@include file="/common/commonCSS.html" %>
<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<link rel="stylesheet" href="/LiveIn/css/sign_up.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
	integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style type="text/css">
.alert-primary{
	border-radius:0
}
</style>
<script>
	

	$(document).ready(function(){
	    $("#email").change(function(){
	        //alert("hello")
	        console.log($(this).val());
	        var userEmail = $(this).val();//it will fetch the value from input text
	        $.ajax({
	            url: "/LiveIn/signup",
	            method : "GET",
	            data:{
	                'email': userEmail
	            },
	            //dataType: 'json',
	            success: function(response_data){
	              //alert(response_data)
	              if(response_data!="")
					{
						
						$("#ajaxmsg").text(response_data)
						$("#email").val("")
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
<%@include file="/header/header_common.html" %>
<!-- nav-bar ends here -->

<% String message = (String)request.getAttribute("msg");
	if(message!=null){ %>
		<div class="alert alert-primary" role="alert">
  		<%=message %>
		</div>
<%}%>

<div class="registration-container">
        <h2>Create an Account</h2>
        <form id="registration-form" class="registration-form" method="post" action="/LiveIn/signup">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter email" required>
            <span id="ajaxmsg" style="color: red"></span>
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter phone" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>
            <label for="confirm-password">Confirm Password:</label>
            <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm password" required>
            <button type="submit">Register</button>
        </form>
        <h6 style="padding:4px 28px;margin-top:8px">already have an account?<a style="text-decoration:none" href="/LiveIn/user/user_login.jsp"> Login now</a></h6>
    </div>
    
    <!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->


<%@include file="/common/commonJS.html" %>
</body>
</html>