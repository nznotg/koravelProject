<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

	<!-- 좋아요 ajax -->
	<script src="../resources/js/recoForBoard.js"></script>
	
	<!-- PopUP / AJAX -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.13.0/jquery-ui.js" ></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="../resources/css/boardStyle.css">
	
	<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<style>
main{
	overflow:auto;
	max-width:1280px;
	min-width:1000px;
	height:900px;
	margin:auto;
	background-image: url( "../resources/images/Board/boardBackground.png" );
	background-repeat : no-repeat;
    background-size : cover;
}

input {
	border-radius: 40px 40px 40px 40px/40px 40px 40px 40px;
}

button {
	border-radius: 40px 40px 40px 40px/40px 40px 40px 40px;
}

select {
	border-radius: 40px 40px 40px 40px/40px 40px 40px 40px;
}

td a {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 160px;
		height: 30px;
		display: block;
	}


</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
		String usrID = null;
		if(session.getAttribute("usrID") != null){
		usrID = (String)session.getAttribute("usrID");
	}
	%>
	
	<!-- header -->
	<header style="min-width:1280px; height:200px; margin:auto; background-color: black; ">
		<div id="intro_bg">
			<div class="header">
				<ul class="nav">
					<div class="home">
						<div>
							<a href="#header"><img class="HFimg" src="../resources/images/koravel.png"></a>
						</div>
					</div>
					<li>
						<input type="search" class="searchbar" placeholder="당신이 가고 싶은 여행지는?">
						<span>검색</span>
					</li>	
					<li><a href="usr/usrLogin.do">로그인</a></li>
					<li><a href="usr/usrJoin.do">회원가입</a></li>
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
	</header>

	<!-- 게시판 메인 페이지 영역 시작 -->
	
