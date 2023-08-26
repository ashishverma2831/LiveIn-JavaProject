<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
<%@include file="/common/commonCSS.html" %>     

<link rel="stylesheet" href="/LiveIn/css/style.css">
<link rel="stylesheet" href="/LiveIn/css/footer_common.css">
<link rel="stylesheet" href="/LiveIn/css/aboutus.css">
</head>
<body>
<!-- nav-bar -->
<%@include file="/header/header_common.html" %>
<!-- nav-bar ends here -->


<section class="aboutus">
        <div class="aboutus-photos">
            <h1 class="aboutus-title">ABOUT US</h1>
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active" data-bs-interval="10000">
                    <img src="/LiveIn/images/hero.jpg" class="d-block w-100" alt="photo-1">
                  </div>
                  <div class="carousel-item" data-bs-interval="2000">
                    <img src="/LiveIn/images/istockphoto-1137953347-612x612.jpg" class="d-block w-100" alt="photo-2">
                  </div>
                  <div class="carousel-item">
                    <img src="/LiveIn/images/istockphoto-1191236486-612x612.jpg" class="d-block w-100" alt="photo-3">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
        </div>

        <div class="aboutus-text">
            <h1 class="aboutus-title">ABOUT US</h1>
            <p class="aboutus-p">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Recusandae possimus ratione hic modi praesentium earum, maxime libero consequuntur rem, repellat deleniti pariatur, quaerat tempora fugit dicta nesciunt soluta. Odit, laboriosam.
            Eligendi dolore dolores doloribus sed omnis explicabo magnam quos aspernatur. Adipisci sunt quod architecto at dicta. Error dolor sapiente cum accusamus ratione, suscipit alias cupiditate natus quibusdam? Labore, libero fuga!
            Quos voluptates, pariatur mollitia atque iusto provident facere eum? Excepturi optio sapiente sunt, consectetur eveniet quia totam qui modi placeat nihil, officiis expedita reprehenderit? Sed nesciunt facilis omnis tempora aut!
            Sapiente totam amet adipisci id error obcaecati itaque, magnam expedita inventore quae impedit facere quo doloremque non labore vitae. Nemo tempore facilis amet sed fugit praesentium totam nisi deleniti doloribus.
            </p>
            <p class="aboutus-p">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Exercitationem sunt in quae ipsum, rem numquam molestias totam tempore eius? Ipsam consectetur ducimus, voluptatum explicabo officiis rerum molestiae aperiam possimus laborum.</p>
        </div>
    </section>


<!-- footer -->
<%@include file="/footer/footer_common.html" %>
<!-- footer ends here -->
  

<%@include file="/common/commonJS.html" %>
</body>
</html>