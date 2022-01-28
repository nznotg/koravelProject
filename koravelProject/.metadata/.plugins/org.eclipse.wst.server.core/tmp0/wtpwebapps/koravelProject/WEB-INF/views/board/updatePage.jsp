<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 게시글 수정을 위한 페이지 -->
	
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

	<!-- PopUP / AJAX -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="../resources/css/boardStyle.css">
	
	<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

	<script type="text/javascript">
		function keywordPopup(){
			window.name = "insertBoardForm";
			var url = "keywordPop.do";
		    var name = "keywordPop";
		    var option = "width = 500, height = 500, top = 100, left = 200, location = no";
		    window.open(url, name, option);
		}; // keywordPopup end
		
		function setChildValue(sendWord){
			document.getElementById("#boardKeyword").value = sendWord;
		}
		
		// 여행정보공유-대상 관광지 선택
		function regionSelect(){
			
			
		}; // regionSelect end
		
		$(document).ready(function(){
			var boardCat = $('#boardCat');
			
			$("#boardCat").val(boardCat).prop("selected", true);
			
			$('#courseBoard').hide();
			$('#regionBoard').hide();
		
			$('#boardCat').change(function() {
				var state = $('#boardCat option:selected').val();
				if (state == 'course') {
					$('#freeBoard').hide();
					$('#courseBoard').show();
					$('#regionBoard').hide();
				}
				else if (state == 'region') {
					$('#freeBoard').hide();
					$('#courseBoard').hide();
					$('#regionBoard').show();
				} else {
					$('#freeBoard').show();
					$('#courseBoard').hide();
					$('#regionBoard').hide();
				}
			});
		})
		
		function setThumbnail(event) {
			$("#image_container").empty();
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				document.querySelector("div#image_container").appendChild(img);
			};
			reader.readAsDataURL(event.target.files[0]);
		}
		
		//<![CDATA[
		/** 아이템을 등록한다. */
		function submitItem() {
		    if(!validateItem()) {
		    	alert("!validateItem");
		    	return;
		    }
		    
		    alert("등록");
		}
		
		/** 아이템 체크 */
		function validateItem() {
		    var items = $("input[type='text'][name='regionSearch']");
		    if(items.length == 0) {
		        alert("작성된 아이템이 없습니다.");
		        return false;
		    }
		
		    var flag = true;
		    for(var i = 0; i < items.length; i++) {
		        if($(items.get(i)).val().trim() == "") {
		            flag = false;
		            alert("내용을 입력하지 않은 항목이 있습니다.");
		            break;
		        }
		    }
		
		    return flag;
		}
		
		/** UI 설정 */
		$(function() {
		    $("#itemBoxWrap").sortable({
		        placeholder:"itemBoxHighlight",
		        start: function(event, ui) {
		            ui.regionSearch.data('start_pos', ui.regionSearch.index());
		        },
		        stop: function(event, ui) {
		            var spos = ui.regionSearch.data('start_pos');
		            var epos = ui.regionSearch.index();
					      reorder();
		        }
		    });
		    //$("#itemBoxWrap").disableSelection();
		});
		
		/** 아이템 순서 조정 */
		function reorder() {
		    $(".itemBox").each(function(i, box) {
		        $(box).find(".itemNum").html(i + 1);
		    });
		}
		
		/** 아이템 추가 */
		function createItem() {
		    $(createBox())
		    .appendTo("#itemBoxWrap")
		    .hover(
		        function() {
		            $(this).css('backgroundColor', '#f9f9f5');
		            $(this).find('.deleteBox').show();
		        },
		        function() {
		            $(this).css('background', 'none');
		            $(this).find('.deleteBox').hide();
		        }
		    )
				.append("<div class='deleteBox'>[삭제]</div>")
				.find(".deleteBox").click(function() {
		        var valueCheck = false;
		        $(this).parent().find('input').each(function() {
		            if($(this).attr("name") != "type" && $(this).val() != '') {
		                valueCheck = true;
		            }
		        });
		
		        if(valueCheck) {
		            var delCheck = confirm('입력하신 내용이 있습니다.\n삭제하시겠습니까?');
		        }
		        if(!valueCheck || delCheck == true) {
		            $(this).parent().remove();
		            reorder();
		        }
		    });
		    // 숫자를 다시 붙인다.
		    reorder();
		}
		
		/** 아이템 박스 작성 */
		function createBox() {
		    var contents = "<div class='itemBox'>"
		                 + "<div class='row' style='float:center;'>"
		                 + "<div class='col-1'></div><span class='itemNum col-1'></span>"
		                 + "<input type='text' class='col-9' name='regionSearch' id='regionSearch'>"
		                 + "</div>"
		                 + "</div>";
		    return contents;
		}
		//]]>
	</script>

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
<header style="min-width:1280px; height:200px; margin:auto; background-color: black; ">

