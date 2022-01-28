<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/searchBoard.css">
<script>
		function list(page){
			location.href="getSearchList.do?curPage=" + page + "&searchType=${map.searchType}" + "&searchName=${map.searchName}"; 
		}
</script>
</head>
<body>
<%
	session.getAttribute("usrNick");
%>
	<div class="myPageForm">
		<div class="ImgForm">
			<img alt="" src="../resources/images/koravel.png" class="koravelImg">
		</div> <!-- End of KoravelImg -->
	<p class="info">${usrNick.usrID }님이 작성하신 게시판 리스트입니다.<br/>
	본인이 작성한 것 외의 다른 게시판을 보고싶으시다면 검색을 이용해주세요^^</p>
	<form class="navbar-form" name="search-form" action="getSearchList.do">
		<div class="input-group">
			<div class="searchList">
				
				<select name="searchType" class="search-form">
					<option value="title" <c:out value="${map.searchType == 'title'?'selected':''}"/>> 제목 </option>
					<option value="Date" <c:out value="${map.searchType == 'Date'?'selected':''}"/>> 날짜 </option>
					<option value="list" <c:out value="${map.searchType == 'list'?'selected':''}"/>> 목록 </option>
					<option value="cate" <c:out value="${map.searchType == 'cate'?'selected':''}"/>> 분류 </option>
					<option value="all" <c:out value="${map.searchType == 'all'?'selected':''}"/>> 전체 </option>			
				</select>
				
				<input type="text" class="search-box" placeholder="검색어를 입력해주세요" name="searchName" value="${map.searchName}">
				<input type="submit" class="search-submit" value="검색"/>
				
			</div>
		</div>
	</form>
	
	${map.count }개의 검색 결과가 있습니다.
	<div style="height:300px;" id="myBoardList">
		<table class="myBoard" border="1">
			<tr>
				<th>번호</th> <!-- boardIdx -->
				<th>분류</th> <!-- boardType -->
				<th>제목</th> <!-- boardTitle -->
				<th>목록</th> <!-- boardCat -->
				<th>본문</th> <!-- boardContent1 -->
				<th>작성일자</th> <!-- boardDate -->
				<th>추천수</th> <!-- boardReco -->
				<th>조회수</th> <!-- boardViewCount -->
				<th>삭제하기</th>
			</tr>
			<c:forEach items="${map.list }" var="list">
				<tbody>
					<tr>
						<td>${list.boardIdx }</td>
						<td>${list.boardType }</td>
						<td>
							<label>
								<a href="board/getBoard.do?boardIdx=${list.boardIdx}">
									${list.boardTitle }
								</a>
							</label>
						</td>
						<td>${list.boardCat }</td>
						<td>${list.boardContent1 }</td>
						<td>${list.boardDate }</td>
						<td>${list.boardReco }</td>
						<td>${list.boardViewCount }</td>
						<c:if test="${list.boardWriter eq usrNick.usrID }">
							<td>
								<button class="delete" onclick='location.href="deleteMyBoard.do?boardIdx=${list.boardIdx}"'>
									삭제하기!
								</button>
							</td>
						</c:if>
					</tr>
				</tbody>
			</c:forEach> <!-- End of myBoardList.myBoardList -->
					<tr>
						<td colspan="8">
							<c:if test="${map.boardpage.curBlock > 1}">
								<a href="javascript:list('1')">[처음]</a>
							</c:if>
							
							<c:if test="${map.boardpage.curBlock > 1}">
								<a href="javascript:list('${map.boardpage.prevPage}')">[이전]</a>
							</c:if>
							
							<c:forEach var="num" begin="${map.boardpage.blockStart}" end="${map.boardpage.blockEnd }">
								
								<c:choose>
									<c:when test="${num == map.boardPager.curPage }">
										<span style="color: red">${num}</span>&nbsp;
									</c:when>
									
									<c:otherwise>
										<a href="javascript:list('${num}')">${num}</a>&nbsp;
									</c:otherwise>
								</c:choose>
							
							</c:forEach>
							
							<c:if test="${map.boardpage.curBlock <= map.boardPager.totalBlock }">
								<a href="javascript:list('${map.boardpage.nextPage}')">[다음]</a>
							</c:if>
							
							<c:if test="${map.boardpage.curPage <= map.boardPager.totalPage }">
								<a href="javascript:list('${map.boardpage.totalPage}')">[끝]</a>
							</c:if>
							
						</td>
					</tr>
		</table> <!-- End of myBoardList Table -->
		</div> <!-- End of scroll -->
	</div> <!-- End of myPage form -->

</body>
</html>