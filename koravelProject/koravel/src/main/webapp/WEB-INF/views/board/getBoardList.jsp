<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="com.koravel.domain.BoardVO" %>

<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<link rel="stylesheet" href="../resources/css/boardStyle.css">

<title></title>

</head>
<body>

	<!-- header -->
	<header>
		<div class="row">
			
			<div class="col-2" id="headerInner">
				<img class="HFimg" src="../resources/images/koravel.png">
			</div>
			
			<div class="col-1"></div>
			
			<form class="col-4 row" name="search" id="headerInner" align="right" method = "get" action ="search/searchRegion.do" onsubmit="return keyword_check()">
				<div class="col-8" id="searchBarBox">
					<input type="text" class="searchbar" placeholder="당신이 가고 싶은 여행지는?" name="searchKeyword">
				</div>
				<div class="col-4" id="searchBarBox">
					<input type="submit" value="search" class="search">
				</div>
			</form>
			<c:if test="${empty usrNick }">
				<div class="col-4 row">
					<div class="col-6"></div>
					<div class="col-3" id="headerInner">
						<a href="usr/usrLogin.do">로그인</a>
					</div>
					<div class="col-3" id="headerInner">
						<a href="usr/usrJoin.do">회원가입</a>
					</div>
				</div>
				
			</c:if>
			<c:if test="${! empty usrNick }">
				<div class="col-4 row">
					<div class="col-5" id="headerInner">
						<a href="usr/usrLogin.do">${usrNick.getUsrNick() }님 반갑습니다</a>
					</div>
					<div class="col-3" id="headerInner">
						<a href="usr/usrLogout.do">로그아웃</a>
					</div>
					<div class="col-4" id="headerInner">
						<a href="myPage/myPage.do">마이페이지</a>
					</div>
				</div>
				
			</c:if>
			<div class="col-1"></div>
		</div>
	</header>


	<!-- 게시판 메인 페이지 영역 시작 -->
	
	<main>
	
	<div style="max-width:1000px; margin:auto;">
	
		<div class="row">
			<br/>
		</div>
		
		<div class="row">
			<c:choose>
				<c:when test="${boardList[0].boardCat == 'free' && boardList[2].boardCat == 'free' && boardList[4].boardCat == 'free'}"><h3 class="col-3" id="titleTD">✏ 자유 게시판</h3></c:when>
				<c:when test="${boardList[0].boardCat == 'region' && boardList[2].boardCat == 'region' && boardList[4].boardCat == 'region' }"><h3 class="col-3" id="titleTD">🚢  관광지 추천</h3></c:when>
				<c:when test="${boardList[0].boardCat == 'course' && boardList[2].boardCat == 'course' && boardList[4].boardCat == 'course' }"><h3 class="col-3" id="titleTD">🏃 코스 추천</h3></c:when>
				<c:otherwise><mark class="col-3">전체 게시판</mark></c:otherwise>
			</c:choose>
			<div class="col-6"></div>
			<button class="col-2 button" onclick='location.href="insertBoard.do"'><span id="write">글쓰기</span></button>
		</div>
		
		<div class="row">
			<br/>
		</div>
		
		<div class="row">

			<div class="col-6"><br/></div>
			<div class="col-6" style="text-align:right">
			<div class="row">
				<form class="col-3" action="getBoardList.do" method='post' enctype="multipart/form-data">
					<input type="hidden" name="boardCatP" value="total"/>
					<input type="submit" style="width: 100px;" class="cateChangeB" id="navB" value="best"/>
				</form>
				<form class="col-3" action="getBoardList.do" method='post' enctype="multipart/form-data">
					<input type="hidden" name="boardCatP" value="free"/>
					<input type="submit" style="width: 100px;" class="cateChangeB" id="navF" value="자유게시판"/>
				</form>
				<form class="col-3" action="getBoardList.do" method='post' enctype="multipart/form-data">
					<input type="hidden" name="boardCatP" value="region"/>
					<input type="submit" style="width: 100px;" class="cateChangeB" id="navR" value="관광지추천"/>
				</form>
				<form class="col-3" action="getBoardList.do" method='post' enctype="multipart/form-data">
					<input type="hidden" name="boardCatP" value="course"/>
					<input type="submit" style="width: 100px;" class="cateChangeB" id="navC" value="코스추천"/>
				</form>
			</div>
			</div>
		</div>
		
		<div class="row"><br/></div>
		
		<div class="row">
			<div class="col-2">
				<c:if test="${pageNum > 0}">
					<form action="getBoardList.do" method='post' enctype="multipart/form-data">
						<input type="hidden" name="boardCatP" value="${boardCatNow}">
						<input type="hidden" name="pageSet" value="prePage">
						<input type="submit" class="changePage" value="◀ 이전">
					</form>
				</c:if>
			</div>
			
			<div class="col-8"></div>
			
			<div class="col-2" >
				<form action="getBoardList.do" method='post' enctype="multipart/form-data">
					<input type="hidden" name="boardCatP" value="${boardCatNow}">
					<input type="hidden" name="pageSet" value="nextPage">
					<input type="submit" class="changePage" style="float:right;" value="다음 ▶">
				</form>
			</div>
		</div>
		
		<div class="row">
			<br/>
		</div>

		<div style="background-color: white; min-height:540px;">
			<table>
				<tr>
					<th class="col-1" align="center">글 번호</th>
					<th class="col-3" align="center">제목</th>
					<th class="col-1" align="center">작성자</th>
					<th class="col-3" align="center">작성일</th>
					<th class="col-1" align="center">추천수</th>
					<th class="col-1" align="center">조회수</th>
					<!-- 파일 -->
					<th class="col-2" align="center">파일용량</th>
				</tr>
				
				<!-- 1. ajax 구현으로 더보기 클릭 시 하단 출력으로 구현(동적쿼리로 F~E번째 리스트 출력으로 구현) -->
				<!-- 2. 게시판 페이지 넘버 클릭으로 동적쿼리 구현 -->
				<c:forEach items="${boardList}" var="board">
					<tr id="boardListTable">
						<td class="col-1">${board.boardIdx }</td>
						<td class="col-3" align="left"><a href="getBoard.do?boardIdx=${board.boardIdx}">
														${board.boardTitle }</a></td>
						<td class="col-1">${board.boardWriter }</td>
						<td class="col-3">${board.boardDate }</td>
						<td class="col-1">${board.boardReco }</td>
						<td class="col-1">${board.boardViewCount }</td>
						
					<!-- 파일 -->
						<td class="col-2">
						<c:choose>
					    <c:when test="${board.b_fsize==0}">첨부파일 없음</c:when>
					    <c:otherwise>
					    		<img src='resources/images/disk.gif'>${board.b_fsize}byte
					    </c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="row">
			<br/>
		</div>
	
		<div class="row">
			<div class="col-3"></div>
			<div class="col-1">
				<select name="selectSearch" id="selectSearch">
					<option value="1" selected>전체</option>
					<option value="boardName">글제목</option>
					<option value="regionName">관광지</option>
					<option value="boardWriter">작성자</option>
				</select>
			</div>
			<input type="text" class="col-4" name="searchWord" id="searchWord">
			<div class="col-2">
				<button class="button" onclick='location.href="getBoardList.do"'><span id="write">검색</span></button>
			</div>
			<div class="col-2">
				<br/>
			</div>
		</div>
		
	</div>
	
	
	</main>
	<!-- 게시판 메인 페이지 영역 끝 -->
	
	<!-- footer -->
	
	<footer>
		<div class="footer_wrap">
			<img class="HFimg" src="../resources/images/koravel.png"><br><br>
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
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->
    
</body>
</html>