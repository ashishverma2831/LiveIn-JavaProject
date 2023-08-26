<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>City Hostels</title>

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
<%@include file="/header/header_common.html" %>
<!-- nav-bar ends here -->



<div style="height:auto;display:none" id="divmembers"></div>



<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->
  

<%@include file="/common/commonJS.html" %>
</body>
</html>