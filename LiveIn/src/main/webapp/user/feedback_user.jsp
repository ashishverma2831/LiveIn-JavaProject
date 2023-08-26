<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
<%@include file="/common/commonCSS.html" %>
<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<link rel="stylesheet" href="/LiveIn/css/feedback.css" />
<style type="text/css">
.alert-primary{
	border-radius:0
}
</style>

</head>
<body>

<!-- nav-bar -->
<%@include file="/header/header_user.html" %>
<!-- nav-bar ends here -->

<% String message = (String)request.getAttribute("msg");
	if(message!=null){ %>
		<div class="alert alert-primary" role="alert">
  		<%=message %>
		</div>
<%}%>
<div class="feedback-form">
	<form method="post" action="/LiveIn/feedbacks">
	<!-- name -->
	<div class="head mb-5">Feedback</div>
	<div class="input-group mb-3">
    	<span class="input-group-text" for="name" id="userId"><i class="fas fa-user-alt"></i></span>
    	<input type="text" class="form-control" name="txtname" placeholder="Username" aria-label="Username" aria-describedby="userId" required>
	</div>
  
 	<!--  email -->
	<div class="input-group mb-3">
    	<span class="input-group-text" for="name" id="userEmail"><i class="fa fa-envelope"></i></span>
    	<input type="email" class="form-control" name="txtemail" placeholder="Email" aria-label="email" aria-describedby="userEmail" required>
	</div>

	<!-- rating -->
	<select class="form-select" name="selectoption" for="value" aria-label="Default select example" required>
 		<option selected>Give Ratings</option>
  		<option value="1">One</option>
  		<option value="2">Two</option>
  		<option value="3">Three</option>
  		<option value="4">Four</option>
  		<option value="5">Five</option>
	</select>
	
	<!-- textarea -->
	 <div class="mb-3">
    	<!-- <label for="feedback" class="form-label">Your Feedback</label> -->
    	<textarea class="form-control mt-3" name="txtfeedback" rows="4" placeholder="your feedback please" required></textarea>
  	</div>
  	
  	<!-- checkbox -->
  	 <div class="mb-3 form-check flex">
   		<input type="checkbox" name="checkbox" class="form-check-input" value="agreed" id="exampleCheck1" required checked>
    	<label class="form-check-label" for="exampleCheck1">Check me out</label>
  	</div>
  
	<!-- submit button -->
	<div class="btn">
    	<button type="submit">Submit</button>
	</div>
	</form>
</div>

<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->


<%@include file="/common/commonJS.html" %>
</body>
</html>