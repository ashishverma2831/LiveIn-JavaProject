<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact-Us</title>
<%@include file="/common/commonCSS.html" %>
<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<link rel="stylesheet" href="/LiveIn/css/contactus.css" />

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


<div class="contact-container">
        <h1>Contact Us</h1>
        <p>We'd love to hear from you. Please feel free to get in touch using the form below.</p>
        <form class="contact-form" method="post" action="/LiveIn/contactus">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" required>

            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="6" required></textarea>

            <button type="submit">Send Message</button>
        </form>
    </div>
	
	<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->
	
<%@include file="/common/commonJS.html" %>
</body>
</html>