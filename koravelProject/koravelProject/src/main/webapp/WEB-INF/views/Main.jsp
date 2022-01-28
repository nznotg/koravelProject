<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="no-cache">
<title>국내 최강 여행 전문 플랫폼, KORAVEL</title>
<link href="../resources/css/style.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- slick slider  -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script type="text/javascript" src="../resources/js/main.js" defer></script>
    <script type="text/javascript" src="../resources/js/ex.js" defer></script>
<style>
	*{
		font-family: 'Jua', sans-serif;
	}
</style>
</head>
<body>
<script>
$(document).ready(function() {
    get_rate();
 
})

function get_rate() {
    $.ajax({
        type: "GET",
        url : "../currency.jsp",
        data : {},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        success: function(response) {	      
       	eval(response) // 스트링을 코드로 만들어줘서 객체로 활용
       	let ranNum = Math.floor(Math.random() * 10) +1;
		let rate = exView.리스트[ranNum].통화명
        let now_rate = exView.리스트[ranNum].매매기준율;
      $('#rate').text(rate);
      $('#now-rate').text(now_rate);
        }
    })
}
(function(){
	var w = window;
	if (w.ChannelIO) {
	  return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	}
	var ch = function() {
	  ch.c(arguments);
	};
	ch.q = [];
	ch.c = function(args) {
	  ch.q.push(args);
	};
	w.ChannelIO = ch;
	function l() {
	  if (w.ChannelIOInitialized) {
	    return;
	  }
	  w.ChannelIOInitialized = true;
	  var s = document.createElement('script');
	  s.type = 'text/javascript';
	  s.async = true;
	  s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
	  s.charset = 'UTF-8';
	  var x = document.getElementsByTagName('script')[0];
	  x.parentNode.insertBefore(s, x);
	}
	if (document.readyState === 'complete') {
	  l();
	} else if (window.attachEvent) {
	  window.attachEvent('onload', l);
	} else {
	  window.addEventListener('DOMContentLoaded', l, false);
	  window.addEventListener('load', l, false);
	}
	})();
	ChannelIO('boot', {
	"pluginKey": "f8d38dd3-5fce-4786-bd3e-461970ec4f97"
	
})
</script>
<%
	session.getAttribute("usrNick");
