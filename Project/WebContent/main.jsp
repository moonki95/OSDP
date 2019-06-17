<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>	
<%@ page import="bbs.Bbs" %>	
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>경비In</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
%>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="main.jsp">경비In</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="main.jsp">홈</a></li>
        <li><a href="#band">경비In 소개</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="bbs.jsp">공지 게시판</a></li>
            <li><a href="bbs2.jsp">자유 게시판</a></li>
            <li><a href="bbs3.jsp">민원 게시판</a></li>
            <li><a href="bbs4.jsp">장터 게시판</a></li> 
          </ul>
        </li>
        <li><a href="#tour">블라블라</a></li>
        <%
				if(userID == null){
			%>
		<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="login.jsp">로그인</a></li>
            <li><a href="join.jsp">회원가입</a></li>
          </ul>
        </li>
			<%
				}else{
			%>
		<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="logoutAction.jsp">로그아웃</a></li> 
          </ul>
        </li>
			<%
				}
			%>
		</ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="img/apart1.jpg" width="1920px" height="1080px" alt="New York" width="1200" height="700">
        <div class="carousel-caption">
          <h3>New York</h3>
          <p>The atmosphere in New York is lorem ipsum.</p>
        </div>      
      </div>

      <div class="item">
        <img src="img/apart2.jpg" alt="Chicago" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago - A night we won't forget.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="img/apart3.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>      
      </div>

      <div class="item">
        <img src="img/apart4.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The Band Section) -->
<div id="band" class="container text-center">
  <h3>경비In 소개</h3>
  <p>아파트관리 사이트입니다.</p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>강남 센트럴 아이파크</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="centralipark.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>Guitarist and Lead Vocalist</p>
        <p>Loves long walks on the beach</p>
        <p>Member since 1988</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>서초 래미안 퍼스티지</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="firstige.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>Drummer</p>
        <p>Loves drummin'</p>
        <p>Member since 1988</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>동대문 래미안 미드카운티</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="midcounty.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>Bass player</p>
        <p>Loves math</p>
        <p>Member since 2005</p>
      </div>
    </div>
  </div>
</div>

<!-- Container (TOUR Section) -->
<div id="tour" class="bg-1">

  <div class="container">
    <h3 class="text-center">이번주 분리수거</h3>
    <p class="text-center">음식물은 적당히</p>
    <ul class="list-group">
      <li class="list-group-item" onclick="alert('이미 수거가 완료되었습니다!');" onmouseover="style='background-color:gray;color:black;'" onmouseout="style='background-color:white;'">월요일 <span class="label label-danger">수거 완료!</span></li>
      <li class="list-group-item" onclick="alert('이미 수거가 완료되었습니다!');"  onmouseover="style='background-color:gray;color:black;'" onmouseout="style='background-color:white;'">수요일<span class="label label-danger">수거 완료!</span></li> 
      <li class="list-group-item" onclick="alert('수거 예정일 : 금요일\n시간 : PM03:00\n장소 : 분리수거장 앞');"  onmouseover="style='background-color:gray;color:black;'" onmouseout="style='background-color:white;'">금요일<span class="label deafult" style="background-color:green;" >수거예정</span></li> 
    </ul>
    <hr style="color:white;">
      <br>
    <h3 class="text-center">편의 시설 업체</h3>
    <p class="text-center">입주민 이라면 40% 할인</p>
    <div class="row text-center">
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="img/Cleanhouse.jpg" alt="Paris" width="400" height="300">
          <p><strong>우리 청소 업체</strong></p>
          <p>Friday 27 November 2015</p>
          <button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="img/Movement.jpg" alt="San Francisco" width="400" height="300">
          <p><strong>포장이사 전문</strong></p>
          <p>Sunday 29 November 2015</p>
          <button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="img/Secondhand.jpg" alt="New York" width="400" height="300">
          <p><strong>우리 중고 업체</strong></p>
          <p>Saturday 28 November 2015</p>
          <button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>
        </div>
      </div>
      
    </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Tickets</h4>
        </div>
        <div class="modal-body">
          <form role="form">
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-shopping-cart"></span> Tickets, $23 per person</label>
              <input type="number" class="form-control" id="psw" placeholder="How many?">
            </div>
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Send To</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
            </div>
              <button type="submit" class="btn btn-block">Pay 
                <span class="glyphicon glyphicon-ok"></span>
              </button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
          <p>Need <a href="#">help?</a></p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
  <h3 class="text-center">문의</h3>
  <p class="text-center"><em>분양문의 및 더 많은 정보</em></p>

  <div class="row">
    <div class="col-md-4">
      <p>관리소장에게 문의해보세요</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>Chicago, US</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: +00 1515151515</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p>
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <br>
      <div class="row">
        <div class="col-md-12 form-group">
          <button class="btn pull-right" type="submit">보내기</button>
        </div>
      </div>
    </div>
  </div>
            <!-- -----------------Google Map Api --------------------------------------------- -->
  <div id="map" style="width:100%; height: 500px; margin-left:auto; margin-right:auto;margin:center;"></div>
  <hr>
  
  <br>
  <h3 class="text-center">우리 아파트 연혁</h3>  
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">1975년</a></li>
    <li><a data-toggle="tab" href="#menu1">2000년</a></li>
    <li><a data-toggle="tab" href="#menu2">2019년</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h2>삼성 회장의 후원</h2>
      <p>이건희가 인정한 이시대 최고의 아파트부문 1위 수상.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h2>대규모 리모델링</h2>
      <p>대규모 아파트 리모델링 과 최신식 보안 시스템 도입.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h2>셰프가 인정한 맛집</h2>
      <p>"아파트 단지내에 이런 맛있는 식당이 있는줄 몰랐다" - Gorden rambsy </p>
    </div>
  </div>
</div>

<!-- Image of location/map -->

  
<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="main.jsp" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>Bootstrap Theme Made By <a href="https://www.w3schools.com" data-toggle="tooltip" title="Visit w3schools">www.w3schools.com</a></p> 
</footer>

<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='main.jsp']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})
</script>

<!-- ----------------------------Google Map Script---------------------------------- -->
 <script>
      function myMap() {
        var a = {
          lat: 36.624988, 
          lng: 127.451628
        };

			// The map, centered at Daejeon
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 14,
				scrollwheel : false,
				mapTypeControl : false,
				center : a
			});

			// The marker, positioned at Seoul, Cheongju, Busan
			var marker1 = new google.maps.Marker({
				position : a,
				map : map
			});
			marker1.setAnimation(google.maps.Animation.BOUNCE);
			
		}
	</script>

 <script src="WRITE YOUR KEY HERE"></script>
</body>
</html>
