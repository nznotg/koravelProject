<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KORAVEL</title>
<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
<script>
	window.onload = function(){
		document.getElementById('upDateReco').onclick = check;
	}
	
	function check(){
		/* var usrmood = $('input[name=usrmood]:checked').val();
		var usrtheme = $('input[name=usrtheme]:checked').val();
		var usrplace = $('input[name=usrplace]:checked').val();
		
		alert("정보가 수정되었습니다.") */
		document.usrRecoUpdate.submit();
	}
</script>
</head>
<style>
.myBoard{
	text-align: center;
	table-layout: auto;
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
.cate{
	list-style: none;
	margin-left: 20px;
	position: relative;
}
.cate > li{
	display: inline;
	margin-left: 30px;
	font-size: 20px;
	position: relative;
	font-size: 25px;
}
.recommendForm {
	text-align: left;
}
.RecoTitle{
	font-size: 30px;
	justify-content: center;
	text-align: center;
	align-content: center;
}
.usrID{
	justify-content: center;
}
.usrID > input{
	border: 0 solid black;
	width:100px;
	font-size: 30px;
	justify-content: center;
	background-color: transparent;
}
p{
	font-size: 20px;
	color: black;
	text-align: center;
}
#survey{
	margin-top: 25px;
	margin-bottom: 20px;
}
</style>
<body>
<%
	session.getAttribute("usrNick");
%>
	<div class="myPageForm">
		<div>
			<img alt="" src="../resources/images/koravel.png" class="koravelImg">
		</div> <!-- End of KoravelImg -->
	<p>언제든지 수정이 가능하며 수정사항에 맞춰 <font color="red">여행지 추천</font>이 달라집니다</p><br>
	<p>※선택사항이 없을 경우 아무것도 체크되어 있지 않습니다.※</p> 
	<form action="usrRecoUpdate.do" id="usrRecoUpdate" method="post" enctype="multipart/form-data">
		<div class="recommendForm">
			<div class="usrID" style="font-size: 30px;">
				사용자 : <input type="text" name="usrID" value="${usrNick.usrID }" readonly="readonly"/> 
			</div>
		<div id="survey">
		<p class="RecoTitle">Mood (좋아하는 분위기는?)</p>
		<ul class="cate">
			<li>
				<label><input type="radio"  name="usrmood" value="조용한" <c:if test="${usrNick.usrmood eq '조용한' }">checked="checked"</c:if>/>조용한</label>	
			</li>
			<li>
				<label><input type="radio" name="usrmood" value="활기찬" <c:if test="${usrNick.usrmood eq '활기찬' }">checked="checked"</c:if>/>활기찬</label>
			</li>
			<li>
				<label><input type="radio" name="usrmood" value="고즈넉한" <c:if test="${usrNick.usrmood eq '고즈넉한' }">checked="checked"</c:if>/>고즈넉한</label>
			</li>
			<li>
				<label><input type="radio" name="usrmood" value="맛있는 냄새" <c:if test="${usrNick.usrmood eq '맛있는 냄새' }">checked="checked"</c:if>/>맛있는 냄새</label>
			</li>
			<li>
				<label><input type="radio" name="usrmood" value="사람이 많은" <c:if test="${usrNick.usrmood eq '사람이 많은' }">checked="checked"</c:if>/>사람이 많은</label>
			</li>
			<li>
				<label><input type="radio" name="usrmood" value="null" <c:if test="${usrNick.usrmood eq 'null' }">checked="checked"</c:if>/>아무거나 상관 없다</label>
			</li>
		</ul>
		</div><!-- end of cate_mood -->
		<hr/>
		
		
		
		<div id="survey">
		<p class="RecoTitle">Theme (원하는 테마, 컨셉은?)</p>
		<ul class="cate">
			<li>
				<label><input type="radio" name="usrtheme" value="커플여행" <c:if test="${usrNick.usrtheme eq '커플여행' }">checked="checked"</c:if>/>커플여행</label>
			</li>
			<li>
				<label><input type="radio" name="usrtheme" value="배낭여행" <c:if test="${usrNick.usrtheme eq '배낭여행' }">checked="checked"</c:if>/>배낭여행</label>
			</li>
			<li>
				<label><input type="radio" name="usrtheme" value="맛집탐방" <c:if test="${usrNick.usrtheme eq '맛집탐방' }">checked="checked"</c:if>/>맛집탐방</label>
			</li>
			<li>
				<label><input type="radio" name="usrtheme" value="가족여행" <c:if test="${usrNick.usrtheme eq '가족여행' }">checked="checked"</c:if>/>가족여행</label>
			</li>
			<li>
				<label><input type="radio" name="usrtheme" value="null" <c:if test="${usrNick.usrtheme eq 'null' }">checked="checked"</c:if>/>아무거나 상관 없다</label>
			</li>
		</ul> 
		
		</div> <!-- end of cate_theme -->
		<hr/>
		
		<div id="survey">
		<p class="RecoTitle">Place (선호하는 장소는?)</p>
		<ul class="cate">
			<li>
				<label><input type="radio" name="usrplace" value="산" <c:if test="${usrNick.usrplace eq '산' }">checked="checked"</c:if>/>산</label>
			</li>
			<li>
				<label><input type="radio" name="usrplace" value="바다" <c:if test="${usrNick.usrplace eq '바다' }">checked="checked"</c:if>/>바다</label>
			</li>
			<li>
				<label><input type="radio" name="usrplace" value="수영장" <c:if test="${usrNick.usrplace eq '수영장' }">checked="checked"</c:if>/>수영장</label>
			</li>
			<li>
				<label><input type="radio" name="usrplace" value="맛집" <c:if test="${usrNick.usrplace eq '맛집' }">checked="checked"</c:if>/>맛집</label>
			</li>
			<li>
				<label><input type="radio" name="usrplace" value="놀이공원" <c:if test="${usrNick.usrplace eq '놀이공원' }">checked="checked"</c:if>/>놀이공원</label>
			</li>
			<li>
				<label><input type="radio" name="usrplace" value="null" <c:if test="${usrNick.usrplace eq 'null' }">checked="checked"</c:if>/>아무거나 상관 없다.</label>
			</li>
		</ul> 
		</div> <!-- end of cate_place -->
			<div class="select" align="center">
				<button onclick='location.href="usrRecoUpdate.do?usrID=${myReco.usrID }"' style="border: none; outline: none;" id="upDateReco">
       				<img alt="" src="../resources/images/login/update1.png" style="border: none; outline: none; width:100px; height: 50px;">
      			</button>
      			<button onclick="javascript:history.back()" style="border: none; outline: none; width:50px; height: 50px; ">
  					<img alt="" src="../resources/images/login/cancel2.png" style="width:100px; height: 50px;">
      			</button>
			</div>
		</div>
	</form>
	</div>
</body>
</html>