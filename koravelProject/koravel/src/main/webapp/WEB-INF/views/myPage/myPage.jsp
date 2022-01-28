<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>koravel에 오신것을 환영합니다.</title>
	<link href="../resources/css/myPage.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="../resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57e8c7c1c86eeab41199c3e3df3a8698"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#menu').hover(function(){
		$(this).css('background-color', 'skyblue');
	}, function(){
		$(this).css('background-color', '#f1f2f3');
	});
	
	
	$('#usrMyInfo').click(function(){
		$.ajax({
			type: 'GET',
			url: 'myUsrInfo.do',
			dataType: 'text',
			error: function(){
				alert('통신 실패');
			},
			success:function(data){
				$('#result').html(data);
			}
		}); //end of ajax
	}); // end of usrMyInfo
	
	$('#myBoard').on('click', function(){
		$.ajax({
			type: 'GET',
			url: 'myBoard.do',
			dataType: 'text',
			error: function(){
				alert('통신실패');
			},
			success:function(data){
				$('#result').empty();
				$('#result').html(data);
			}
		}); // end of ajax
	}); // end of myBoard
	
	$('#myBookMark').on('click', function(){
		$.ajax({
			type: 'GET',
			url: 'bookMark.do',
			dataType: 'text',
			error: function(){
				alert('통신실패');
			},
			success:function(data){
				$('#result').empty();
				$('#result').html(data);
			}
		}); // end of ajax
	}); // end of myBookMark
	
	$('#myDIY').on('click', function(){
		$.ajax({
			type: 'GET',
			url: 'bookMarkKoravel.do',
			dataType: 'text',
			error: function(){
				alert('통신실패');
			},
			success:function(data){
				$('#result').empty();
				$('#result').html(data);
			}
		}); // end of ajax
	}); // end of myBookMark
	
	$('#myAlam').on('click', function(){
		$.ajax({
			type: 'GET',
			url: 'noticeService.do',
			dataType: 'text',
			error: function(){
				alert('통신실패');
			},
			success:function(data){
				$('#result').empty();
				$('#result').html(data);
			}
		}); // end of ajax
	}); // end of myBookMark
	
	 get_rate();
	
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
}); //end of document.ready
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Jua', sans-serif;
	}
</style>
</head>
<body>
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
							<li><a href="../usr/usrLogout.do">${usrNick.usrNick }님 로그아웃</a></li>
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
            
     <div class="main_text0">
		<h1>MyPage</h1>
		<div class="contents1" style="color: black">
			내 개인정보, 마이게시판, DIY(나만의코스) 등 사용자의 정보를 각 카테고리별로 확인하실 수 있습니다.
		</div>
		<div class="category_container">
			<div class="category_cate">
				<div class="menu">
					<button id="usrMyInfo" onclick="usrMyInfo.do?usrID=${usrNick.usrID}">My 정보</button>
				</div>
				<div class="menu">
					<button id="myBoard" onclick="myBoard.do?boardWriter=${usrNick.usrID}">마이게시판</button>
					<%-- <a href="myBoard.do?boardWriter=${usrNick.usrID}">마이 게시판</a> --%>
				</div>
				<div class="menu">
					<button id="myDIY"onclick="bookMarkKoravel.do?usrID=${usrNick.usrID}">DIY코스</button>
				</div>
				<div class="menu">
					<button id="myAlam"onclick="myAlam.do?usrID=${usrNick.usrID}">알림</button>
				</div>
				<div class="menu">
					<button id="myBookMark"onclick="bookMark.do?usrID=${usrNick.usrID}">북마크</button>
				</div>
			</div>
			<div class="category_view">
				<div id="result">
					
				</div>
			</div>
		</div>
		</div> <!-- amount End -->
		
		
	
	
	
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
<script>
function getSearchList(){
	$.ajax({
		type: 'GET',
		url: '/getSearchList',
		data: $("form[name=search-form]").serialize(),
		success: function(result){
			$('#myBoard > tbody').empty();
				if(result.length >= 1){
					result.forEach(function(list){
						str = '<tr>'
						str += "<td>" + list.boardIdx + "</td>";
						str += "<td>" + list.boardType + "</td>";
						str += "<td><label><a href='board/getBoard.do?boardIdx=" + list.boardIdx + "'>" + list.boardTitle + "</a></label></td>";
						str += "<td>" + list.boardCat + "</td>";
						str += "<td>" + list.boardContent1 + "</td>";
						str += "<td>" + list.boardDate + "</td>";
						str += "<td>" + list.boardReco + "</td>";
						str += "<td>" + list.boardViewCount + "</td>";
						str += "<td><button class='delete' onclick='location.href=deleteMyBoard.do?boardIdx=" + list.boardIdx + "'>삭제하기!</button></td>";
						str += "</tr>";
						$('#myBoard').append(str);
					})// end of result.forEach
				} // end of if(result.length)
		}, // end of success
		error: function(){
			alert('검색에 실패하였습니다.');				
		}
	}); // End of ajax
}; // End of getSearchList
</script>
</body>
</html>