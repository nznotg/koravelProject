<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/myBoard.css">
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
	
	<div style="overflow:auto; height:300px;" id="myBoardList">
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
			
			<c:if test="${!empty myBoardList }"> <!-- 내가 작성한 게시판 -->
			<c:forEach items="${myBoardList }" var="list">
				<tbody>
					<tr>
						<td>${list.boardIdx }</td>
						<td>${list.boardType }</td>
						<td>
							<label >
								<a href="board/getBoard.do?boardIdx=${list.boardIdx}" id="myBoardTitle">
									${list.boardTitle }
								</a>
							</label>
						</td>
						<td>${list.boardCat }</td>
						<td>${list.boardContent1 }</td>
						<td>${list.boardDate }</td>
						<td>${list.boardReco }</td>
						<td>${list.boardViewCount }</td>
						<td>
							<button class="delete" onclick='location.href="deleteMyBoard.do?boardIdx=${list.boardIdx}"'>
								삭제하기!
							</button>
						</td>
						<c:if test="${empty myBoardList }">
							 <td colspan="9"> 작성된 글이 없습니다. </td>
						</c:if>
					</tr>
				</tbody>
			</c:forEach> <!-- End of myBoardList.myBoardList -->
			</c:if>
			
			<c:if test="${!empty map.list }"> <!-- 검색했을 때 -->
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
			</c:if>	
		</table> <!-- End of myBoardList Table -->
		</div> <!-- End of scroll -->
		<div class="category">
			<div class="boardViewCount" style="overflow:auto; height:300px;">
				<p class="info">${usrNick.usrID }님의 리뷰 현황입니다.</p>
				
				<table class="myRegionReview" border="1">
					<tr>
						<th>여행지</th> <!-- RegionName -->
						<th>별점</th>	<!-- reviewStar -->
						<th>작성일자</th> <!-- reviewDate -->
						<th>코멘트</th> <!-- reviewContent -->
						<th>삭제하시겠습니까?</th>
					</tr>
					<c:if test="${!empty myRegionReview }">
						<c:forEach items="${myRegionReview }" var="regionReview">
							<tr>
								<td>${regionReview['regionName']}</td>
								<td>${regionReview['regionStar']}</td>
								<td style="width: 30%; font-size: 15px;">
											${regionReview['reviewDate']}
								</td>
								<td style="width: 30%; font-size: 15px;">
									<label>
										<a href="region/detailRegion.do?regionIdx=${regionReview['regionIdx']}">
											${regionReview['reviewContent']}
										</a>
									</label>	
								</td>
								<td>
									<button class="delete" onclick='location.href="deleteMyReview.do?replyIdx=${list.replyIdx}"'>
										삭제하기!
									</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
						<c:if test="${empty myRegionReview }">
							<tr>
								<td colspan="4"> 작성된 리뷰가 없습니다 </td>
							</tr>
						</c:if>
				</table><!-- End of myRegionReview -->
			</div>	<!-- End of regionReview -->
		</div> <!-- End of category -->
	</div> <!-- End of myPage form -->

</body>
</html>