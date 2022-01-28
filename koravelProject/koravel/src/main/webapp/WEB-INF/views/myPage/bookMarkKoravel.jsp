<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
<script src="../resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/bookMarkKoravel.css">
</head>
<style>

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
		<font style="font-size: 25px;">
			${usrNick.usrID }님의 나만의 여행지 리스트입니다.<br/>
			내가 가고싶은 여행지 위치를 지도로 확인하실 수 있으며 가고싶은 길은 <strong>길찾기</strong>를 활용해보세요!
		</font>
		<ul id="goToKoravel">

			<li>
				추가하고 싶은 여행지가 있다면
				<img alt="" src="../resources/images/myPage/arrow.jpg">
				<button id="goToReco" onclick='location.href="region/recommand.do"'>나만의 여행지 추가하기!</button>
			</li>
		</ul>
		<div style="overflow:auto; height:250px;">
		<table class="myBoard" border="1">
			<tr>
				<th>사용자</th>
				<th>여행지</th>
				<th>주소</th>
				<th>전화번호</th>
				<th></th>
			</tr>
				<c:forEach items="${myRecoRegion }" var="region">
				<tr>
					<td>${region['readerID']}</td>
					<td>
						<label>
							<a href="region/detailRegion.do?regionIdx=${region['regionIdx']}">
								${region['regionName']}
							</a>
						</label>
					</td>
					<td>${region['regionAddr']}</td>
					<td>${region['regionPhone']}</td>
					<td>
						<button class="delete" onclick='location.href="deleteBkKoravel.do?recoIdx=${region["recoIdx"]}"'>
							삭제하기!
						</button>
					</td>
				</tr>
				</c:forEach>
			
		</table>
		</div><!-- End of scroll -->
	</div> <!-- End of bookMark_Board -->
	
	<div class="mark_recommend">
		<div class="BookMarkList">
		<div class="map1 col-md-6">
			<!-- map 영역 시작 -->
					<div id="map" style="width:100%;height:350px;"></div>					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57e8c7c1c86eeab41199c3e3df3a8698"></script>
					<script>
												
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = {
							        center: new kakao.maps.LatLng(37.5642135, 127.0016985), // 지도의 중심좌표
							        level: 5, // 지도의 확대 레벨
							        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
							    }; 
							// 지도를 생성한다 
							var map = new kakao.maps.Map(mapContainer, mapOption); 
							
							var RecoList = [
								<c:forEach items="${myRecoRegion}" var="list">
									[${list['regionY']}, ${list['regionX']}, 
										'<div class="markerName">${list['regionName']}<a href="https://map.kakao.com/link/to/${list['regionName']},${list['regionY']},${list['regionX']}" style="color:blue" target="_blank">길찾기</a></div>'],
								</c:forEach>
							];
							
							for(var i=0; i < RecoList.length; i++){
								// 지도에 마커를 생성하고 표시한다
								var marker = new kakao.maps.Marker({
								    position: new kakao.maps.LatLng(RecoList[i][0], RecoList[i][1]), // 마커의 좌표
								    map: map // 마커를 표시할 지도 객체
								});
								// 마커 위에 표시할 인포윈도우를 생성한다
								var infowindow = new kakao.maps.InfoWindow({
								    content : RecoList[i][2] // 인포윈도우에 표시할 내용
								});
								// 인포윈도우를 지도에 표시한다
								infowindow.open(map, marker);
							}					
					</script>
				<!-- map 영역 끝 -->
			</div>
		</div> <!-- End of RecommendList -->
	</div> <!-- End of bookMark_recommend -->
</div><!-- 북마크 영역 -->
</body>
</html>