<main>
	<div>
	
		<div class="row">
			<br/>
		</div>
		
		<div class="row">
			<div class="col-1">
			</div>
			<div class="col-3">
				<c:choose>
					<c:when test="${board.boardCat == 'free'}"><h3 id="titleTD">✏ 자유 게시판</h3></c:when>
					<c:when test="${board.boardCat == 'region'}"><h3 id="titleTD">🚢  관광지 추천</h3></c:when>
					<c:when test="${board.boardCat == 'course'}"><h3 id="titleTD">🏃 코스 추천</h3></c:when>
				</c:choose>
			</div>
		</div>
		
		<div class="row">
			<br/>
		</div>

		<div class="row">
			<div class="col-1"></div>
			<div class="col-1 numTD">${board.boardIdx}</div>
			<div class="col-6" id="titleTD">${board.boardTitle }</div>
			<div class="col-1 numTD">조회수</div>
			<div class="col-1 numTD">추천수</div>
			<div class="col-2"></div>
		</div>
		<div class="row" id="recoForReload">
			<div class="col-1"></div>
			<div class="col-7">
				<input type="hidden" id='searchRecoIdx' name="searchRecoIdx" value='${board.boardIdx}'>
				<input type="hidden" id=readerID name="readerID" value='${board.readerID}'>
				<input type="hidden" id='checkRecoTF' name="checkRecoTF" value='${board.checkRecoTF}'>
			</div>
			<div class="col-1 numTD" id="boardViewCount">${board.boardViewCount}</div>
			<div class="col-1 numTD" id="boardReco">${board.boardReco}</div>
			
			
			<c:choose>
			    <c:when test="${board.readerID ne null}">
			    	<c:choose>
			    		<c:when test="${recoTF ne 0}">
			    			<div class="col-1">
			    				<a href='javascript: like_func();'><img src='../resources/images/reco/like.PNG' id='like_img'></a>
			    			</div>
			    		</c:when>
			    		<c:otherwise>
			    			<div class="col-1">
			    				<a href='javascript: like_func();'><img src='../resources/images/reco/dislike.PNG' id='like_img'></a>
			    			</div>
			    		</c:otherwise>
			    	</c:choose>
			    </c:when>
			    <c:otherwise>
			    	<a href='javascript: login_need();'><img src='../resources/images/reco/dislike.PNG'></a>
			    </c:otherwise>
			</c:choose>
			<div class="col-1"></div>
		</div>
		
		<div class="row">
			<br/>
		</div>
		
		<div class="row">
			<div class="col-1"></div>
			<div class="col-8">${board.boardKeyword }</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row">
			<br/>
		</div>
		
		<div class="row" id="boardContent">
			<c:choose >
				<c:when test="${board.boardCat == 'region'}"> 
					<div class="col-12 row" id="regionBoard">
						<div class="col-1"></div>
						
						<div class="col-6 h-100" >
							<textarea class="col-12 h-100 contentBox" readonly name="boardContent1" id="boardContent1">${board.boardContent1}</textarea>
						</div>
						<div class="col-4 h-100">
							<div style="margin:auto" id="usrFotoZone">
								<div class="row">
									<input type="text" readonly class="col-12" name="boardRegionSelect" id="boardRegionSelect" value="${board.boardRegion }">
								</div>
								<div class="row"><br/></div>
								<img src='../resources/upload/${board.b_realfname}' width='400' height='400'>
							</div>
						</div>
						
						<div class="col-1"></div>
					</div>
				</c:when>
				
				
				<c:when test="${board.boardCat == 'course'}"> 
					<div class="col-12 row" id="courseBoard">
						<div class="col-1"></div>
						
						<textarea class="col-6 h-100 contentBox" readonly name="boardContent1" id="boardContent1">${board.boardContent1}</textarea>
						<div class="col-4 h-100">
							<div id="itemBoxWrap">
								<c:forEach items="${boardCourse}" var="course" varStatus="status">
									<div class='itemBox'>
						                <div class='row' style='float:center;'>
							                <div class='col-1'></div>
							                <span class='itemNum col-1' >${status.count}</span>
							                <div class="col-9"><a href="region/detailRegion.do?regionIdx=${course.regionIdx}">
														${course.regionName }</a></div>
							                
						                </div>
					                </div>
								</c:forEach>
							</div>
						</div>
						<div class="col-1"></div>
					</div>	
				</c:when>
				
				
				<c:when test="${board.boardCat != 'course' && board.boardCat != 'region'}">
					<div class="col-12 row" id="freeBoard">
						<div class="col-1"></div>
						<div class="col-10 h-100" >
							<textarea readonly class="w-100 h-100 contentBox" name="boardContent1" id="boardContent1">${board.boardContent1}</textarea>
						</div>
						<div class="col-1"></div>
					</div>
				</c:when>
			</c:choose>
		</div>
		
		<div class="row">
			<br/>
		</div>

		<div class="row">
			<div class="col-1"></div>
			<div class="col-1">
				<button class="button" onclick='location.href="getBoardList.do"'>글목록</button>
			</div>
			<div class="col-1">
				<button class="button" onclick='location.href="insertBoard.do"'>새글 쓰기</button>
			</div>
			<div class="col-5"></div>
			<%-- <c:if <%=usrID%>==${board.Writer}> --%>
			<div class="col-4 row">
				<div class="col-2"></div>
				<div class="col-3">
					<button class="button" onclick='location.href="updatePage.do?boardIdx=${board.boardIdx}"'>수정</button>
				</div>
				<div class="col-3">
					<button class="button" onclick='location.href="deleteBoard.do?boardIdx=${board.boardIdx}"'>삭제</button>
				</div>
				<div class="col-4"></div>
			</div>
			<%-- </c:if> --%>
		</div>
	
	</div>
	</main>
	<!-- 게시판 메인 페이지 영역 끝 -->
	
	<!-- footer -->
	
	<footer>
		<div class="footer_wrap">
			<img src="../resources/images/koravel.png"><br><br>
			  상호명 : Koravel<br>
			  주소 : 서울시 금천구 가산동 426-5 월드메르디앙 2차 413호<br>
			TEL : 02-AAA-BBBB<br>
			Copyright© 2021 Koravel, All Right Reserved.<br>
			<ul class="footer_ul">
			    <li id ="introduce">Koravel 소개 </li><p>|</p>
			    <li id="agreements">이용 약관 </li><p>|</p>
			    <li id="policy">개인정보 처리방침</li>
			</ul>
		</div>
	</footer>
	
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->
</body>
</html>