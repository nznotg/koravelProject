<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	
	<!-- CSS -->
	<link rel="stylesheet" href="../resources/css/boardStyle.css">

<title></title>
</head>
<body>
	
	<!-- header -->
	<header>
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
	<div style="max-width:1000px; margin:auto;">
	
		<div class="row">
			<br/>
		</div>
		
		<div class="row">
			<br/>
		</div>

		<div class="row">
		</div>
		
		<div class="row" style="height:300px;">
		
			<div class="col-1"><br/></div>
		
			<div class="col-4" name="table">

				<table class="col-12 " style="">
					<tr>
						<th class="catTitleT" align="center">
							<form class="col-3" action="getBoardList.do" method='post' enctype="multipart/form-data">
								<input class="catbutton" type="submit" style="width: 100px;" value="BEST"/>
								<input type="hidden" name="boardCatP" value="total"/>
							</form>
						</th>
					</tr>
					<tr>
						<th align="center">제목</th>
						<th align="center">추천수</th>
						<th align="center">조회수</th>
					</tr>
					<c:forEach items="${boardList}" var="board">
						<tr name="content">
							<td align="left"><a href="getBoard.do?boardIdx=${board.boardIdx}">
															${board.boardTitle }</a></td>
							<td id="right">${board.boardReco }</td>
							<td id="right">${board.boardViewCount }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div class="col-1"></div>
			
			<div class="col-4" name="table">
				
				<table class="col-12">
					<tr>
						<th class="catTitleF" align="center">
							<form class="col-3" action="getBoardList.do" method='post' enctype="multipart/form-data">
								<input class="catbutton" type="submit" style="width: 100px;" value="FREE"/>
								<input type="hidden" name="boardCatP" value="free"/>
							</form>
						</th>
					</tr>
					<tr>
						<th align="center">제목</th>
						<th align="center">추천수</th>
						<th align="center">조회수</th>
					</tr>
					<c:forEach items="${boardListF}" var="board">
						<tr name="content">
							<td align="left"><a href="getBoard.do?boardIdx=${board.boardIdx}">
															${board.boardTitle }</a></td>
							<td id="right">${board.boardReco }</td>
							<td id="right">${board.boardViewCount }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
		</div>
		
		<div class="row">
			<br/>
		</div>
		
		<div class="row" style="height:300px;">
		
			<div class="col-1"><br/></div>
		
			<div class="col-4" name="table">
				
				<table class="col-12">
					<tr>
						<th class="catTitleR">
							<form class="col-3" action="getBoardList.do" method='post' enctype="multipart/form-data">
								<input class="catbutton" type="submit" style="width: 100px;" value="REGION"/>
								<input type="hidden" name="boardCatP" value="region"/>
							</form>
						</th>
					</tr>
					<tr>
						<th align="center">제목</th>
						<th align="center">추천수</th>
						<th align="center">조회수</th>
					</tr>
					<c:forEach items="${boardListR}" var="board">
						<tr name="content">
							<td align="left"><a href="getBoard.do?boardIdx=${board.boardIdx}">
															${board.boardTitle }</a></td>
							<td id="right">${board.boardReco }</td>
							<td id="right">${board.boardViewCount }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div class="col-1"></div>
			
			<div class="col-4" name="table">
				
				<table class="col-12">
					<tr>
						<th class="catTitleC" align="center">
							<form class="col-3" action="getBoardList.do" method='post' enctype="multipart/form-data">
								<input class="catbutton" type="submit" style="width: 100px;" value="COURSE"/>
								<input type="hidden" name="boardCatP" value="course"/>
							</form>
						</th>
					</tr>
					<tr>
						<th class="col-6" align="center">제목</th>
						<th class="col-3" align="center">추천수</th>
						<th class="col-3" align="center">조회수</th>
					</tr>
					<c:forEach items="${boardListC}" var="board">
						<tr name="content">
							<td align="left"><a href="getBoard.do?boardIdx=${board.boardIdx}">
															${board.boardTitle }</a></td>
							<td id="right">${board.boardReco }</td>
							<td id="right">${board.boardViewCount }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div class="col-1"></div>
			
		</div>
		<div class="row">
			<br/>
		</div>
	
		<div class="row">
			<div class="col-2"><br/></div>
			<select class="col-1" name="selectSearch" id="selectSearch">
				<option value="1" selected>전체</option>
				<option value="boardName">글제목</option>
				<option value="regionName">관광지</option>
				<option value="boardWriter">작성자</option>
			</select>
			<input type="text" class="col-4" name="searchWord" id="searchWord">
			<button class="col-1 button" onclick='location.href="getBoardList.do"'>검색</button>
			<div class="col-2"></div>
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