<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/search.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

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
$(function(){
	 var availableTags = ["오금공원","OCI미술관","경복궁","경찰박물관","경희궁","광장 시장","광화문","국립고궁박물관","국립민속박물관","국립민속박물관 어린이박물과","국립어린이과학관","김종영미술관","낙산 성곽길","낙산공원","다이나믹메이즈 인사동","대림미술관","대학로","대한민국역사박물관","돈의문박물관마을","라바타운","마로니에공원","뮤지엄김치간","박물관은살아있다 인사동점","백사실계곡","보신각","복촌 한옥마을","북악산","북악스카이웨이","산마루 놀이터","삼청공원","서울공예박물관","서울역사박물관","서촌마을","석파정","석파정서울미술관","성곡미술관","세운옥상","세종마을음식문화거리","수성동계곡","쌈지길","아르코미술관","어둠속의대화","와룡공원","운현궁","윤동주문학관","이화동 벽화마을","익선동 한옥거리","인사동문화의거리","인왕산","일민미술관","조계사","종로귀금속거리","종묘","종묘광장공원","창경궁","창덕궁","청계천","청와대사랑채","토탈미술관","통인시장","한양도성 박물관","환기미술관","흥인지문공원","남대문시장","남산","남산골한옥마을","남산공원백범광장","남산예장공원","남산케이블카","덕수궁","동대문디자인플라자","동대문역사문화공원","매봉산공원","명동거리","문화역서울 284","방산시장","서소문성지역사박물관","서소문역사공원","서울 시립 미술관","서울광장","서울로7017","손기정체육공원","숭례문","신당동떡볶이타운","안중근의사기념관","을지로노가리골목","인현시장","장충단공원","정동공원","정동길","청계광장","평화시장","한국은행 화폐박물관","훈련원공원","N서울타워","경리단길","국립중앙박물관","국립중앙박물관 어린이 박물관","국립한글박물관","남산서울타워","남산야외식물원","리움미술관","용산가족공원","용산역광장","이촌 한강공원","이태원 관광특구","이태원앤틱가구거리","이태원퀴논길","전쟁기념관","한국이슬람교 서울중앙성원","한남동카페거리","해방촌","회나무길","효창공원","후암동108계단","달맞이봉공원","디뮤지엄","마장축산물시장","서울숲","서울하수도과학관","성수동카페거리","응봉산","뚝섬 아름다운나눔장터","뚝섬유원지","뚝섬한강공원","서울상상나라","서울어린이대공원","아차산생태공원","어린이대공원","테크노마트하늘공원","홍릉시험림(홍릉숲)","망우리공원","볼화산옹기테마공원","봉수대공원","사가정공원","용마공원","용마랜드","용마산","용마폭포공원","중랑장미공원","중랑천길","중랑캠핑숲","간송미술관","길상사","북정마을","의릉","한국가구박물관","도선사","북서울꿈의숲","솔밭근린공원","화계사","다락원체육공원","도봉산","둘리뮤지엄","발바닥공원","서울창포원","연산군묘","초안산근린공원","로보카폴리어린이교통공원","벽운계곡","불암산","서울생활사박물관","서울시립과학관","서울시립북서울미술관","수락산","화랑대 철도공원","사비나미술관","삼천사계곡","연신내로데오거리","은평역사한옥박물관","은평평화공원","은평한옥마을","진관사","딜쿠샤","서대문 안산","서대문독립공원","서대문자연사박물관","서대문형무소역사관","홍제동 개미마을","홍지문 및 탕춘대성","DMC홍보관","경의선숲길","경의선책거리","공덕동족발골목","난지 한강공원","난지천공원","노을공원","마포새빛문화숲","망원 한강공원","망원시장","상암문화광장","서울 트릭아이뮤지엄","서울함 공원","월드컵공원","테이블에이 동물원","평화의공원","하늘공원","홍익문화공원","계남근린공원","서서울호수공원","양천공원","파리공원","강서 한강공원","강서한강공원강서습지생태공원","겸재정선미술관","구암근린공원","국립항공박물관","서울식물원","우장산","충우곤충박물관","허준박물관","고척근린공원","구로거리공원","푸른수목원","항동철길","63아트","문래창작촌","선유도공원","씨랄라 워터파크","양화 한강공원","여의도 샛강생태공원","여의도 이랜드크루즈","여의도공원","여의도물빛광장","영등포공원","윤중롭벚꽃길","여의도 한강공원","사육신역사공원","용양봉저정공원","낙성대공원","서울시립남서울미술관","구룡산","국립중앙도서관","그라스정원","몽마르뜨공원","반포 한강공원","서래마을","서래섬","서초문화예술공원","세빛섬","양재근린공원","양재시민의숲","양재천근린공원","예술의전당 한가람미술관","예술의전당서예박물관","우면산","잠원 한강공원","K현대미술관","가로수길","대모산","도산공원","마루공원","봉은사","서울선릉과정릉","스타필드 코엑스몰","압구정로데오거리","양재천","역삼공원","일원에코파크","청담동명품거리","코엑스","포스코미술관","학동공원","현대모터스튜디오서울","호림박물관 신사분관","가락시장","롯데월드","방이동먹자골목","뽀로로파크 잠실롯데점","서울스카이","석촌호수","송파 파크하비오 워터파크","송파둘레길탄천길","송파책박물관","아시아공원","올림픽공원","워터킹덤 & 스파","잠실 한강공원","키자니아 서울","한미사진미술관","한성백제박물관","고덕수변생태공원","광나루 한강공원","길동자연생태공원","서울 암시동 유적","일자산허브천문공원","국제시장","부산영화체험박물관","용두산공원 부산타워","용두산공원","자갈치시장","동아대학교 석당박물관","부산 송도해수욕장","송도용궁구름다리","초량전통시장","국립해양박물관","태종대","흰여울문화마을","부산시민공원","부산시립박물관","오륙도","고은사진미술관","부산시립미술관","송정해수욕장","씨라이프 부산 아쿠아리움","좌동재래시장","해운대 해수욕장","감천문화마을","다대포 꿈의 낙조분수","다대포해수욕장","부산 감천문화마을 하늘마루전망대","광안대교","광안리해수욕장","국립부산과학관","김광석 다시그리기길","대구 근대화골목","대구 서문시장","서문시장 야시장","성동시장","대구미술관","수성못 유원지","아르떼 수성랜드","두류공원","국립대구과학관","힐크레스트","마이랜드","신포국제시장","영종도","월미도","인천 차이나타운","자유공원","송도 센트럴파크","인천시립박물관","소래포구","인천어린이과학관","강화 원도심 스토리워크","국립아시아문화전당","광주 사직공원","얄임동 역사문화마을","광주광역시립미술관","광주패밀리랜드","무등산국립공원","대전오월드","대전시립미술관","보라매공원","장태산자연휴양림","국립중앙과학관","계족산 황톳길","태화강 십리대숲","울산대공원","울산박물관","태화강 국가정원","대왕암공원","간절곶 소망길","영남알프스","울주 대골리 반구대 암각화","국립세종수목원","세종호수공원 일원","수원화성","수원화성박물관","광교호수공원","율동공원","아일랜드캐슬","안양워터랜드","웅진플레이도시","광명동굴","단원미술관","경기도미술관","북한산국립공원","통일 워터파크","아람미술관","일산호수공원","원마운트","과천 서울대공원","국립과천과학관","국립현대미술관 과천관","서울대공원","서울둘레길","서울랜드","스타힐리조트","아쿠와조이","천마산","월곶 에코피아 워터파크","의왕조류생태과학관","철도박물관","양지파인리조트스키장","캐리비안베이","한택식물원","호암미술관","경기도어린이박물관","한국민속촌","도라전망대","동마기업 평화랜드","미메시스 아트 뮤지엄","벽초지 수목원","파주 임진각","하니랜드","헤이리 예술마을","설봉공원","이천시립월전미술관","안성팜랜드","하피랜드","곤지암 스키장","곤지암리조트눈썰매장","광주 남한산성","광주 화담숲","남한산성 북문","영은미술관","화담숲","나리공원(양주)","두리랜드","회암사지박물관","베어스타운 스키장","산림청 국립수목원 (광릉 수목원)","포천 아트밸리","포천 허브 아일랜드","양섬공원","연천 한탄강 관광지","가평 아침고요수목원","꿈의동산","별비치워터파크","아이언워터파크클럽","아침고요수목원","아토믹 워터파크","웨이크베이리조트","가평 리버랜드수상레저","청평호","양평 두물머리","양평군립미술관","양평들꽃수목원","골든몽키","남이섬","애니메이션 박물관","엘리시안 강촌 스키장","제이드가든 수목원","남이섬","간현관광지","뮤지엄 산","오크밸리 스키장","원주 뮤지엄 산","원주 소금산 출렁다리","강릉 주문진항","강릉 커피거리","통일안보공원","주문진항","참소리축음기에디슨과학박물관","롯데리조트 속초 워터파크","설악워터피아","삼척 대이리동굴지대","해신당공원","오션월드","홍천 비발디파크","웰리힐리파크","태백산맥","휘닉스 평창","대관령","발왕산","봉평전통시장","알펜시아리조트스키장&알파인코스터","오션700","평창 대관령","피크아일랜드","허브나라농원","휘닉스 블루캐니언","가리왕산","하이원 리조트","하이원 리조트","하이원스키장","설악산 국립공원","원대리 자작나무 숲","인제 원대리 자작나무숲","쏠비치아쿠아월드","청남대","청주 청남대","청주고인쇄박물관","제천 의림지와 제림","청풍호반케이블카","속리산국립공원","괴산 산막이옛길","고수동굴","단양 만천하스카이워크","단양강 잔도","소백산맥","독립기념관","천안상록리조트아쿠아피아","천안홍대용과학관","계룡산","공주 공산성","송산리 고분군","공주 무령왕릉과 왕릉원","국립공주박물관","석장리박물관","대천 해수욕장","세계꽃식물원","온양민속박물관","외암민속마을","장영실과학관","삽교호놀이동산","아미미술관","서대산드림리조트","관북리유적","국립부여박물관","부소산성","백제문화단지","금강하구둑놀이동산","서천 국립생태원","스플라스 온천 워터파크","예당호 출렁다리","예산 황새공원","꽃지 해수욕장","안면도쥬라기박물관","태안 신두리 해안사구","태안 안면도","태안해안국립공원","전북 전주 한옥마을","덕진공원","군산 시간여행 마을","서동공원","익산 미륵사지","익산보석박물관","내장산","내장산국립공원","옥정호 구절초테마공원","남원시립김병종미술관","아쿠아틱파크 아마존","전북도립미술관","마이산도립공원","덕유산","무주 덕유산리조트 스키장","무주 태권도원","태권도원","변산아쿠아월드","목포 자연사 박물관","목포 해상케이블카 북항승강장","돌산공원","디오션워터파크","여수 엑스포 해양공원","순천만 국가정원","순천만습지","담양 죽녹원","죽녹원","곡성 섬진강 기차마을","힐링파크 쑥섬쑥섬","대한다원 보성녹차밭","화순 아쿠아나 금호리조트","강진 가우도","해남 미황사","해남공룡박물관","월출산","월출산국립공원","대한불교조계종 백양사","퍼플교","홍도","송도 해수욕장","포항 운하","내연산","포항시립미술관","대릉원","동궁과 월지","불국사","석굴암","경주월드","국립경주박물관","보문관광단지","불국사","블루원워터파크","천마총","첨성대","경주월드캘리포니아비치","황리단길","병산서원","안동 하회마을","금오랜드","부석사","영주 부석사","경천대랜드 눈썰매장","갓바위워터피아온천","경산워터파크 펀펀비치","경상북도팔공산도립공원","팔공산도립공원","주왕산 국립공원","청송 주왕산","영덕 대게거리","가야산국립공원백운분소","국립백두대간수목원","울진 금강소나무숲길","독도","독도박물관","울릉도","경남도립미술관","로봇랜드 테마파크","국립진주박물관","진주성","통영 스카이라인루지","한려해상국립공원","국립김해박물관","롯데워터파크 김해","거제 바람의 언덕","바람의 언덕","오션베이","외도 보타니아","해금강테마박물관","금정산","남부시장","아쿠아환타지아","통도환타지아","우포늪","창녕 우포늪","독일마을","지리산국립공원","합천 해인사","해인사","황매산군립공원","국립 제주박물관","만장굴","제주 불빛정원","제주 비자림","우도","절물자연휴양림","제주 러브랜드","제주 비자림","제주도 민속자연사박물관","제주도립 김창열미술관","제주동문시장","제주월드21","제주특별자치도립미술관","한라산 국립공원","한라수목원","한림공원","감귤박물관","건강과성박물관","마라도","본태박물관","서귀포매일올레시장","섭지코지","성산일출봉","성읍민속마을","세계자동차＆피아노 박물관","신화워터파크","신화테마파크","아쿠아플라넷 제주","여미지 식물원","오설록 티뮤지엄","올레길","정방폭포","제주항공우주박물관","주상절리대","천제연폭포","천지연폭포","카멜리아힐","테디베어박물관"];

	    $( "#tags" ).autocomplete({
	      source: availableTags
	    });
	    function keyword_check(){
	    	  if(document.search.keyword.value==''){ //검색어가 없을 경우  
	    	  alert('검색어를 입력하세요'); //경고창 띄움 
	    	  document.search.keyword.focus(); //다시 검색창으로 돌아감 
	    	  return false; 
	    	  }
	    	  else return true;
	    	 }
});
</script>
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
			<ul class="nav">
				<div class="home">
					<div>
						<a href="#header"><img src="../resources/images/koravel.png" id="koravel"></a>
					</div>
				</div>
				
					<li>
						<form name="search" align="right" style="margin-right:70px;" method = "get"  action ="../search/searchRegion.do" onsubmit="return keyword_check()">
							<input type="text" class="searchbar" placeholder="당신이 가고 싶은 여행지는?" name="searchKeyword">
							<input type="submit" value="search" class="search">
						</form>
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
							<li><a href="../usr/usrLogin.do">${usrNick.getUsrNick() }님 반갑습니다</a></li>
							<li><a href="../usr/usrLogout.do">로그아웃</a></li>
							<li><a href="../myPage/myPage.do">마이페이지</a></li>
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
	</div>
	<!-- header -->
	
	<div class="col-4" name="table" class="main_text0">

		<table class="searchTable" >
			<colgroup>
				<col style="width:9%">
				<col style="width:11%"><!-- img -->
				<col style="width:23%"><!-- regionName -->
				<col style="width:10%"><!-- map -->
				
				<col style="width:20%">
				<col style="width:7%">
			<c:forEach items="${searchResult}" var="region">
				<tr name="content" height=15 >
					<td rowspan="4"></td>
					<!-- 여기 이미지를 서치 링크 region.regionMainImgFile 로 변경 부탁  -->
					<td rowspan="4" align="left" valign="top"><div><img class="searchimg" alt="" src="../resources/images/Board/coffee1.jpg" width="260px"></div></td>
					<td align="left">
						<a href="getBoard.do?boardIdx=${region.regionIdx}" ><font size="5" style="color:#08088A">${region.regionName}</font></a><c:if test="${region.regionStar != '0.0'}">&nbsp;&nbsp;&nbsp;&nbsp;평점 : <font style="color:darkgray">${region.regionStar}</font></c:if></td>
					
					<!-- <td rowspan="3" align="center" valign="top"> -->
					</td>
					<td rowspan="3" valign="top">
						<div id="${region.regionIdx}" class="searchmap" style="width:100%;height:140px;" class="map"></div>					
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57e8c7c1c86eeab41199c3e3df3a8698"></script>
							<script>
												
									var mapContainer = document.getElementById(${region.regionIdx}), // 지도를 표시할 div 
							 				mapOption = {
							       				center: new kakao.maps.LatLng(${region.regionY}, ${region.regionX}), // 지도의 중심좌표
							        			level: 6, // 지도의 확대 레벨
							        			mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
							   		}; 
							// 지도를 생성한다 
									var map = new kakao.maps.Map(mapContainer, mapOption); 
									var marker = new kakao.maps.Marker({
								   		position: new kakao.maps.LatLng(${region.regionY}, ${region.regionX}), // 마커의 좌표
								    	map: map 
									});
							</script>
				<!-- map 영역 끝 -->
						
					</td>
				</tr>
				<tr height= 11>
					<td>&nbsp;주소 : ${region.regionAddr}</td>
					
					
				</tr>
				<tr valign="top">
					<td style="color:darkgray">&nbsp;&nbsp;&nbsp;
						<c:choose>
        					<c:when test="${fn:length(region.regionInfo) gt 100}">
        					<c:out value="${fn:substring(region.regionInfo, 0, 99)} . . .">
        					</c:out></c:when>
        					<c:otherwise>
        					<c:out value="${region.regionInfo}">
        					</c:out></c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan ="2" height="15">
						<hr   style="color:#FAFAFA"/>
					</td>
				</tr>
				<tr>
					<td/>
					<td colspan="3" valign="top">
						&nbsp;
						<!-- hr style="color:#FAFAFA"/> -->
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
<script>
   const header = document.querySelector("#header");
   const backImg = document.querySelector(".intro_bg")
   const backImgHeight = backImg.getBoundingClientRect().height;
 
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