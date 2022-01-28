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

	<!-- Kakao API APP KEY -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46b23103bbef6793e908db1d8cca7e25"></script>
	
	<!-- JqueryCSS -->
	<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	
	<!-- PopUP / AJAX -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>

	<!-- CSS -->
	<link rel="stylesheet" href="../resources/css/boardStyle.css">

<script type="text/javascript">
$(document).ready(function(){
	//alert("게시글 쓰기 준비 안료")
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
	
	$('input#boardTitle').val("");
	
	$('#boardType').change(function() {
		
		var type = $('#boardType option:selected').val();
		if (type == 'family') {
			$('input#boardTitle').val("[가족과 함께]");
		}
		else if (type == 'child') {
			$('input#boardTitle').val("[자녀와 함께]");
		} else {
			$('input#boardTitle').val("[커플 추천]");
		}
	});
}) // .ready(function end
			
	
	
function keywordPopup(){
		window.name = "insertBoardForm";
		var url = "keywordPop.do";
	    var name = "keywordPop";
	    var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	    window.open(url, name, option);
	}; // keywordPopup end
	
function setChildValue(sendWord){
	document.getElementById("#boardKeyword").value = sendWord;
} // setChildValue(sendWord) end 키워드 팝업창에서 작성 완료한 키워드 텍스트 가지고 오기
	
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


/** 아이템을 등록한다. */
function submitItem() {
	var boardContent2 = [];
	
    if(!validateItem()) {
    	return;
    }
    else{
    	$(".itemBox .regionSearch").each(function(index, element){
    		boardContent2.push($(this).val());
    	});
    	$("#boardContent2").val(boardContent2.toString());
    	alert("현재 코스로 적용 되었습니다.");
    	alert(boardContent2.toString());
    }
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
            $(this).attr('start_pos', ui.item.index()); // 기존 순서값을 data-previndex에 저장 
        },
        stop: function(event, ui) {
            var spos = Number(ui.item.index())+1; // index값이 0에서 시작하기 때문에 1 더하기 
            var epos = Number($(this).attr('data-previndex')) + 1;
            var grpno = "${param.grpno}"; // item group key
        }
    });
    
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
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
    reorder(); // 숫자를 다시 붙인다.
}

/** 아이템 박스 작성 */
function createBox() {
    var contents = "<div class='itemBox'>"
                 + "<div class='row' style='float:center;'>"
                 + "<div class='col-1'></div><span class='itemNum'></span>"
                 + "<input type='text' class='col-9 regionSearch' name='item'>"
                 + "</div>"
                 + "</div>";
    return contents;
}
//]]>

</script>
	
<style>
	#sortable { list-style-type: none; margin: 0; padding: 0; width: 400px; }
	#sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
	#sortable li span { position: absolute; margin-left: -1.3em; }
</style>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	

	<!-- header -->
	
	<header style="min-width:1280px; height:200px; margin:auto; background-color: black; ">
	
	</header>


	<!-- 글 작성 메인 페이지 영역 시작 -->
	
	<main>
	
	<div>

		<form action="saveBoard.do" method='post' enctype="multipart/form-data">
		
			<%
		session.getAttribute("usrNick");
	%>
			
			<div class="row" style="background-color: white;">
				<div class="col-1"></div>
				<input type="hidden" name="boardWriter" value="${usrNick.usrID }">
				<mark class="col-1">${usrNick.usrID }</mark>
				<input type="text" class="col-7" name="boardTitle" id="boardTitle" placeholder="제목을 작성해 주세요." value="">
				<select class="col-2" name="boardType" id="boardType">
					<option value="family" selected>가족과 함께</option>
					<option value="child">자녀와 함께</option>
					<option value="couple">커플 추천</option>
				</select>
			</div>
			
			<div class="row">
				<div class="col-1"></div>
				<!-- 키워드 선택 팝업 -->
				<a class="col-1" href="javascript:;" onclick="keywordPopup()" ><img src="../resources/images/Board/key.PNG" style="height:30px;"/></a>
				<!-- 키워드 팝업 결과값 노출 -->
				<input type="text" class="col-7" disabled name="boardKeyword" id="boardKeyword" value="선택된 키워드가 없습니다.">
				<select class="col-2" name="boardCat" id="boardCat">
					<option value="free" selected>자유게시판</option>
					<option value="course">나만의 코스 공유</option>
					<option value="region">여행 정보 공유</option>
				</select>
				<div class="col-1">
				</div>
			</div>
			
			<div class="row">
				<br/>
			</div>
			
			<!-- 자유게시판 -->
			<div class="row" id="freeBoard">
				<div class="col-1"></div>
			
				<div class="col-10">
					<textarea class="w-100 h-100 contentBox" name="boardContent1" id="boardContent1" placeholder="자유롭게 글을 남겨 주세요"></textarea>
				</div>
				
				<div class="col-1"></div>
			</div>
			
			
			<!-- 코스 게시판 -->
			<div class="row" id="courseBoard">
				<div class="col-1"></div>
				
				<div class="col-6">
					<textarea class="w-100 p-12 h-100 contentBox" name="boardContent1" id="boardContent1" placeholder="선택하신 코스에 대해 얘기 해주세요."></textarea>
				</div>
				<div class="col-4">
					<div class="row">
					    <div class="col-5" style="float:left;">아이템 추가 : </div>
					    <div class="col-7" style="clar:both;">
					        <input type="button" class="button" id="addItem" value="추가" onclick="createItem();" />
					        <input type="button" class="button" id="applyItem" value="적용" onclick="submitItem();" />
					    </div>
					</div>
					<div class="row"><input class="col-10" type="text" disabled name="boardContent2" id="boardContent2" placeholder="코스를 설정해주세요"></div>
					<div class="row"><br/></div>
					<div id="itemBoxWrap"></div>
				</div>
				
				<div class="col-1"></div>
			</div>
			
			
			<!-- 관광지 게시판 -->
			<div class="row" id="regionBoard">
				<div class="col-1"></div>
				
				<div class="col-6" >
					<textarea class="w-100 p-12 h-100 contentBox" name="boardContent1" id="boardContent1" placeholder="관광지에 대해 설명해 주세요"></textarea>
				</div>
				<div class="col-4">
					<div style="margin:auto" id="usrFotoZone">
						<div class="row">
							<input type="text" class="col-12" name="boardRegion" id="boardRegionSelect" placeholder="선택된 관광지가 없습니다.">
						</div>
						<div class="row"><br/></div>
						<input type="file" class="w-100 p-12 h-100" maxlength="60" size="40" name="file" id="image" onchange="setThumbnail(event);"/>
						<div id="image_container" style="height:350px"></div>
					</div>
				</div>
				
				<div class="col-1"></div>
			</div>
			
			<div class="row">
				<br/>
			</div>
			
			<div class="row">
				
				<div class="col-1">
					<br/>
				</div>
				
				<div class="col-2">
					<button class="button" onclick='location.href="getBoardList.do"'>글 목록</button>
				</div>
				
				<div class="col-1">
					<br/>
				</div>
				
			
				<div class="col-5">
					<br/>
				</div>
				
				<input class="col-2 button" type="submit" value="새글 등록"/>
				
				<div class="col-1">
					<br/>
				</div>
			</div>
		</form>
		
		<div class="row">
				<br/>
		</div>
		
		<div>
			
		</div>
		
	
	</div>
	
	</main>
	
	<!-- 글 작성 메인 페이지 영역 끝 -->
	
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
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->
</body>
</html>