%>
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
			<ul class="nav">
				<div class="home">
					<div>
						<a href="#header"><img src="../resources/images/koravel.png"></a>
					</div>
				</div>
				
					<li>
						<input type="search" class="searchbar" placeholder="당신이 가고 싶은 여행지는?">
						<span>검색</span>
					</li>
					<c:if test="${empty usrNick }">
							<li><a href="../usr/usrLogin.do">로그인</a></li>
							<li><a href="../usrJoin.do">회원가입</a></li>
							<li>
								<img src="../resources/images/currency-exchange.svg" class="currency">  
							    <span id="rate">국가</span> <!-- 통화명 -->
							    <span id="now-rate">?</span> <!-- 실시간 환율 -->
							</li>
							<ul id="weather">
				                <li class="icon"><img class="icon_weather" src="" ></li>
				                <li class="city"></li>
				                <li class="temp"></li>
           					</ul>
			            	<ul id="currency">
			                	<li class="curr_icon"></li>
			                	<li class="cur_unit"></li>
			                	<li class="cur_rate"></li>
			           	 	</ul>
					</c:if>
					<c:if test="${! empty usrNick }">
							<li><a href="../usr/usrLogout.do">${usrNick.getUsrNick() }님 로그아웃하기</a></li>
							<li><a href="../myPage/myPage.do">마이페이지</a></li>
							<li>
								<img src="../resources/images/currency-exchange.svg" class="currency">  
							    <span id="rate">국가</span> <!-- 통화명 -->
							    <span id="now-rate">?</span> <!-- 실시간 환율 -->
							</li>
							
							<ul id="weather">
				                <li class="icon"><img class="icon_weather" src="" ></li>
				                <li class="city"></li>
				                <li class="temp"></li>
           					</ul>
			            	<ul id="currency">
			                	<li class="curr_icon"></li>
			                	<li class="cur_unit"></li>
			                	<li class="cur_rate"></li>
			            	</ul>
					</c:if>
				</ul>
		</div>
		</div>
	</div> <!-- intro End // class="wrap" end-->
	<div>
	   <ul class="amount">
                <li>
                    <div>
                        <a href="../region/recommand.do">
                            <div><img src="../resources/images/main/sticky-notes.png"></div>
                            <div class="contents1"><b>맞춤추천</b></div>
                        
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href="../festival/festival.do">
                            <div><img src="../resources/images/main/festival.png"></div>
                            <div class="contents1"><b>지역행사</b></div>
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href="../board/getBoardMain.do">
                            <div><img src="../resources/images/main/community.png"></div>
                            <div class="contents1"><b>커뮤니티</b></div>
                        </a>
                    </div>
                </li>
                <li>
                    <div>
                        <a href="../main/tip.do">
                            <div><img src="../resources/images/main/light-bulb.png"></div>
                            <div class="contents1"><b>Tip</b></div>
                        </a>
                    </div>
                </li>
            </ul>
	</div> <!-- amount End -->
	
	<div class="main_text0">
            <div class="page-wrapper"> <!-- style="position:relative"; -->
                    <!--page slider -->
                    <div class="post-slider">
                    	<br>
                        <h1 class="slider-title">실시간 Hot 여행지</h1>
                        
                        <div class="post-wrapper">
                            
                                <div class="post">
                                    <a href="#">
                                        <img src="../resources/images/main/myeongdong.jpg" class="slider-image">
                                        <div class="post-info">
                                            <h2>SEOUL</h2>
                                            <p>Asia,Korea[서울]</p>
                                        </div>
                                    </a>
                                </div>
                            

                            <div class="post">
                                <a href="#">
                                    <img src="../resources/images/main/jeju1.jpg" class="slider-image">
                                    <div class="post-info">
                                        <h2>JEJU</h2>
                                        <p>Asia,Korea[제주]</p>
                                    </div>
                                </a>
                            </div>

                            <div class="post">
                                <a href="#">
                                    <img src="../resources/images/main/busan1.jpg" class="slider-image">
                                    <div class="post-info">
                                        <h2>BUSAN</h2>
                                        <p>Asia,Korea[부산]</p>
                                    </div>
                                </a>
                            </div>

                            <div class="post">
                                <a href="#">
                                    <img src="../resources/images/main/gangwon.jpg" class="slider-image">
                                    <div class="post-info">
                                        <h2>Gangwon-do</h2>
                                        <p>Asia,Korea[강원도]</p>
                                    </div>
                                </a>
                            </div>

                            <div class="post">
                                <a href="#">
                                    <img src="../resources/images/main/hwaseong.jpg" class="slider-image">
                                    <div class="post-info">
                                        <h2>Gyeonggi-do</h2>
                                        <p>Asia,Korea[경기도]</p>
                                    </div>
                                </a>
                            </div>

                            <div class="post">
                                <a href="#">
                                    <img src="../resources/images/main/boeun.jpg" class="slider-image">
                                    <div class="post-info">
                                        <h2>Chungcheong-do</h2>
                                        <p>Asia,Korea[충청도]</p>
                                    </div>
                                </a>
                            </div>
                            
                            <div class="post">
                                <a href="#">
                                    <img src="../resources/images/main/namhae.jpg" class="slider-image">
                                    <div class="post-info">
                                        <h2>Gyeongsang-do</h2>
                                        <p>Asia,Korea[경상도]</p>
                                    </div>
                                </a>
                            </div> 

                            <div class="post">
                                <a href="#">
                                    <img src="../resources/images/main/jeonju.jpg" class="slider-image">
                                    <div class="post-info">
                                        <h2>Jeolla-do</h2>
                                        <p>Asia,Korea[전라도]</p>
                                    </div>
                                </a>
                            </div> 
                            
                        </div>
                    </div>
                    
                </div>
            </div> 
	 <footer>
            <div class="footer_wrap">
                <img src="../resources/images/koravel.png" style="display: block;">
               	 	상호명 : Koravel<br>
                	주소 : 서울시 금천구 가산동 426-5 월드메르디앙 2차 413호<br>
                	TEL : 02-AAA-BBBB<br>
                	Copyright© 2021 Koravel, All Right Reserved.<br>
                <ul class="footer_ul">
                    <li id ="introduce">Koravel 소개 |</li>
                    <li id="agreements">이용 약관  |</li>
                    <li id="policy">개인정보 처리방침</li>
                </ul>
            </div>
     </footer>
<script>
   const header = document.querySelector("#header");
   const backImg = document.querySelector(".intro_bg")
   const backImgHeight = backImg.getBoundingClientRect().height;
 
   // 스크롤이 배경이미지 높이를 넘어설 때, 헤더부의 배경이
   // 불투명해지게끔 하는 코드.
   window.addEventListener("scroll", () => {
      if (window.scrollY > backImgHeight) {
      		header.setAttribute("style", "background: blue;", "width: 100%;");
   	  } else {  
			header.setAttribute("style", "background: transparent;");
   	  }
});

</script>
<script type="text/javascript" src="../resources/js/weatherApi.js"></script>
</body>
</html>