</header>


<!-- 게시판 메인 페이지 영역 시작 -->

<main>
<div style="max-width:1000px; margin:auto;">

	<div class="row">
		<br/>
	</div>

<form action="updateBoard.do" method="post">
	<div class="row">
		<input type="hidden" name="boardCat" id="boardCat" value="${board.boardCat }"/>
		<input type="hidden" name="boardIdx" class="col-3" value="${board.boardIdx}"/>
		<input type="text" name="boardTitle" class="col-8" value="${board.boardTitle }"/>
	</div>
	
	<div class="row">
		<br/>
	</div>
	
	<div class="row">
		<div class="col-9">${board.boardKeyword }</div>
		<div class="col-3">
			<c:choose>
				<c:when test="${board.boardCat == 'free'}">자유 게시판</c:when>
				<c:when test="${board.boardCat == 'child'}">관광지 추천</c:when>
				<c:when test="${board.boardCat == 'couple'}">코스 추천</c:when>
			</c:choose>
		</div>
	</div>
	
	<div class="row">
		<br/>
	</div>
	
	<!-- 자유게시판 -->
	<div class="row">
		<!-- 관광지 게시판 페이지 -->
		<c:choose >
			<c:when test="${board.boardCat == 'region'}"> 
				<div class="row" id="regionBoard">
					<div class="col-1"></div>
					
					<div class="col-6" >
						<textarea class="col-6 h-100" name="boardContent1" id="boardContent1">${board.boardContent1}</textarea>
					</div>
					<div class="col-4">
						<div style="margin:auto" id="usrFotoZone">
							<div class="row">
								<a class="col-4" href="javascript:;" onclick="regionSelect()" ><img src="../resources/images/Board/key.PNG" style="height:30px;"/></a>
								<input type="text" class="col-8" name="boardRegionSelect" id="boardRegionSelect" value="${board.boardRegion }">
							</div>
							<div class="row"><br/></div>
							<input type="file" class="w-100 p-12 h-100" maxlength="60" size="40" id="image" onchange="setThumbnail(event);"/>
							<div id="image_container" style="height:350px">
								<img src='D/workspace/springWeb/koravle/koravle/src/main/webapp/resources/upload/${board.b_realfname}'
								width='400' height='400'>
							</div>
						</div>
					</div>
					
					<div class="col-1"></div>
				</div>
			</c:when>
			<!-- 코스 게시판 페이지 -->
			<c:when test="${board.boardCat == 'course'}"> 
				<div class="row" id="courseBoard">
					<div class="col-1"></div>
					
					<textarea class="col-6 h-100" name="boardContent1" id="boardContent1">${board.boardContent1}</textarea>
					<div class="col-4">
						<div class="row">
						    <div class="col-5" style="float:left;">아이템 추가 : </div>
						    <div class="col-7" style="clar:both;">
						        <input type="button" id="addItem" value="추가" onclick="createItem();" />
						        <input type="button" id="submitItem" value="제출" onclick="submitItem();" />
						        <input type="hidden" id="boardContent2" value="noCourse" />
						    </div>
						</div>
						<div class="row"><br/></div>
						<div id="itemBoxWrap">
							<c:forEach items="${regionCourse}" var"course">
								<div class='itemBox'>
					                <div class='row' style='float:center;'>
						                <div class='col-1'></div>
						                <span class='itemNum col-1'>${course.itemNum }</span>
						                <input type='text' class='col-9' name='regionSearch' id='regionSearch' value="${course.region}">
					                </div>
				                </div>
							</c:forEach>
						</div>
					</div>
					
					<div class="col-1"></div>
				</div>	
			</c:when>
			
			<!-- 자유 게시판 -->
			<c:when test="${board.boardCat != 'course' && ${board.boardCat != 'region'}">
				<textarea class="col-12 h-100" name="boardContent1" id="boardContent1">${board.boardContent1}</textarea>
			</c:when>
		
		</c:choose>
	
		<div class="row">
			<br/>
		</div>
		
		<div class="row">
			<button class="col-2" onclick='location.href="insertBoard.do"'>새 글쓰기</button>
			<div class="col-6"></div>
			<button class="col-2" onclick='location.href="deleteBoard.do?boardIdx=${board.boardIdx}"'>삭제</button>
			<input type="submit" class="col-2" value="글 수정"/>
		</div>
	</form>
	

</div>
</main>
<!-- 게시판 메인 페이지 영역 끝 -->

<!-- footer -->

<footer>
	<div class="footer_wrap">
		<img src="../resources/images/koravel.png"><br><br>
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
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

   <!-- Option 2: Separate Popper and Bootstrap JS -->
   <!--
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
   -->
</body>
</html>