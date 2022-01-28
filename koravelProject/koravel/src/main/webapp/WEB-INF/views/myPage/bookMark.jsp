<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
</head>
<style>
.myBoard{
	text-align: center;
	table-layout: auto;
	width: 100%;
}
.myPageForm{
	width:1033px;
	hight:800px;
	text-align: center;
}
.koravelImg{
	margin: 30px 0 10px 0;
	width: 300px;
	height: 60px;
}
p{
	font-size: 20px;
	color: black;
	text-align: center;
}

.mark_board{
	width: 100%;
	height: 350px;
	
}
.mark_recommend{
	width: 100%;
	height: 350px;
	border: solid 1px blue;
	display: flex;
}
.BookMarkList{
	border: solid 1px black;
	width: 50%;
	
}

.RecoMap{
	border: solid 1px yellow;
	width: 50%;
}
.myKoravel{
	border: solid 1px black;
	width: 100%;
}
</style>
<body>
<%
	session.getAttribute("usrNick");
%>
</body>
<div class="myPageForm">
	<div>
		<img alt="" src="../resources/images/koravel.png" class="koravelImg">
	</div> <!-- End of KoravelImg -->
	
	<div class="mark_board">
		${usrNick.usrID }님의 북마크 게시판 리스트입니다.
		<table class="myBoard" border="1">
			<tr>
				<th>사용자</th> <!-- boardIdx -->
				<th>찜한 날짜</th> <!-- boardType -->
				<th>글 제목</th> <!-- boardTitle -->
				<th>목록</th> <!-- boardCat -->
				<th>좋아요 (추천수)</th> <!-- boardContent1 -->
				<th>조회수</th> <!-- boardDate -->
			</tr>
			<c:forEach items="${myRecoBoard }" var="list">
				<tr>
					<td>${list['readerID']}</td>
					<td>${list['recoDate']}</td>
					<td>
						<a href="board/getBoard.do?boardIdx=${list['boardIdx']}">
							${list['boardTitle']}
						</a>
					</td>
					<td>${list['boardCat']}</td>
					<td>${list['boardReco']}</td>
					<td>${list['boardViewCount']}</td>
				</tr>
			</c:forEach>
			
		</table>
	</div> <!-- End of bookMark_Board -->
</div><!-- 북마크 영역 -->
</html>