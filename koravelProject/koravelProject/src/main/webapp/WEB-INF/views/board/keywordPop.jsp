<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- PopUP / AJAX -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
var keywordList = new Array();

function keywordAppend(){
	var keyword = $("#keywordSearch").val();
	
	keywordList.push(keyword);
	var keywordResult = keywordList.toString();
	
	$("#keywordSearch").val("");
	$("#keywordResult").val(keywordResult);
}
function sendKeyword(){
	var sendWord = document.getElementById("keywordResult").value;
	window.opener.document.getElementById("boardKeyword").value = sendWord;
	window.close();
}

</script>

</head>
<body>
	<div class="row">
		<input type='text' class='col-9' name='keywordSearch' id='keywordSearch' placeholder="키워드를 검색하세요" required>

		<div class="col-1"></div>
		<a type="button" class="col-2" href="javascript:" onclick="keywordAppend()">키워드 추가</a>
	</div>
	<div class="row"><br/></div>
	<div class="row">
		<input type='text' disabled class='col-9' name='keywordResult' id='keywordResult'>
		<a type="button" class="col-2" href="javascript:" onclick="sendKeyword()">키워드 설정 완료</a>
	</div>
	
</body>
</html>