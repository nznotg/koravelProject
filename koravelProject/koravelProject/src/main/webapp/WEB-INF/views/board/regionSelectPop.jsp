<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 코스 선택을 위한 팝업 페이지 -->

<title>Insert title here</title>

<!-- PopUP / AJAX -->
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<!-- CSS -->
<style>
.itemBox {
    border:solid 1px black;
    width:400px;
    height:50px;
    padding:10px;
    margin-bottom:10px;
}
.itemBoxHighlight {
    border:solid 1px black;
    width:400px;
    height:50px;
    padding:10px;
    margin-bottom:10px;
    background-color:yellow;
}
.deleteBox {
    float:right;
    display:none;
    cursor:pointer;
}

#sortable { list-style-type: none; margin: 0; padding: 0; width: 400px; }
#sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
#sortable li span { position: absolute; margin-left: -1.3em; }
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<script type="text/javascript">
	//<![CDATA[
	/** 아이템을 등록한다. */
	function submitItem() {
	    if(!validateItem()) {
	    	alert("!validateItem");
	    	return;
	    }
	    opener.parent.itemBoxWrapSet();
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
	    // 숫자를 다시 붙인다.
	    reorder();
	}
	
	/** 아이템 박스 작성 */
	function createBox() {
	    var contents = "<div class='itemBox'>"
	                 + "<div style='float:left;'>"
	                 + "<span class='itemNum'></span> "
	                 + "<div class='row'><input type='text' name='regionSearch' id='regionSearch' style='width:300px;'/></div>"
	                 + "<div class='row'><input type='text' disabled name='boardRegion' id='boardRegion' value='${region.regionAddr}' style='width:300px;'/></div>"
	                 + "</div>"
	                 + "</div>";
	    return contents;
	}
	//]]>
</script>

</head>
<body>

	<div>
	    <div style="float:left;width:100px;">아이템 추가 : </div>
	    <div style="clar:both;">
	        <input type="button" id="addItem" value="추가" onclick="createItem();" />
	        <input type="button" id="submitItem" value="제출" onclick="submitItem();" />
	    </div>
	</div>
	<br />
	<div id="itemBoxWrap"></div>

</body>
</html>