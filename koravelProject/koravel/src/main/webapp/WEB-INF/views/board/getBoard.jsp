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

	<!-- 날씨API -->
	<!-- 환율API -->
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
<title>Insert title here</title>
</head>
<body>

	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String usrID = null;
		if(session.getAttribute("usrID") != null){
			usrID = (String)session.getAttribute("usrID");
		}
	%>
	
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
			<div class="col-8"><input type="text" disabled class="col-12" disabled name="boardKeyword" id="boardKeyword" value="${board.boardKeyword }"></div>
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
						
						<textarea class="col-6 h-100 contentBox" readonly name="boardContent1" id="boardContent1">${board.boardContent1} <c:out value="${regionvolist1}"></c:out></textarea>
						<div class="col-4 h-100">
							<div class="row">${regionSL}</div>
							<div id="map" style="width:100%;height:350px;"></div>
							
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7179d173530d8472472a1bedb86913dd"></script>
<script charset="UTF-8" src="http://t1.daumcdn.net/mapjsapi/js/main/4.4.3/kakao.js"></script>				

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = {
        center : new daum.maps.LatLng(37.57755979, 126.9763106), // 지도의 중심좌표
        level : 5
    // 지도의 확대 레벨
    };
 
    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
 	
    // 마커를 표시할 위치와 title 객체 배열입니다 
    
    var positions = [];
    positions.push({title : "경복궁",
        latlng : new daum.maps.LatLng(37.57755979, 126.9763106)})
    positions.push({title : "광화문",
        latlng : new daum.maps.LatLng(37.57655924, 126.9749572)})
    positions.push({title : "독도",
        latlng : new daum.maps.LatLng(37.24733767, 131.8638554)})

 	// 첫번째, 마지막 마커 이미지의 이미지 크기 입니다
    var imageSizeF = new daum.maps.Size(24, 35);
 	// 다음 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(20, 29);
 	// 마지막 마커 이미지의 이미지 크기 입니다
    var imageSizeL = new daum.maps.Size(24, 35);

    for (var i = 0; i < positions.length; i++) {
    	
    	// n번째 마커 이미지의 이미지 주소입니다 + 마커 이미지 다른 거로 수정 예정
        var imageSrc = "resources/images/marker/markerNum"+ i +".png";
 
        if (i == 0){
        	// 첫번째 마커 이미지를 생성합니다    
            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSizeF);
     		
            // 첫번째 마커를 생성합니다
            var marker = new daum.maps.Marker({
                map : map, // 마커를 표시할 지도
                position : positions[i].latlng, // 마커를 표시할 위치
                title : positions[i].title,
                image : markerImage // 마커 이미지 
            });
        }
        else if (i+1 == positions.length){
        	// 다음 마커 이미지를 생성합니다
            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSizeL);
     		
            // 마커를 생성합니다
            var marker = new daum.maps.Marker({
                map : map, // 마커를 표시할 지도
                position : positions[i].latlng, // 마커를 표시할 위치
                title : positions[i].title,
                image : markerImage // 마커 이미지 
            });
        }
        else {
        	// 다음 마커 이미지를 생성합니다    
            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
     		
            // 마커를 생성합니다
            var marker = new daum.maps.Marker({
                map : map, // 마커를 표시할 지도
                position : positions[i].latlng, // 마커를 표시할 위치
                title : positions[i].title,
                image : markerImage // 마커 이미지 
            });
        }
    }

	var linePath;
	var lineLine = new daum.maps.Polyline();
	var distance;

	for (var i = 0; i < positions.length; i++) {
		if (i != 0) {
			linePath = [ positions[i - 1].latlng, positions[i].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
		}
		;
		lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다

		var drawLine = new daum.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : linePath,
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		
		distance = Math.round(lineLine.getLength());
		displayCircleDot(positions[i].latlng, distance);
	}

	function displayCircleDot(position, distance) {
		if (distance > 0) {
			// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			var distanceOverlay = new daum.maps.CustomOverlay(
			        {
			            content : '<div class="dotOverlay">거리 <span class="number">'
			                    + distance + '</span>m</div>',
			            position : position,
			            yAnchor : 1,
			            zIndex : 2
			        });
			
			// 지도에 표시합니다
			distanceOverlay.setMap(map);
		}
	}
</script>

<!-- 샘플 끝 -->

<!--  
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = {
    center : new daum.maps.LatLng(37.57755979, 126.9763106), // 지도의 중심좌표
    level : 5
// 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [];
<c:forEach items="${regionvolist }" var="region">
	var makePosition = {title : region.regionName, latlng : new daum.maps.LatLng(region.regionY, region.regionX)};
	positions.push(makePosition)
</c:forEach>

// 첫번째, 마지막 마커 이미지의 이미지 크기 입니다
var imageSizeF = new daum.maps.Size(24, 35);
// 다음 마커 이미지의 이미지 크기 입니다
var imageSize = new daum.maps.Size(20, 29);
// 마지막 마커 이미지의 이미지 크기 입니다
var imageSizeL = new daum.maps.Size(24, 35);

for (var i = 0; i < positions.length; i++) {

	// n번째 마커 이미지의 이미지 주소입니다 + 마커 이미지 다른 거로 수정 예정
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
    if (i == 0){
    	// 첫번째 마커 이미지를 생성합니다    
        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSizeF);

        // 첫번째 마커를 생성합니다
        var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title,
        });
    }
    else if (i+1 == positions.length){
    	// 다음 마커 이미지를 생성합니다
        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSizeL);

        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title,
        });
    }
    else {
    	// 다음 마커 이미지를 생성합니다    
        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title,
            image : markerImage // 마커 이미지 
        });
    }
}

var linePath;
var lineLine = new daum.maps.Polyline();
var distance;

for (var i = 0; i < positions.length; i++) {
    if (i != 0) {
        linePath = [ positions[i - 1].latlng, positions[i].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
    }
    ;
    lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다

    var drawLine = new daum.maps.Polyline({
        map : map, // 선을 표시할 지도입니다 
        path : linePath,
        strokeWeight : 3, // 선의 두께입니다 
        strokeColor : '#db4040', // 선의 색깔입니다
        strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
        strokeStyle : 'solid' // 선의 스타일입니다
    });

    distance = Math.round(lineLine.getLength());
    displayCircleDot(positions[i].latlng, distance);
     
}

function displayCircleDot(position, distance) {
    if (distance > 0) {
        // 마지막 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
        var distanceOverlay = new daum.maps.CustomOverlay(
                {
                    content : '<div class="dotOverlay">거리 <span class="number">'
                            + distance + '</span>m</div>',
                    position : position,
                    yAnchor : 1,
                    zIndex : 2
                });

        // 지도에 표시합니다
        distanceOverlay.setMap(map);
    }
}
</script>
  -->

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->
</body>
</html>